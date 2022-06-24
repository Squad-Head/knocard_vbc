import 'package:clean_api/clean_api.dart';
import 'package:knocard_ui/domain/profile/user_profile.dart';

abstract class IProfileRepo {
  Future<Either<CleanFailure, UserProfile>> getProfile(String userName);
}
