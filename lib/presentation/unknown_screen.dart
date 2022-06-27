import 'package:clean_api/clean_api.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class UnknownScreen extends StatelessWidget {
  final CleanFailure failure;
  const UnknownScreen({Key? key, required this.failure}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          color: Colors.white,
          constraints: const BoxConstraints(maxWidth: 800),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 60.w),
                child: Image.asset('assets/images/something_went_wrong.png'),
              ),
              Center(
                child: Text(
                  'Something went wrong!',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.red,
                      fontSize: 25.sp),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 60.w, vertical: 10.h),
                child: const Text(
                    'We know how frustrating it is to see this page, still you can check the details of the failure and share it to our developer to make this platform bulletproof'),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 60.w),
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        shape: const StadiumBorder(), primary: Colors.orange),
                    onPressed: () {
                      CleanFailureDialogue.show(context, failure: failure);
                    },
                    child: const Text('Check error')),
              )
            ],
          ),
        ),
      ),
    );
  }
}
