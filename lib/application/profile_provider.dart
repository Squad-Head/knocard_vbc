import 'package:clean_api/clean_api.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:knocard_ui/application/profile_state.dart';
import 'package:knocard_ui/domain/i_profile_repo.dart';
import 'package:knocard_ui/infrastructure/profile_repo.dart';

final profileProvider =
    StateNotifierProvider<ProfileNotifier, ProfileState>((ref) {
  return ProfileNotifier(
    profileRepo: ProfileRepo(),
  );
});

class ProfileNotifier extends StateNotifier<ProfileState> {
  final IProfileRepo profileRepo;
  ProfileNotifier({
    required this.profileRepo,
  }) : super(ProfileState.init());

  getProfile(String userName) async {
    // if (state.userProfile == UserProfile.init()) {
    state = state.copyWith(loading: true);
    // }
    Logger.i("getting $userName");
    state = state.copyWith(loading: true, failure: CleanFailure.none());
    final data = await profileRepo.getProfile(userName);
    state = data.fold((l) => state.copyWith(loading: false, failure: l),
        (r) => state.copyWith(loading: false, userProfile: r));
    // Logger.i(state.userProfile);
    // Logger.i(state.userProfile.company);
  }
}
