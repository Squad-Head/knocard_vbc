import 'package:clean_api/clean_api.dart';
import 'package:knocard_ui/domain/activity_data.dart';
import 'package:knocard_ui/domain/profile/activity_response.dart';

class ReportingRepo {
  ReportingRepo._();

  static Future<Either<CleanFailure, ActivityResponse>> saveActivity(
      ActivityData data) async {
    if (data.viewableId != data.targetId) {
      return await CleanApi.instance.post(
          fromData: (json) => ActivityResponse.fromMap(json["data"]),
          body: data.toMap(),
          showLogs: true,
          endPoint: 'activity/save');
    } else {
      return left(CleanFailure.none());
    }
  }
}
