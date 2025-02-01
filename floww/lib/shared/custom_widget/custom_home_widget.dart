import 'package:floww/features/screens/home/views/chat_page.dart';
import 'package:floww/services/chat_services.dart';
import 'package:floww/services/firebase_services.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'user_column.dart';

class CustomHomeWidget extends StatefulWidget {
  const CustomHomeWidget({
    super.key,
    this.isFirst = false,
  });
  final bool isFirst;

  @override
  State<CustomHomeWidget> createState() => _CustomHomeWidgetState();
}

class _CustomHomeWidgetState extends State<CustomHomeWidget> {
  final ChatServices _chatServices = ChatServices();

  final FirebaseServices _firebaseServices = FirebaseServices();
  @override
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<Object>(
        stream: _chatServices.getUsers(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Center(
                child: Text("Error: ${snapshot.error}")); //  Show error
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }

          print("Snapshot Data: ${snapshot.data}"); // Print full data

          if (!snapshot.hasData || snapshot.hasError) {
            return Center(child: Text("No users found!")); // Show empty message
          }

          List<Map<String, dynamic>> users =
              List<Map<String, dynamic>>.from(snapshot.data as List);
          return ListView.builder(
            padding: EdgeInsets.symmetric(
                vertical: 40, horizontal: widget.isFirst ? 16 : 0),
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemCount: users.length,
            itemBuilder: (context, index) {
              return _buildColumn(users[index], context);
            },
          );
        }

        // builder: (context, snapshot) {
        //   if (snapshot.hasError) {
        //     return Center(
        //       child: Text("Has Error"),
        //     );
        //   }
        //   if (snapshot.connectionState == ConnectionState.waiting) {
        //     return Center(
        //       child: CircularProgressIndicator(
        //         valueColor: AlwaysStoppedAnimation(AppColors.primaryColor),
        //       ),
        //     );
        //   }
        //   List<Map<String, dynamic>> users =
        //       List<Map<String, dynamic>>.from(snapshot.data as List);
        //   return ListView(
        //     shrinkWrap: true,
        //     scrollDirection: Axis.horizontal,
        //     padding: EdgeInsets.symmetric(
        //         vertical: 40, horizontal: isFirst ? 16 : 0),
        //     children: users
        //         .map<Widget>((userData) => _buildColumn(userData, context))
        //         .toList(),
        //   );
        // }
        );
  }

  Widget _buildColumn(Map<String, dynamic> userData, BuildContext context) {
    if (userData['email'] != _firebaseServices.getCurrentUser()!.email) {
      print("Rendering User: $userData");
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
