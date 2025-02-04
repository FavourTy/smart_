import 'package:floww/features/screens/home/view_models/chat_provider.dart';
import 'package:floww/shared/app_assets.dart';
import 'package:floww/shared/app_colors.dart';
import 'package:floww/shared/constants.dart';
import 'package:floww/shared/custom_widget/custom_home_widget.dart';
import 'package:floww/shared/custom_widget/last_msg.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primaryColor,
        centerTitle: true,
        title: Text(
          "Home",
          style: homeTextStyle,
        ),
        leading: SizedBox(
            height: 20,
            width: 20,
            child: SvgPicture.asset(AppAssets.searchSvg)),
        // leading:
        actions: [
          Consumer<ChatProvider>(builder:
              (BuildContext context, ChatProvider chatProvider, Widget? child) {
            return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: FutureBuilder(
                  future: chatProvider.fetchCurrentUserProfileImage(),
                  builder:
                      (BuildContext context, AsyncSnapshot<String?> snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return CircleAvatar(
                        radius: 25,
                        backgroundColor:
                            Colors.grey, // Placeholder color while loading
                      );
                    } else if (snapshot.hasError) {
                      return CircleAvatar(
                        radius: 25,
                        backgroundColor: Colors
                            .grey, // Error state, you could add an error image or placeholder here
                      );
                    } else if (snapshot.hasData) {
                      return CircleAvatar(
                        backgroundImage: NetworkImage(snapshot.data!),
                        radius: 25,
                      );
                    } else {
                      return CircleAvatar(
                        radius: 25,
                        backgroundColor: AppColors.secColor,
                      );
                    }
                  },
                ));
          })
        ],
        automaticallyImplyLeading: false,
      ),
      body: Builder(builder: (context) {
        double screenHeight = MediaQuery.of(context).size.height;
        double screenWidth = MediaQuery.of(context).size.width;
        return Stack(
          children: [
            Container(
                width: screenWidth,
                height: screenHeight,
                color: AppColors.primaryColor,
                child: CustomHomeWidget()),
            Positioned(
                top: screenHeight / 2 - (screenHeight * 2 / 4) / 2,
                left: 0,
                child: Container(
                  height: screenHeight * 3 / 4,
                  width: screenWidth,
                  decoration: BoxDecoration(
                    color: AppColors.backgroundColor,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(50.0),
                      topRight: Radius.circular(50.0),
                    ),
                  ),
                  child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 20,
                      ),
                      child: AllChats()),
                ))
          ],
        );
      }),
    );
  }
}
