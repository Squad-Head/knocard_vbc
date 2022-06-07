import "package:flutter/material.dart";

import '../../components/imagelist.dart';

class PhotoGrid extends StatelessWidget {
  const PhotoGrid({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
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
              photos[index].images,
              fit: BoxFit.cover,
            ),
          ),
        ],
      );
}
