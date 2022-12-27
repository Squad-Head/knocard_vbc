import 'package:clean_api/clean_api.dart';
import 'package:knocard_ui/domain/activity_data.dart';
import 'package:knocard_ui/domain/profile/activity_response.dart';

class ReportingRepo {
  ReportingRepo._();

  static Future<Either<CleanFailure, ActivityResponse>> saveActivity(
      ActivityData data) async {
    return await CleanApi.instance.post(
        fromData: (json) => ActivityResponse.fromMap(json["data"]),
        body: data.toMap(),
        showLogs: true,
        endPoint: 'activity/save');
  }

  static Future<void> trackVbcView(int id, String shareCode) async {
    Logger.i({
      "user_id": id,
      "log_name": "copied",
      "activity_code": "contact_page",
      if (shareCode.isNotEmpty) "viewer_code": shareCode
    });
    await CleanApi.instance.post(
        fromData: (json) => unit,
        body: {
          "user_id": id,
          "log_name": "copied",
          "activity_code": "contact_page",
          if (shareCode.isNotEmpty) "viewer_code": shareCode
        },
        showLogs: true,
        endPoint: 'tracking/desktop/click/save');
  }

  static Future<void> trackPlaylistView(
      {required int id, required videoId, required String shareCode}) async {
    await CleanApi.instance.post(
        fromData: (json) => unit,
        body: {
          "user_id": id,
          'video_id': videoId,
          if (shareCode.isNotEmpty) "viewer_code": shareCode
        },
        showLogs: true,
        endPoint: 'tracker/playlist/click/save');
  }
}
