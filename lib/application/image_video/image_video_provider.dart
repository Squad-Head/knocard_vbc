import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:knocard_ui/domain/image_video/i_image_video_repo.dart';
import 'package:knocard_ui/infrastructure/image_video/image_video_repo.dart';

import 'image_video_state.dart';

final imagePostProvider =
    StateNotifierProvider<ImageVideoNotifier, ImageVideoState>((ref) {
  return ImageVideoNotifier(ImageVideoRepo());
});

class ImageVideoNotifier extends StateNotifier<ImageVideoState> {
  final IImageVideoRepo imageVideoRepo;
  ImageVideoNotifier(this.imageVideoRepo) : super(ImageVideoState.init());
  getPostData() async {
    state = state.copyWith(loading: true);
    final data = await imageVideoRepo.getpostData();
    state = state.copyWith(loading: false, imageVideoData: data);
  }
}
