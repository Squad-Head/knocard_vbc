import 'post_data.dart';

abstract class IImageVideoRepo {
  Future<List<PostData>> getpostData();
}
