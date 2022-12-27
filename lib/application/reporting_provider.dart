import 'package:clean_api/clean_api.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:knocard_ui/domain/activity_data.dart';
import 'package:knocard_ui/infrastructure/reporting_repo.dart';

import '../domain/profile/activity_response.dart';

final saveReportingProvider = FutureProvider.autoDispose
    .family<Either<CleanFailure, ActivityResponse>, ActivityData>(
        (ref, data) async {
  return ReportingRepo.saveActivity(data);
});
