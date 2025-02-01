import 'package:floww/features/screens/home/views/chat_page.dart';
import 'package:floww/services/chat_services.dart';
import 'package:floww/services/firebase_services.dart';
import 'package:floww/shared/navigation/app_route_strings.dart';
import 'package:floww/shared/navigation/app_router.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../app_colors.dart';
import '../constants.dart';
import 'user_column.dart';

class CustomHomeWidget extends StatelessWidget {
  CustomHomeWidget({
    super.key,
    this.isFirst = false,
  });
  final bool isFirst;

  final ChatServices _chatServices = ChatServices();
  final FirebaseServices _firebaseServices = FirebaseServices();

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<Object>(
        stream: _chatServices.getUsers(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Center(
              child: Text("Has Error"),
            );
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation(AppColors.primaryColor),
              ),
            );
          }
          List<Map<String, dynamic>> users =
              List<Map<String, dynamic>>.from(snapshot.data as List);
          return ListView(
            scrollDirection: Axis.horizontal,
            padding: EdgeInsets.symmetric(
                vertical: 40, horizontal: isFirst ? 16 : 0),
            children: users
                .map<Widget>((userData) => _buildColumn(userData, context))
                .toList(),
          );
        });
  }

  Widget _buildColumn(Map<String, dynamic> userData, BuildContext context) {
    if (userData['email'] != _firebaseServices.getCurrentUser()!.email) {
      return UserColumn(
        text: userData['firstName'],
        image: userData['profileImage'],
        onTap: () {
          Navigator.push(
              context,
              CupertinoPageRoute(
                  builder: (context) => ChatPage(
                        image: userData['profileImage'],
                        receiverFullName:
                            '${userData['firstName']} ${userData['lastName']} ',
                        receiverId: userData['uid'],
                      )));
        },
      );
    } else {
      return Container();
    }
  }
}
