import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:knocard_ui/application/company_provider.dart';
import 'package:knocard_ui/application/profile_provider.dart';
import 'package:knocard_ui/application/reporting_provider.dart';
import 'package:knocard_ui/domain/activity_data.dart';
import 'package:knocard_ui/presentation/contractor_page/desktop_business_page.dart';
import 'package:knocard_ui/presentation/contractor_page/mobile_business_page.dart';

class BusinessPage extends HookConsumerWidget {
  const BusinessPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, ref) {
    final company =
        ref.watch(profileProvider.select((value) => value.userProfile.company));
    final state = ref.watch(profileProvider);

    useEffect(() {
      Future.delayed(const Duration(milliseconds: 300), () {
        ref.read(companyProvider(company.id).notifier).getFeed();
      });
      return null;
    }, []);
    final data = ActivityData(
        viewerCode: state.shareCode,
        actionType: 'view',
        sourceType: 'link_share',
        module: Module.businessPage,
        targetId: company.user_id,
        identifiableId: company.id);
    final activitySaver = ref.watch(saveReportingProvider(data));

    return activitySaver.maybeWhen(
        loading: () => const Center(
              child: CircularProgressIndicator(),
            ),
        orElse: () => LayoutBuilder(builder: (context, constraints) {
              final width = constraints.maxWidth;
              if (width > 700) {
                return const DesktopBusinessPage();
              } else {
                return const MobileBusinessPage();
              }
            }));
  }
}
