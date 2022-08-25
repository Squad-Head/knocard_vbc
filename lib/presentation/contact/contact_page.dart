import 'package:flutter/widgets.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:knocard_ui/application/profile_provider.dart';
import 'package:knocard_ui/infrastructure/reporting_repo.dart';
import 'package:knocard_ui/presentation/contact/desktop_contact_page.dart';
import 'package:knocard_ui/presentation/contact/mobile_contact_page.dart';

class ContactPage extends HookConsumerWidget {
  const ContactPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, ref) {
    final state = ref.watch(profileProvider);
    useEffect(() {
      Future.delayed(const Duration(milliseconds: 500), () {
        ReportingRepo.trackVbcView(state.userProfile.id, state.shareCode);
      });
      return null;
    }, []);
    return LayoutBuilder(builder: (context, constraints) {
      final width = constraints.maxWidth;
      if (width > 700) {
        return const DesktopContactPage();
      } else {
        return const MobileContactPage();
      }
    });
  }
}
