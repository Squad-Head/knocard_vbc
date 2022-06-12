import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../widgets/k_navbar.dart';

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

class GalleryImageViewPage extends HookConsumerWidget {
  final List<String> images;
  final int index;
  const GalleryImageViewPage(
      {Key? key, required this.images, required this.index})
      : super(key: key);

  @override
  Widget build(BuildContext context, ref) {
    final imageIndex = useState(index);
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.shade300,
                      offset: const Offset(0, 2),
                      blurRadius: 3,
                      spreadRadius: .5,
                    ),
                  ],
                ),
                child: const KNavbar(),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Draggable(
                    feedback: Container(
                      height: 350.h,
                      width: double.infinity,
                      color: Colors.grey,
                      child: Image(
                        image: AssetImage(
                          // 'assets/images/grid0.jpg',
                          images[imageIndex.value],
                        ),
                      ),
                    ),
                    onDragEnd: (drag) {
                      if (drag.velocity.pixelsPerSecond.dx < 0) {
                        if (imageIndex.value > 0) {
                          imageIndex.value -= 1;
                        }
                      } else {
                        if (imageIndex.value < images.length - 1) {
                          imageIndex.value += 1;
                        }
                      }
                    },
                    child: Container(
                      height: 350.h,
                      width: double.infinity,
                      color: Colors.grey,
                      child: Image(
                        image: AssetImage(
                          // 'assets/images/grid0.jpg',
                          images[imageIndex.value],
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Icon(
                          FontAwesomeIcons.solidHeart,
                          color: Colors.red,
                          size: 50.sp,
                        ),
                        SizedBox(height: 10.h),
                        Text(
                          '21 likes',
                          style:
                              TextStyle(fontSize: 45.sp, color: Colors.black),
                        ),
                      ],
                    ),
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
                            onTap: () {},
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
