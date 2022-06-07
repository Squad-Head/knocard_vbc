import 'package:flutter/material.dart';
import 'package:knocard_ui/presentation/gallery/desktop_gallery/desktop_gallery_widgets/components/albumlist.dart';

import '../constant.dart';

class Albumtab extends StatefulWidget {
  const Albumtab({Key? key}) : super(key: key);

  @override
  State<Albumtab> createState() => _AlbumtabState();
}

class _AlbumtabState extends State<Albumtab> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 180,
      child: Center(
        child: ListView.builder(
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          itemCount: albums.length,
          itemBuilder: (BuildContext ctx, int index) => albumImages(index),
        ),
      ),
    );
  }

  Widget albumImages(int index) => Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: <Widget>[
            Container(
              height: 100,
              width: 100,
              decoration: BoxDecoration(
                  border: Border.all(
                    width: 5,
                    color: kTextLightColor,
                  ),
                  shape: BoxShape.circle,
                  image: DecorationImage(
                      image: NetworkImage(albums[index].images),
                      fit: BoxFit.fill)),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Text(albums[index].title),
            )
          ],
        ),
      );
}
