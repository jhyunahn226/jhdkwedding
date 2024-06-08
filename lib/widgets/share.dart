import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:jhdkwedding/constants/constants.dart';
import 'package:jhdkwedding/constants/enum.dart';
import 'package:jhdkwedding/constants/gaps.dart';
import 'package:jhdkwedding/constants/sizes.dart';
import 'package:kakao_flutter_sdk_share/kakao_flutter_sdk_share.dart';

class ShareWidget extends StatelessWidget {
  const ShareWidget({super.key});

  void _onKakaoShare(BuildContext context) async {
    final FeedTemplate defaultFeed = FeedTemplate(
      content: Content(
        title: '안재현 ♡ 김다경',
        description: 'Keep Your Date\n2024.09.06 - Puglia, Italy',
        imageUrl: Uri.parse(
          'https://jdpuymhlqtfpzwbfzvvi.supabase.co/storage/v1/object/public/photos/thumbnail.JPG',
        ),
        link: Link(
          webUrl: Uri.parse('https://jhdkwedding.vercel.app'),
          mobileWebUrl: Uri.parse('https://jhdkwedding.vercel.app'),
        ),
      ),
      buttons: [
        Button(
          title: '초대장 열어보기',
          link: Link(
            webUrl: Uri.parse('https://jhdkwedding.vercel.app'),
            mobileWebUrl: Uri.parse('https://jhdkwedding.vercel.app'),
          ),
        ),
      ],
    );

    bool isKakaoTalkSharingAvailable =
        await ShareClient.instance.isKakaoTalkSharingAvailable();

    if (isKakaoTalkSharingAvailable) {
      //카카오톡 설치 환경
      try {
        Uri uri =
            await ShareClient.instance.shareDefault(template: defaultFeed);
        await ShareClient.instance.launchKakaoTalk(uri);
      } catch (error) {
        context.showErrorSnackBar(message: '$error');
      }
    } else {
      //카카오톡 미설치 환경
      try {
        Uri shareUrl = await WebSharerClient.instance
            .makeDefaultUrl(template: defaultFeed);
        await launchBrowserTab(shareUrl, popupOpen: true);
      } catch (error) {
        context.showErrorSnackBar(message: '$error');
      }
    }
  }

  void _onCopyLink(BuildContext context) {
    Clipboard.setData(
      const ClipboardData(
        text: 'https://jhdkwedding.vercel.app',
      ),
    );
    context.showSnackBar(message: '링크가 복사되었습니다');
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: Sizes.size60,
      color: ColorEnum.darkgrey,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          GestureDetector(
            onTap: () => _onKakaoShare(context),
            behavior: HitTestBehavior.opaque,
            child: Image.asset(
              'assets/icons/kakaotalk.png',
              width: Sizes.size36,
            ),
          ),
          Gaps.h40,
          const VerticalDivider(
            color: ColorEnum.white,
            indent: Sizes.size14,
            endIndent: Sizes.size14,
          ),
          Gaps.h40,
          GestureDetector(
            onTap: () => _onCopyLink(context),
            behavior: HitTestBehavior.opaque,
            child: Image.asset(
              'assets/icons/link.png',
              width: Sizes.size36,
            ),
          ),
        ],
      ),
    );
  }
}
