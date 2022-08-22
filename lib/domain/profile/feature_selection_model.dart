import 'package:equatable/equatable.dart';
import 'package:fast_immutable_collections/fast_immutable_collections.dart';

class FeatureSelectionModel extends Equatable {
  final String feature;
  final int lookupId;
  final bool selected;
  const FeatureSelectionModel({
    required this.feature,
    required this.lookupId,
    required this.selected,
  });

  FeatureSelectionModel copyWith({
    String? feature,
    int? lookupId,
    bool? selected,
  }) {
    return FeatureSelectionModel(
      feature: feature ?? this.feature,
      lookupId: lookupId ?? this.lookupId,
      selected: selected ?? this.selected,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'feature': feature,
      'lookup_id': lookupId,
      'selected': selected,
    };
  }

  factory FeatureSelectionModel.fromMap(IMap<String, dynamic> map) {
    return FeatureSelectionModel(
      feature: map['feature'] ?? '',
      lookupId: map['lookup_id']?.toInt() ?? 0,
      selected: map['selected'] ?? false,
    );
  }

  @override
  String toString() =>
      'FeatureSelectionModel(feature: $feature, lookupId: $lookupId, selected: $selected)';

  @override
  List<Object> get props => [feature, lookupId, selected];
}
