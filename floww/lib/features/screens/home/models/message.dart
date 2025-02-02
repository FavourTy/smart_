import 'package:cloud_firestore/cloud_firestore.dart';

class Message {
  final String senderID;
  final String receiverID;
  final String message;
  final String senderEmail;
  final Timestamp timestamp;

  Message({
    required this.senderID,
    required this.receiverID,
    required this.message,
    required this.senderEmail,
    required this.timestamp,
  });

  Map<String, dynamic> toMap() {
    return {
      'senderID': senderID,
      'receiverID': receiverID,
      'message': message,
      'senderEmail': senderEmail,
      'timestamp': timestamp,
    };
  }

  factory Message.fromMap(Map<String, dynamic> map) {
    return Message(
      senderID: map['senderID'] ?? '',
      receiverID: map['receiverID'] ?? '',
      message: map['message'] ?? '',
      senderEmail: map['senderEmail'] ?? '',
      timestamp: map['timestamp'] ?? Timestamp.now(),
    );
  }
}
