import 'package:equatable/equatable.dart';

class UserFeature extends Equatable {
  final int lookupId;
  const UserFeature({
    required this.lookupId,
  });

  UserFeature copyWith({
    int? lookupId,
  }) {
    return UserFeature(
      lookupId: lookupId ?? this.lookupId,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'lookup_id': lookupId,
    };
  }

  factory UserFeature.fromMap(Map<String, dynamic>? map) {
    return UserFeature(
      lookupId: map?['lookup_id']?.toInt() ?? 0,
    );
  }

  @override
  String toString() => 'UserFeature(lookupId: $lookupId)';

  @override
  List<Object> get props => [lookupId];
}
