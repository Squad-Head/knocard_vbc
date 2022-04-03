import 'dart:convert';

import 'package:equatable/equatable.dart';

class Person extends Equatable {
  final String avatar;
  final String name;
  final String lastMessage;
  final String lastMessageTime;
  final bool isGroup;
  Person({
    required this.avatar,
    required this.name,
    required this.lastMessage,
    required this.lastMessageTime,
    required this.isGroup,
  });

  Person copyWith({
    String? avatar,
    String? name,
    String? lastMessage,
    String? lastMessageTime,
    bool? isGroup,
  }) {
    return Person(
      avatar: avatar ?? this.avatar,
      name: name ?? this.name,
      lastMessage: lastMessage ?? this.lastMessage,
      lastMessageTime: lastMessageTime ?? this.lastMessageTime,
      isGroup: isGroup ?? this.isGroup,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'avatar': avatar,
      'name': name,
      'last_message': lastMessage,
      'last_message_time': lastMessageTime,
      'is_group': isGroup,
    };
  }

  factory Person.fromMap(Map<String, dynamic> map) {
    return Person(
      avatar: map['avatar'] ?? '',
      name: map['name'] ?? '',
      lastMessage: map['last_message'] ?? '',
      lastMessageTime: map['last_message_time'] ?? '',
      isGroup: map['is_group'] ?? false,
    );
  }

  String toJson() => json.encode(toMap());

  factory Person.fromJson(String source) => Person.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Person(avatar: $avatar, name: $name, lastMessage: $lastMessage, lastMessageTime: $lastMessageTime, isGroup: $isGroup)';
  }

  @override
  List<Object> get props {
    return [
      avatar,
      name,
      lastMessage,
      lastMessageTime,
      isGroup,
    ];
  }
}
