import 'package:flutter/material.dart';
import 'package:knocard_ui/presentation/gallery/desktop_gallery/components/albumlist.dart';

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
                  image: const DecorationImage(
                      image: NetworkImage(
                          'https://images.unsplash.com/photo-1511367734837-f2956f0d8020?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1105&q=80'),
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
