import 'package:clean_api/clean_api.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:knocard_ui/application/profile_state.dart';
import 'package:knocard_ui/domain/i_profile_repo.dart';
import 'package:knocard_ui/infrastructure/profile_repo.dart';

final profileProvider =
    StateNotifierProvider<ProfileNotifier, ProfileState>((ref) {
  return ProfileNotifier(ProfileRepo());
});

class ProfileNotifier extends StateNotifier<ProfileState> {
  final IProfileRepo profileRepo;
  ProfileNotifier(this.profileRepo) : super(ProfileState.init());

  getProfile() async {
    state = state.copyWith(loading: true);
    final data = await profileRepo.getProfile();
    Logger.i(data);
    state = data.fold((l) => state.copyWith(loading: false, failure: l),
        (r) => state.copyWith(loading: false, userProfile: r));
    Logger.i(state);
  }
}
