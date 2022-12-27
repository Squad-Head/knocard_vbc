import 'package:equatable/equatable.dart';

class ActivityResponse extends Equatable {
  const ActivityResponse({
    required this.module,
    required this.actionType,
    required this.sourceType,
    required this.identifiableId,
    required this.identifiableType,
    required this.viewableId,
    required this.viewableType,
    required this.targetId,
    required this.sortMarker,
    required this.updatedAt,
    required this.createdAt,
    required this.id,
  });

  final String module;
  final String actionType;
  final String sourceType;
  final int identifiableId;
  final String identifiableType;
  final int viewableId;
  final String viewableType;
  final int targetId;
  final String sortMarker;
  final DateTime updatedAt;
  final DateTime createdAt;
  final int id;

  factory ActivityResponse.fromMap(Map<String, dynamic> json) =>
      ActivityResponse(
        module: json["module"],
        actionType: json["action_type"],
        sourceType: json["source_type"],
        identifiableId: json["identifiable_id"],
        identifiableType: json["identifiable_type"],
        viewableId: json["viewable_id"],
        viewableType: json["viewable_type"],
        targetId: json["target_id"],
        sortMarker: json["sort_marker"],
        updatedAt: DateTime.parse(json["updated_at"]),
        createdAt: DateTime.parse(json["created_at"]),
        id: json["id"],
      );

  @override
  List<Object> get props {
    return [
      module,
      actionType,
      sourceType,
      identifiableId,
      identifiableType,
      viewableId,
      viewableType,
      targetId,
      sortMarker,
      updatedAt,
      createdAt,
      id,
    ];
  }

  @override
  String toString() {
    return 'ActivityResponse(module: $module, actionType: $actionType, sourceType: $sourceType, identifiableId: $identifiableId, identifiableType: $identifiableType, viewableId: $viewableId, viewableType: $viewableType, targetId: $targetId, sortMarker: $sortMarker, updatedAt: $updatedAt, createdAt: $createdAt, id: $id)';
  }
}
