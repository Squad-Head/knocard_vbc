import "package:flutter/material.dart";
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:knocard_ui/presentation/gallery/desktop_gallery/components/imagelist.dart';

class PhotoGrid extends StatelessWidget {
  const PhotoGrid({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisSpacing: 10.w,
          crossAxisCount: 5,
          mainAxisSpacing: 10,
        ),
        itemCount: photos.length,
        itemBuilder: (BuildContext ctx, int index) {
          return imageBuild(index);
        });
  }

  Widget imageBuild(int index) => Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 5),
            child: Text(photos[index].title),
          ),
          Expanded(
            child: Image.network(
              'https://images.unsplash.com/photo-1511367734837-f2956f0d8020?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1105&q=80',
              fit: BoxFit.cover,
            ),
          ),
        ],
      );
}
