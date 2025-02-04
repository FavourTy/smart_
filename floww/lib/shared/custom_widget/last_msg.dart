import 'package:floww/features/screens/home/models/message.dart';
import 'package:floww/shared/app_assets.dart';
import 'package:floww/shared/app_colors.dart';
import 'package:floww/shared/constants.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../features/screens/home/views/home_screen/chat_page.dart';
import '../../services/chat_services.dart';
import 'custom_list_tile.dart';
import 'package:timeago/timeago.dart' as timeago;

class AllChats extends StatefulWidget {
  const AllChats({super.key});

  @override
  State<AllChats> createState() => _AllChatsState();
}

class _AllChatsState extends State<AllChats> {
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final ChatServices _chatServices = ChatServices();

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: _firebaseFirestore.collection('Users').snapshots(),
      builder: (context, userSnapshot) {
        if (userSnapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        }
        if (!userSnapshot.hasData || userSnapshot.data!.docs.isEmpty) {
          return Center(child: Text("No chats yet"));
        }

        String currentUserID = _auth.currentUser!.uid;
        List<DocumentSnapshot> users = userSnapshot.data!.docs
            .where((doc) => doc.id != currentUserID) // Exclude current user
            .toList();

        return ListView.builder(
          shrinkWrap: true,
          itemCount: users.length,
          itemBuilder: (context, index) {
            var user = users[index];
            String otherUserID = user.id;
            String receiverFullName =
                '${user['firstName'] ?? 'Unknown'} ${user['lastName'] ?? ''}';
            String profilePic = user['profileImage'] ??
                "https://source.unsplash.com/200x200/?person";

            return StreamBuilder<Message?>(
              stream: _chatServices.getLastMsg(otherUserID: otherUserID),
              builder: (context, messageSnapshot) {
                if (!messageSnapshot.hasData || messageSnapshot.data == null) {
                  return SizedBox(); // Skip users with no messages
                }
                Message lastMessage = messageSnapshot.data!;

                String formattedTime = lastMessage.timestamp != null
                    ? timeago.format(lastMessage.timestamp!.toDate())
                    : "No timestamp";
                return Dismissible(
                  key: Key(otherUserID),
                  direction: DismissDirection.endToStart,
                  background: Container(
                    decoration:
                        BoxDecoration(color: AppColors.textFormFieldfillColor),
                    alignment: Alignment.centerRight,
                    child: SvgPicture.asset(AppAssets.deleteSvg),
                  ),
                  onDismissed: (direction) {
                    _chatServices.deleteMessage(
                      currentUserID,
                      otherUserID,
                    );
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                          content: Text(
                            "Chat deleted",
                            style: homeTextStyle.copyWith(
                                color: AppColors.headingStyleColor),
                          ),
                          backgroundColor: AppColors.textFormFieldfillColor),
                    );
                  },
                  child: CustomListTile(
                      image: user['profileImage'],
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ChatPage(
                                      image: user['profileImage'],
                                      receiverFullName:
                                          '${user['firstName']} ${user['lastName']} ',
                                      receiverId: user['uid'],
                                    )));
                      },
                      title: receiverFullName,
                      subtititle: lastMessage.message,
                      text: formattedTime),
                );
              },
            );
          },
        );
      },
    );
  }
}
