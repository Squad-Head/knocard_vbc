import 'dart:convert';

import 'package:equatable/equatable.dart';

enum Module { profile, playlist, businessPage, videos, collage, images }

extension ParseToString on Module {
  String toShortString() {
    if (this == Module.businessPage) {
      return 'business_page';
    } else {
      return toString().split('.').last;
    }
  }
}

class ActivityData extends Equatable {
  final int viewableId;
  final String actionType;
  final String sourceType;
  final Module module;
  final int targetId;
  final int identifiableId;
  const ActivityData({
    required this.viewableId,
    required this.actionType,
    required this.sourceType,
    required this.module,
    required this.targetId,
    required this.identifiableId,
  });

  ActivityData copyWith({
    int? viewableId,
    String? actionType,
    String? sourceType,
    Module? module,
    int? targetId,
    int? identifiableId,
  }) {
    return ActivityData(
      viewableId: viewableId ?? this.viewableId,
      actionType: actionType ?? this.actionType,
      sourceType: sourceType ?? this.sourceType,
      module: module ?? this.module,
      targetId: targetId ?? this.targetId,
      identifiableId: identifiableId ?? this.identifiableId,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      // 'viewableId': viewableId,
      'actionType': actionType,
      'sourceType': sourceType,
      'module': module.toShortString(),
      'targetId': targetId,
      'identifiableId': identifiableId,
    };
  }

  factory ActivityData.fromMap(Map<String, dynamic> map) {
    return ActivityData(
      viewableId: map['viewableId']?.toInt() ?? 0,
      actionType: map['actionType'] ?? '',
      sourceType: map['sourceType'] ?? '',
      module: map['module'] ?? '',
      targetId: map['targetId']?.toInt() ?? 0,
      identifiableId: map['identifiableId']?.toInt() ?? 0,
    );
  }

  String toJson() => json.encode(toMap());

  factory ActivityData.fromJson(String source) =>
      ActivityData.fromMap(json.decode(source));

  @override
  String toString() {
    return 'ActivityData(viewableId: $viewableId, actionType: $actionType, sourceType: $sourceType, module: ${module.toShortString()}, targetId: $targetId, identifiableId: $identifiableId)';
  }

  @override
  List<Object> get props {
    return [
      viewableId,
      actionType,
      sourceType,
      module,
      targetId,
      identifiableId,
    ];
  }
}
