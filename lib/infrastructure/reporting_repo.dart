import 'package:clean_api/clean_api.dart';

class ReportingRepo {
  ReportingRepo._();

  static Future<void> trackVbcView(int id) async {
    await CleanApi.instance().post(
        fromJson: (json) => unit,
        body: {
          "user_id": id,
          "log_name": "copied",
          "activity_code": "contact_page",
        },
        showLogs: true,
        endPoint: 'tracking/desktop/click/save');
  }

  static Future<void> trackPlaylistView(
      {required int id, required videoId}) async {
    await CleanApi.instance().post(
        fromJson: (json) => unit,
        body: {"user_id": id, 'video_id': videoId},
        showLogs: true,
        endPoint: 'tracker/playlist/click/save');
  }
}
