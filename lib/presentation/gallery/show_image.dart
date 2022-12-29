import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:knocard_ui/application/reporting_provider.dart';
import 'package:knocard_ui/domain/activity_data.dart';
import 'package:knocard_ui/domain/profile/photo.dart';

class ShowImage extends HookConsumerWidget {
  final Photo photo;
  final int currentUserId;
  final int userId;
  const ShowImage(
      {super.key,
      required this.photo,
      required this.currentUserId,
      required this.userId});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final data = ActivityData(
        viewableId: currentUserId,
        actionType: 'view',
        sourceType: 'link_share',
        module: Module.images,
        targetId: userId,
        identifiableId: photo.id);
    final activitySaver = ref.watch(saveReportingProvider(data));
    return activitySaver.maybeWhen(
        loading: () => const Center(
              child: CircularProgressIndicator(),
            ),
        orElse: () => CachedNetworkImage(
              imageUrl: photo.link,
            ));
  }
}
