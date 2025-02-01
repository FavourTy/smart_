import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../features/screens/home/models/message.dart';

class ChatServices {
  //get instance of fireStore
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  //get user stream
  Stream<List<Map<String, dynamic>>> getUsers() {
    return _firebaseFirestore.collection("users").snapshots().map((snapshot) {
      return snapshot.docs.map((doc) {
        final user = doc.data();
        return user;
      }).toList();
    });
  }

  //send msgs
  Future<void> SendMsg(String receiverId, message) async {
    //get Current user
    final String currentUserID = _auth.currentUser!.uid;
    final String currentUserEmail = _auth.currentUser!.email!;
    final Timestamp _timeStamp = Timestamp.now();
    //create a new msg
    Message newMessage = Message(
        senderID: currentUserID,
        message: message,
        receiverID: receiverId,
        senderEmail: currentUserEmail,
        timestamp: _timeStamp);

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
}
