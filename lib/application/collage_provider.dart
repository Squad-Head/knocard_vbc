import 'package:clean_api/clean_api.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:knocard_ui/domain/profile/collage.dart';

import 'profile_provider.dart';

final collageProvider = StateNotifierProvider<CollageNotifier, List<Collage>>((
  ref,
) {
  final id = ref.watch(profileProvider.select((value) => value.userProfile.id));
  return CollageNotifier(id: id);
});

class CollageNotifier extends StateNotifier<List<Collage>> {
  final api = CleanApi.instance();
  final int id;
  CollageNotifier({required this.id}) : super(const []);

  loadCollage() async {
    final Map<String, dynamic> map = {
      // "api_token": profile.apiToken,
      "user_id": id,
    };
    final data = await api.post(
        showLogs: true,
        fromJson: (json) {
          final list = json['data'] as List;
          return List<Collage>.from(list.map((e) => Collage.fromMap(e)));
        },
        body: map,
        endPoint: 'collage/collages');

    state = data.fold((l) => state, (r) => r);
  }
}
