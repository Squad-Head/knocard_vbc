import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DesktopImageView extends HookWidget {
  final List<String> images;
  final int index;
  const DesktopImageView({Key? key, required this.images, required this.index})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final activeIndex = useState(index);
    return Dialog(
      backgroundColor: Colors.transparent,
      child: SizedBox(
        width: 700.w,
        child: Stack(
          alignment: Alignment.center,
          children: [
            Image.network(images[activeIndex.value]),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  onTap: () {
                    activeIndex.value == 0
                        ? activeIndex.value = images.length - 1
                        : activeIndex.value--;
                  },
                  child: Icon(
                    Icons.arrow_back_ios,
                    size: 30.sp,
                    color: Theme.of(context).canvasColor,
                  ),
                ),
                InkWell(
                  onTap: () {
                    activeIndex.value == images.length - 1
                        ? activeIndex.value = 0
                        : activeIndex.value++;
                  },
                  child: Icon(
                    Icons.arrow_forward_ios,
                    size: 30.sp,
                    color: Theme.of(context).canvasColor,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
