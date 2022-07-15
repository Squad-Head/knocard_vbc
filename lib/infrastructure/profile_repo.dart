import 'package:clean_api/clean_api.dart';
import 'package:knocard_ui/domain/i_profile_repo.dart';
import 'package:knocard_ui/domain/profile/company/company_external_link.dart';
import 'package:knocard_ui/domain/profile/company/company_feed.dart';
import 'package:knocard_ui/domain/profile/user_profile.dart';

class ProfileRepo extends IProfileRepo {
  final cleanApi = CleanApi.instance();
  @override
  Future<Either<CleanFailure, UserProfile>> getProfile(String userName) async {
    // await Future.delayed(const Duration(seconds: 2));
    // final mapData = jsonDecode(data);
    // Logger.i(mapData);
    // final profile = UserProfile.fromMap(mapData['data']["user"][0]);
    // return right(profile);
    return await cleanApi.get(
      fromJson: ((json) => UserProfile.fromMap(json['data']["user"][0])),
      endPoint: 'user/vbc/$userName',
      // showLogs: true,
    );
  }

  @override
  Future<Either<CleanFailure, List<CompanyFeed>>> getCompanyFeed({
    required int companyId,
  }) async {
    final data = await cleanApi.get(
        showLogs: true,
        fromJson: (json) {
          final list = json['company_feed'] as List;
          return List<CompanyFeed>.from(
              list.map((e) => CompanyFeed.fromMap(e)));
        },
        endPoint: "company-feeds?company_id=$companyId");

    return data;
  }

  @override
  Future<Either<CleanFailure, List<CompanyExternalLinkEntity>>>
      getCompanyButtons({required int companyId}) async {
    final data = await cleanApi.get(
        showLogs: true,
        fromJson: (json) {
          final list = json['company_external_links'] as List;
          return List<CompanyExternalLinkEntity>.from(
              list.map((e) => CompanyExternalLinkEntity.fromMap(e)));
        },
        endPoint: 'company-external-links?company_id=$companyId');
    return data;
  }
}
