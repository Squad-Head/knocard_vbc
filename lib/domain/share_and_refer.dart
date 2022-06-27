import 'dart:convert';

import 'package:equatable/equatable.dart';

class ShareAndRefer extends Equatable {
  final int senderId;
  final String senderFirstName;
  final String senderLastName;
  final String senderEmail;
  final String senderPhoneNumber;
  final String recipientFirstName;
  final String recipientLastName;
  final String recipientEmail;
  final String recipientPhoneNumber;
  const ShareAndRefer({
    required this.senderId,
    required this.senderFirstName,
    required this.senderLastName,
    required this.senderEmail,
    required this.senderPhoneNumber,
    required this.recipientFirstName,
    required this.recipientLastName,
    required this.recipientEmail,
    required this.recipientPhoneNumber,
  });

  ShareAndRefer copyWith({
    int? senderId,
    String? senderFirstName,
    String? senderLastName,
    String? senderEmail,
    String? senderPhoneNumber,
    String? recipientFirstName,
    String? recipientLastName,
    String? recipientEmail,
    String? recipientPhoneNumber,
  }) {
    return ShareAndRefer(
      senderId: senderId ?? this.senderId,
      senderFirstName: senderFirstName ?? this.senderFirstName,
      senderLastName: senderLastName ?? this.senderLastName,
      senderEmail: senderEmail ?? this.senderEmail,
      senderPhoneNumber: senderPhoneNumber ?? this.senderPhoneNumber,
      recipientFirstName: recipientFirstName ?? this.recipientFirstName,
      recipientLastName: recipientLastName ?? this.recipientLastName,
      recipientEmail: recipientEmail ?? this.recipientEmail,
      recipientPhoneNumber: recipientPhoneNumber ?? this.recipientPhoneNumber,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'sender_id': senderId,
      'sender_first_name': senderFirstName,
      'sender_last_name': senderLastName,
      'sender_email': senderEmail,
      'sender_phone_number': senderPhoneNumber,
      'recipient_first_name': recipientFirstName,
      'recipient_last_name': recipientLastName,
      'recipient_email': recipientEmail,
      'recipient_phone_number': recipientPhoneNumber,
    };
  }

  factory ShareAndRefer.fromMap(Map<String, dynamic> map) {
    return ShareAndRefer(
      senderId: map['sender_id']?.toInt() ?? 0,
      senderFirstName: map['sender_first_name'] ?? '',
      senderLastName: map['sender_last_name'] ?? '',
      senderEmail: map['sender_email'] ?? '',
      senderPhoneNumber: map['sender_phone_number'] ?? '',
      recipientFirstName: map['recipient_first_name'] ?? '',
      recipientLastName: map['recipient_last_name'] ?? '',
      recipientEmail: map['recipient_email'] ?? '',
      recipientPhoneNumber: map['recipient_phone_number'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory ShareAndRefer.fromJson(String source) =>
      ShareAndRefer.fromMap(json.decode(source));

  @override
  String toString() {
    return 'ShareAndRefer(senderId: $senderId, senderFirstName: $senderFirstName, senderLastName: $senderLastName, senderEmail: $senderEmail, senderPhoneNumber: $senderPhoneNumber, recipientFirstName: $recipientFirstName, recipientLastName: $recipientLastName, recipientEmail: $recipientEmail, recipientPhoneNumber: $recipientPhoneNumber)';
  }

  @override
  List<Object> get props {
    return [
      senderId,
      senderFirstName,
      senderLastName,
      senderEmail,
      senderPhoneNumber,
      recipientFirstName,
      recipientLastName,
      recipientEmail,
      recipientPhoneNumber,
    ];
  }
}
