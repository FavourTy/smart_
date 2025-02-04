import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:floww/shared/app_assets.dart';
import 'package:floww/shared/constants.dart';
import 'package:floww/shared/custom_widget/app_text_input_field.dart';
import 'package:floww/shared/custom_widget/chat_bubble.dart';
import 'package:floww/shared/navigation/app_route_strings.dart';
import 'package:floww/shared/navigation/app_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../../../services/chat_services.dart';
import '../../../../../services/firebase_services.dart';
import '../../../../../shared/app_colors.dart';
import 'package:intl/intl.dart';

import '../../models/message.dart';

class ChatPage extends StatefulWidget {
  const ChatPage(
      {super.key,
      required this.receiverFullName,
      required this.receiverId,
      required this.image});
  final String receiverFullName;
  final String receiverId;
  final String image;

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  final TextEditingController _textController = TextEditingController();
  final ChatServices _chatservices = ChatServices();
  final FirebaseServices _firebaseServices = FirebaseServices();
  //focus node
  FocusNode myFocusNode = FocusNode();
  final ScrollController _scrollController = ScrollController();
  @override
  void initState() {
    super.initState();
    myFocusNode.addListener(() {
      if (myFocusNode.hasFocus) {
        //cause a delay so that the keyboard has time to show up
        //then the amt of yime remaining will be calculated
        // then scroll down
        Future.delayed(Duration(milliseconds: 500), () => scrollDown());

        Future.delayed(Duration(milliseconds: 500), () => scrollDown());
      }
    });
  }

  void scrollDown() {
    _scrollController.animateTo(_scrollController.position.maxScrollExtent,
        duration: Duration(seconds: 1), curve: Curves.fastOutSlowIn);
  }

  @override
  void dispose() {
    super.dispose();
    myFocusNode.dispose();
    _textController.dispose();
  }

  //send msg
  void sendMsg() async {
    if (_textController.text.isNotEmpty) {
      //snd the message
      await _chatservices.sendMsg(
          widget.receiverId, _textController.text, Timestamp.now());
      _textController.clear();

      scrollDown;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: AppBar(
          leading: SizedBox(
            height: 20,
            width: 20,
            child: GestureDetector(
                onTap: () {
                  AppRouter.pop(AppRouteStrings.bottomNav);
                },
                child: SvgPicture.asset(AppAssets.backSvg)),
          ),
          backgroundColor: AppColors.backgroundColor,
          title: Row(
            children: [
              CircleAvatar(
                radius: 17,
                backgroundImage: NetworkImage(widget.image),
              ),
              SizedBox(width: 5),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.receiverFullName,
                    style: homeTextStyle.copyWith(
                        color: AppColors.headingStyleColor),
                  ),
                  Text("active now", style: msgTextStyle)
                ],
              ),
            ],
          )),
      body: Column(
        children: [
          Expanded(child: _buildMsgBody()),
          _buildUserInput(),
        ],
      ),
    );
  }

  Widget _buildMsgBody() {
    String senderID = _firebaseServices.getCurrentUser()!.uid;
    return StreamBuilder(
        stream: _chatservices.getMessages(widget.receiverId, senderID),
        builder: (context, snapshot) {
          // errors
          if (snapshot.hasError) {
            return Center(
              child: Text("error loading data"),
            );
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          //loading
          return ListView(
            controller: _scrollController,
            children:
                snapshot.data!.docs.map((doc) => _buildMsgItem(doc)).toList(),
          );

          //listView
        });
  }

  Widget _buildMsgItem(DocumentSnapshot doc) {
    Map<String, dynamic> data = doc.data() as Map<String, dynamic>;

    bool isCurrentUser =
        data['senderID'] == _firebaseServices.getCurrentUser()!.uid;
    var alignment =
        isCurrentUser ? Alignment.centerRight : Alignment.centerLeft;
    Message lastMessage =
        Message.fromMap(data); // Assuming you have a Message model
    String formattedTime = lastMessage.timestamp != null
        ? DateFormat('hh:mm a').format(lastMessage.timestamp!.toDate())
        : "No timestamp";
    return Container(
        alignment: alignment,
        child: Column(
          crossAxisAlignment:
              isCurrentUser ? CrossAxisAlignment.end : CrossAxisAlignment.start,
          children: [
            !isCurrentUser
                ? Padding(
                    padding: const EdgeInsets.only(left: 8),
                    child: Row(
                      children: [
                        CircleAvatar(
                          radius: 17,
                          backgroundImage: NetworkImage(widget.image),
                        ),
                        SizedBox(width: 5),
                        Text(widget.receiverFullName,
                            style: homeTextStyle.copyWith(
                                color: AppColors.headingStyleColor,
                                fontSize: 14.0))
                      ],
                    ),
                  )
                : SizedBox(),
            ChatBubble(msg: data["message"], isCurrentUser: isCurrentUser),

            SizedBox(height: 5),
            isCurrentUser
                ? Padding(
                    padding: const EdgeInsets.only(right: 12),
                    child: Text(
                      formattedTime,
                      style: msgTextStyle.copyWith(fontSize: 10),
                    ),
                  )
                : Padding(
                    padding: const EdgeInsets.only(left: 80),
                    child: Text(
                      formattedTime,
                      style: msgTextStyle.copyWith(fontSize: 10),
                    ),
                  )
            // Text(data["message"]),
          ],
        ));
    //is current user
  }

  //build UserInput
  Widget _buildUserInput() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 30, left: 10, right: 10),
      child: Row(
        children: [
          SvgPicture.asset(AppAssets.attachmentSvg),
          SizedBox(width: 7),
          Expanded(
              child: AppTextInputField(
            hintText: "write your message",
            myFocusNode: myFocusNode,
            controller: _textController,
          )),
          SizedBox(
            width: 7,
          ),
          InkWell(
            onTap: sendMsg,
            child: SvgPicture.asset(AppAssets.sendSvg),
          )
        ],
      ),
    );
  }
}
