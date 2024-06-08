import 'package:flutter/material.dart';
import 'package:jhdkwedding/constants/enum.dart';
import 'package:jhdkwedding/constants/gaps.dart';
import 'package:jhdkwedding/constants/sizes.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class Gallery extends StatefulWidget {
  const Gallery({super.key});

  @override
  State<Gallery> createState() => _GalleryState();
}

class _GalleryState extends State<Gallery> {
  final supabase = Supabase.instance.client;
  List<Map<String, dynamic>> _photos = [];

  @override
  void initState() {
    super.initState();
    _getDatabase();
  }

  void _getDatabase() async {
    _photos = await supabase.from('photos').select();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          width: Sizes.size60,
          child: Divider(
            color: ColorEnum.black,
          ),
        ),
        Gaps.v10,
        const Text(
          'GALLERY',
          style: TextStyle(
            fontFamily: 'Pretendard',
            fontSize: Sizes.size16,
            fontWeight: FontWeight.w600,
          ),
        ),
        Gaps.v40,
        GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            childAspectRatio: 1,
          ),
          itemCount: _photos.length,
          itemBuilder: (context, index) => Image.network(
            _photos[index]['url'],
            fit: BoxFit.cover,
          ),
        ),
      ],
    );
  }
}
