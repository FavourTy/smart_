import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:floww/shared/custom_widget/app_text_input_field.dart';
import 'package:floww/shared/custom_widget/chat_bubble.dart';
import 'package:flutter/material.dart';

import '../../../../services/chat_services.dart';
import '../../../../services/firebase_services.dart';
import '../../../../shared/app_colors.dart';

class ChatPage extends StatefulWidget {
  const ChatPage(
      {super.key, required this.receiverFullName, required this.receiverId});
  final String receiverFullName;
  final String receiverId;

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
    // TODO: implement initState
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
    // TODO: implement dispose
    super.dispose();
    myFocusNode.dispose();
    _textController.dispose();
  }

  //send msg
  void sendMsg() async {
    if (_textController.text.isNotEmpty) {
      //snd the message
      await _chatservices.sendMsg(widget.receiverId, _textController.text);
      _textController.clear();

      scrollDown;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: AppBar(
        backgroundColor: AppColors.backgroundColor,
        title: Text(widget.receiverFullName),
      ),
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
    return Container(
        alignment: alignment,
        child: Column(
          crossAxisAlignment:
              isCurrentUser ? CrossAxisAlignment.end : CrossAxisAlignment.start,
          children: [
            ChatBubble(msg: data["message"], isCurrentUser: isCurrentUser)
            // Text(data["message"]),
          ],
        ));
    //is current user

    //build UserInput
  }

  Widget _buildUserInput() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 50),
      child: Row(
        children: [
          Expanded(
              child: AppTextInputField(
            myFocusNode: myFocusNode,
            controller: _textController,
          )),
          IconButton(onPressed: sendMsg, icon: Icon(Icons.arrow_upward))
        ],
      ),
    );
  }
}
