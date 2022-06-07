import 'package:flutter/material.dart';

import 'desktop_gallery_widgets/components/album_tab.dart';
import 'desktop_gallery_widgets/components/photo_grid.dart';
import 'desktop_gallery_widgets/components/scrole_menu.dart';

class DesktopGallery extends StatelessWidget {
  const DesktopGallery({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Center(
              child: Container(
                constraints: const BoxConstraints(
                  maxWidth: 900,
                ),
                child: ListView(shrinkWrap: true, children: const <Widget>[
                  Albumtab(),
                  scrolemenu(),
                  PhotoGrid(),
                ]),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
