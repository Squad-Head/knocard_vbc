import 'package:clean_api/clean_api.dart';
import 'package:equatable/equatable.dart';

import 'package:knocard_ui/domain/profile/user_profile.dart';

class ProfileState extends Equatable {
  final bool loading;
  final CleanFailure failure;
  final UserProfile userProfile;
  final String shareCode;
  const ProfileState({
    required this.loading,
    required this.failure,
    required this.userProfile,
    required this.shareCode,
  });

  @override
  List<Object> get props => [loading, failure, userProfile];

  ProfileState copyWith(
      {bool? loading,
      CleanFailure? failure,
      UserProfile? userProfile,
      String? shareCode}) {
    return ProfileState(
        loading: loading ?? this.loading,
        failure: failure ?? this.failure,
        userProfile: userProfile ?? this.userProfile,
        shareCode: shareCode ?? this.shareCode);
  }

  @override
  String toString() =>
      'ProfileState(loading: $loading, failure: $failure, userProfile: $userProfile)';

  factory ProfileState.init() => ProfileState(
      shareCode: '',
      loading: true,
      failure: CleanFailure.none(),
      userProfile: UserProfile.init());
}
