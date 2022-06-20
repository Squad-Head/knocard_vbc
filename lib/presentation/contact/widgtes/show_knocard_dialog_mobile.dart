import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'text_input_box.dart';

class ShowKnocardDialogMobile extends HookWidget {
  const ShowKnocardDialogMobile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final dialogScrollContoller = useScrollController();
    final shareFirstnameController = useTextEditingController();
    final shareLastnameController = useTextEditingController();
    final shareMobileController = useTextEditingController();
    final emailController = useTextEditingController();
    final infoFirstnameController = useTextEditingController();
    final infoLastnameController = useTextEditingController();
    final infoMobileController = useTextEditingController();
    return Dialog(
      child: SizedBox(
        width: 300.w,
        child: SingleChildScrollView(
          controller: dialogScrollContoller,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 15.sp),
                alignment: Alignment.centerLeft,
                // width: 300.w,
                height: 50.h,
                decoration: BoxDecoration(
                    color: Theme.of(context).primaryColor,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10.sp),
                        topRight: Radius.circular(10.sp))),
                child: Text(
                  'Share this KnoCard',
                  style: TextStyle(
                    fontSize: 50.sp,
                    color: Theme.of(context).canvasColor,
                  ),
                ),
              ),
              SizedBox(
                height: 20.h,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 30.sp),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Share With',
                      style: TextStyle(
                        color: Theme.of(context).primaryColor,
                        fontSize: 45.sp,
                      ),
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    TextInputBox(
                      controller: shareFirstnameController,
                      text: 'First Name*',
                    ),
                    SizedBox(
                      height: 15.h,
                    ),
                    TextInputBox(
                      controller: shareLastnameController,
                      text: 'Last Name',
                    ),
                    SizedBox(
                      height: 15.h,
                    ),
                    TextInputBox(
                      controller: shareMobileController,
                      text: 'Mobile Number*',
                    ),
                    SizedBox(
                      height: 15.h,
                    ),
                    TextInputBox(
                      controller: emailController,
                      text: 'Email*',
                    ),
                    SizedBox(
                      height: 15.h,
                    ),
                    Text(
                      'Please Add Your Information',
                      style: TextStyle(
                        color: Theme.of(context).primaryColor,
                        fontSize: 45.sp,
                      ),
                    ),
                    SizedBox(
                      height: 15.h,
                    ),
                    TextInputBox(
                      controller: infoFirstnameController,
                      text: 'First Name*',
                    ),
                    SizedBox(
                      height: 15.h,
                    ),
                    TextInputBox(
                      controller: infoLastnameController,
                      text: 'Last Name',
                    ),
                    SizedBox(
                      height: 15.h,
                    ),
                    TextInputBox(
                      controller: infoMobileController,
                      text: 'Mobile Number*',
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                  ],
                ),
              ),
              SizedBox(
                // width: 300.w,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: 1.w,
                    ),
                    Container(
                      margin: EdgeInsets.only(right: 30.w),
                      height: 30.h,
                      width: 300.w,
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: const Text('Submit'),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20.h,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
