import 'package:flutter/material.dart';

import '../components/album_tab.dart';
import '../components/photo_grid.dart';
import '../components/scrole_menu.dart';

class DesktopGalleryPage extends StatelessWidget {
  const DesktopGalleryPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          constraints: const BoxConstraints(
            maxWidth: 900,
          ),
          child: ListView(shrinkWrap: true, children: const <Widget>[
            Albumtab(),
            Scrolemenu(),
            PhotoGrid(),
          ]),
        ),
      ),
    );
  }
}
