import 'package:equatable/equatable.dart';
import 'package:knocard_ui/domain/image_video/post_data.dart';

class ImageVideoState extends Equatable {
  final bool loading;
  final List<PostData> imageVideoData;
  const ImageVideoState({
    required this.loading,
    required this.imageVideoData,
  });

  ImageVideoState copyWith({
    bool? loading,
    List<PostData>? imageVideoData,
  }) {
    return ImageVideoState(
      loading: loading ?? this.loading,
      imageVideoData: imageVideoData ?? this.imageVideoData,
    );
  }

  @override
  List<Object> get props => [loading, imageVideoData];

  @override
  String toString() => 'PostState(loading: $loading, posts: $imageVideoData)';

  factory ImageVideoState.init() =>
      const ImageVideoState(loading: false, imageVideoData: []);
}
