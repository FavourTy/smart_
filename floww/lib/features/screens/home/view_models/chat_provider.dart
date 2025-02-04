import 'package:floww/services/chat_services.dart';
import 'package:flutter/foundation.dart';

class ChatProvider extends ChangeNotifier {
  final ChatServices chatservice;

  ChatProvider({required this.chatservice});

  Future<String?> fetchCurrentUserProfileImage() async {
    final profileImage = await chatservice.getUserProfileImage();

    return profileImage;
  }
}
