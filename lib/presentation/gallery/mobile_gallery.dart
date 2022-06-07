import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:knocard_ui/presentation/gallery/gallery_image_view.dart';

import '../widgets/k_navbar.dart';
import 'mobile_gallery_widgets/k_albums.dart';

List<String> values = [
  'assets/images/men_1.jpg',
  'assets/images/grid1.png',
  'assets/images/grid2.png',
  'assets/images/grid3.png',
  'assets/images/grid4.png',
  'assets/images/grid5.png',
  'assets/images/grid1.png',
  'assets/images/grid3.png',
  'assets/images/men_1.jpg',
  'assets/images/men_1.jpg',
  'assets/images/grid1.png',
  'assets/images/grid2.png',
  'assets/images/grid3.png',
  'assets/images/grid4.png',
  'assets/images/grid5.png',
  'assets/images/grid1.png',
  'assets/images/grid3.png',
  'assets/images/men_1.jpg',
];

class MobileGalleryPage extends StatelessWidget {
  const MobileGalleryPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              // Container(
              //   decoration: BoxDecoration(
              //     boxShadow: [
              //       BoxShadow(
              //         color: Colors.grey.shade300,
              //         offset: const Offset(0, 2),
              //         blurRadius: 3,
              //         spreadRadius: .5,
              //       ),
              //     ],
              //   ),
              //   child: const KNavbar(),
              // ),
              // SizedBox(height: 5.h),
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      KAlbums(
                          image: 'assets/images/album.png', text: 'Album 1'),
                      KAlbums(
                          image: 'assets/images/album2.png', text: 'Album 2'),
                      KAlbums(
                          image: 'assets/images/album3.png', text: 'Album 3'),
                      KAlbums(
                          image: 'assets/images/album4.png', text: 'Album 4'),
                    ],
                  ),
                  SizedBox(height: 5.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: const [
                      Icon(Icons.post_add_sharp),
                      Icon(
                        Icons.crop_square,
                        color: Color(0xFF9A9A9A),
                      ),
                      Icon(
                        Icons.account_box,
                        color: Color(0xFF9A9A9A),
                      ),
                    ],
                  ),
                  SizedBox(height: 10.h),
                  Container(
                    height: 600,
                    width: double.infinity,
                    color: Colors.black,
                    child: GridView.builder(
                      itemCount: 18,
                      itemBuilder: (context, index) {
                        return Card(
                          child: InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const GalleryImageViewPage()));
                            },
                            child: Image(
                              image: AssetImage(
                                values[index],
                              ),
                            ),
                          ),
                        );
                      },
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
