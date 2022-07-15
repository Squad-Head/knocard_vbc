import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:knocard_ui/domain/i_profile_repo.dart';
import 'package:knocard_ui/infrastructure/profile_repo.dart';

import 'company_state.dart';

final companyProvider =
    StateNotifierProvider.family<CompanyNotifier, CompanyState, int>((ref, id) {
  // final companyId = ref
  //     .watch(profileProvider.select((value) => value.userProfile.company.id));
  return CompanyNotifier(id, ProfileRepo());
});

class CompanyNotifier extends StateNotifier<CompanyState> {
  final int companyId;
  final IProfileRepo profileRepo;
  CompanyNotifier(this.companyId, this.profileRepo)
      : super(CompanyState.init());

  getFeed() async {
    final data = await profileRepo.getCompanyFeed(companyId: companyId);
    state = data.fold((l) => state, (r) => state.copyWith(feeds: r));
    final btnData = await profileRepo.getCompanyButtons(companyId: companyId);
    state = btnData.fold((l) => state, (r) => state.copyWith(buttons: r));
  }
}
