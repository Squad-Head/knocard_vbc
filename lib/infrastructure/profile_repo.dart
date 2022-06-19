import 'dart:convert';

import 'package:clean_api/clean_api.dart';
import 'package:knocard_ui/domain/i_profile_repo.dart';
import 'package:knocard_ui/domain/profile/user_profile.dart';
import 'package:knocard_ui/infrastructure/data.dart';

class ProfileRepo extends IProfileRepo {
  final cleanApi = CleanApi.instance();
  @override
  Future<Either<CleanFailure, UserProfile>> getProfile() async {
    await Future.delayed(const Duration(seconds: 2));
    final mapData = jsonDecode(data);
    Logger.i(mapData);
    final profile = UserProfile.fromMap(mapData['data']["user"][0]);
    return right(profile);
    // return await cleanApi.get(
    //   fromJson: ((json) => UserProfile.fromMap(json['payload'])),
    //   endPoint: 'user/vbc/iamginofernando',
    //   showLogs: true,
    // );
  }
}
