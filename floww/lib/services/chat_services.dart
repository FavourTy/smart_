import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../features/screens/home/models/message.dart';

class ChatServices {
  //get instance of fireStore
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  //get user stream
  Stream<List<Map<String, dynamic>>> getUsers() {
    return _firebaseFirestore.collection("Users").snapshots().map((snapshot) {
      final users = snapshot.docs.map((doc) {
        final user = doc.data();
        return user;
      }).toList();
      return users;
    });
  }

  // Stream<List<Map<String, dynamic>>> getUsers() {
  //   return _firebaseFirestore.collection("users").snapshots().map((snapshot) {
  //     return snapshot.docs.map((doc) {
  //       final user = doc.data();
  //       return user;
  //     }).toList();
  //   });
  // }

  //send msgs
  Future<void> sendMsg(String receiverId, message) async {
    //get Current user
    final String currentUserID = _auth.currentUser!.uid;
    final String currentUserEmail = _auth.currentUser!.email!;
    final Timestamp timeStamp = Timestamp.now();
    //create a new msg
    Message newMessage = Message(
        senderID: currentUserID,
        message: message,
        receiverID: receiverId,
        senderEmail: currentUserEmail,
        timestamp: timeStamp);

    //construct chat room id for the two users(sorted to ensure uniqueness)
    List<String> ids = [currentUserID, receiverId];
    ids.sort();
    String chatRooomID = ids.join('_');

    // add it to the database
    await _firebaseFirestore
        .collection("chat_rooms")
        .doc(chatRooomID)
        .collection("messages")
        .add(newMessage.toMap());
  }
  //gt msgs
  //get the userID and the other user ID

  Stream<QuerySnapshot> getMessages(String userID, otherUserID) {
    //construct a chatroom ID for the two users
    List<String> ids = [userID, otherUserID];
    ids.sort();
    String chatRooomID = ids.join('_');
    return _firebaseFirestore
        .collection("chat_rooms")
        .doc(chatRooomID)
        .collection("messages")
        .orderBy("timestamp", descending: false)
        .snapshots();
  }

  Stream<Message?> getLastMsg({required String otherUserID}) {
    //construct a chatroom ID for the two users
    try {
      List ids = [_auth.currentUser?.uid, otherUserID];
      ids.sort();
      String chatID = ids.join("_");
      return _firebaseFirestore
          .collection("chat_rooms")
          .doc(chatID)
          .collection("messages")
          .orderBy("timestamp", descending: true)
          .limit(1)
          .snapshots()
          .map((snapshot) {
        if (snapshot.docs.isEmpty) return null;
        return Message.fromMap(snapshot.docs.first.data());
      });
    } catch (e) {
      print("Could not fetch messages: $e");
      return Stream.value(null);
    }
  }
}
