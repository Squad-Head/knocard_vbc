import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:knocard_ui/application/profile_provider.dart';
import 'package:knocard_ui/application/reporting_provider.dart';
import 'package:knocard_ui/domain/activity_data.dart';
import 'package:knocard_ui/domain/profile/photo.dart';

class DesktopImageView extends HookConsumerWidget {
  final List<Photo> images;
  final int index;
  const DesktopImageView({Key? key, required this.images, required this.index})
      : super(key: key);

  @override
  Widget build(BuildContext context, ref) {
    final activeIndex = useState(index);
    final state = ref.watch(profileProvider);
    final data = ActivityData(
        viewerCode: state.shareCode,
        actionType: 'view',
        sourceType: 'link_share',
        module: Module.images,
        targetId: state.userProfile.id,
        identifiableId: images[activeIndex.value].id);
    final activitySaver = ref.watch(saveReportingProvider(data));
    return activitySaver.maybeWhen(
      loading: () => const Center(
        child: CircularProgressIndicator(),
      ),
      orElse: () => Dialog(
        backgroundColor: Colors.transparent,
        child: SizedBox(
          width: 700.w,
          child: Stack(
            alignment: Alignment.center,
            children: [
              Image.network(images[activeIndex.value].link),
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
                      size: 30,
                      color: Theme.of(context).canvasColor,
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
