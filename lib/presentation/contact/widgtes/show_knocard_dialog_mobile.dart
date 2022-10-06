import 'package:clean_api/clean_api.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:knocard_ui/application/profile_provider.dart';
import 'package:knocard_ui/domain/share_and_refer.dart';
import 'text_input_box.dart';

class ShowKnocardDialogMobile extends HookConsumerWidget {
  const ShowKnocardDialogMobile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, ref) {
    final dialogScrollContoller = useScrollController();
    final shareFirstnameController = useTextEditingController();
    final shareLastnameController = useTextEditingController();
    final shareMobileController = useTextEditingController();
    final emailController = useTextEditingController();
    final infoFirstnameController = useTextEditingController();
    final infoLastnameController = useTextEditingController();
    final infoMobileController = useTextEditingController();
    final infoEmailController = useTextEditingController();
    final formKey = useMemoized(() => GlobalKey<FormState>());
    final loading = useState(false);
    return Dialog(
      insetPadding: const EdgeInsets.all(20),
      child: SingleChildScrollView(
        controller: dialogScrollContoller,
        child: Form(
          key: formKey,
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
                      required: false,
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
                      required: false,
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
                      height: 15.h,
                    ),
                    TextInputBox(
                      controller: infoEmailController,
                      text: 'Email Address*',
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
                        onPressed: () async {
                          final id = ref.watch(profileProvider
                              .select((value) => value.userProfile.id));
                          final ShareAndRefer shareAndRefer = ShareAndRefer(
                              senderId: id,
                              senderFirstName: infoFirstnameController.text,
                              senderLastName: infoLastnameController.text,
                              senderEmail: infoEmailController.text,
                              senderPhoneNumber: infoMobileController.text,
                              recipientFirstName: shareFirstnameController.text,
                              recipientLastName: shareLastnameController.text,
                              recipientEmail: emailController.text,
                              recipientPhoneNumber: shareMobileController.text);
                          if (formKey.currentState!.validate()) {
                            loading.value = true;
                            await CleanApi.instance.post(
                                fromData: (json) => unit,
                                showLogs: true,
                                body: shareAndRefer.toMap(),
                                endPoint: 'share-and-refer');
                            loading.value = false;
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                content: Text(
                                    'Email sent to ${shareAndRefer.recipientEmail}')));
                            Navigator.pop(context);
                          }
                        },
                        child: loading.value
                            ? const CircularProgressIndicator(
                                color: Colors.white,
                              )
                            : const Text('Submit'),
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
