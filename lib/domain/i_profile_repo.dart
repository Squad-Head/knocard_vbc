import 'package:clean_api/clean_api.dart';
import 'package:knocard_ui/domain/profile/user_profile.dart';

import 'profile/company/company_external_link.dart';
import 'profile/company/company_feed.dart';

abstract class IProfileRepo {
  Future<Either<CleanFailure, UserProfile>> getProfile(String userName);
  Future<Either<CleanFailure, List<CompanyFeed>>> getCompanyFeed(
      {required int companyId});
  Future<Either<CleanFailure, List<CompanyExternalLinkEntity>>>
      getCompanyButtons({required int companyId});
}
