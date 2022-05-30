import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:knocard_ui/style/color.dart';

class SearchWidget extends HookWidget {
  const SearchWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ValueNotifier<bool> isOpen = useState(false);

    final searchController = useTextEditingController();

    return isOpen.value
        ? SizedBox(
            width: 210.w,
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 5.h),
              child: AnimatedContainer(
                duration: const Duration(seconds: 1),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15.r),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.shade300,
                        blurRadius: 2,
                        spreadRadius: 1,
                        offset: const Offset(2, 2),
                      )
                    ]),
                child: TextField(
                  controller: searchController,
                  decoration: InputDecoration(
                    fillColor: Theme.of(context).scaffoldBackgroundColor,
                    filled: true,
                    contentPadding:
                        EdgeInsets.symmetric(horizontal: 15.w, vertical: 0),
                    hintText: "Search Message",
                    hintStyle: TextStyle(
                      color: KColor.primaryColor,
                      fontSize: 14.sp,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15.r),
                      borderSide: BorderSide(
                        color: Colors.grey.shade300,
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15.r),
                      borderSide: BorderSide(
                        color: Colors.grey.shade300,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15.r),
                      borderSide: BorderSide(
                        color: Colors.grey.shade400,
                      ),
                    ),
                    suffixIcon: InkWell(
                      onTap: () {
                        isOpen.value = !isOpen.value;
                      },
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 15.0, vertical: 15),
                        child: Image.asset(
                          "assets/images/filter.png",
                          fit: BoxFit.fitHeight,
                          height: 10,
                          width: 10,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ))
        : InkWell(
            onTap: () {
              isOpen.value = !isOpen.value;
            },
            child: Image.asset(
              "assets/images/search.png",
              fit: BoxFit.contain,
              height: 20.h,
              width: 20.w,
            ),
          );
  }
}
