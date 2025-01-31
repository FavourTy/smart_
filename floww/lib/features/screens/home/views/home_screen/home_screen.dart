import 'package:floww/shared/app_colors.dart';
import 'package:floww/shared/constants.dart';
import 'package:floww/shared/custom_widget/custom_home_widget.dart';
import 'package:floww/shared/custom_widget/custom_list_tile.dart';
import 'package:flutter/material.dart';

import '../../../shared/app_assets.dart';

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
        leading: Icon(
          Icons.search,
          color: AppColors.secColor,
        ),
        // leading:
        actions: [
          Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: CircleAvatar(
                backgroundColor: AppColors.backgroundColor,
                radius: 25,
              ))
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
                child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(children: [
                      CustomHomeWidget(text: "Sam"),
                      CustomHomeWidget(text: "mikun"),
                      CustomHomeWidget(text: "Favy"),
                      SizedBox(
                        width: 10,
                      ),
                      CustomHomeWidget(text: "Lois"),
                      SizedBox(
                        width: 10,
                      ),
                      CustomHomeWidget(text: "Tayo"),
                      SizedBox(
                        width: 10,
                      ),
                      CustomHomeWidget(text: "pebbs"),
                      SizedBox(
                        width: 10,
                      ),
                      CustomHomeWidget(text: "Savy"),
                    ]))),
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
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 20,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomListTile(
                              title: "Favour Ade",
                              subtititle: "Hello",
                              text: "2 min ago"),
                          SizedBox(
                            height: 10,
                          ),
                          CustomListTile(
                              title: "Favour Ade",
                              subtititle: "Hello",
                              text: "2 min ago"),
                          SizedBox(
                            height: 10,
                          ),
                          CustomListTile(
                              title: "Favour Ade",
                              subtititle: "Hello",
                              text: "2 min ago"),
                          SizedBox(
                            height: 10,
                          ),
                          CustomListTile(
                              title: "Favour Ade",
                              subtititle: "Hello",
                              text: "2 min ago"),
                          SizedBox(
                            height: 10,
                          ),
                          CustomListTile(
                              title: "Favour Ade",
                              subtititle: "Hello",
                              text: "2 min ago"),
                          SizedBox(
                            height: 10,
                          ),
                          CustomListTile(
                              title: "Favour Ade",
                              subtititle: "Hello",
                              text: "2 min ago"),
                          SizedBox(
                            height: 10,
                          ),
                          CustomListTile(
                              title: "Favour Ade",
                              subtititle: "Hello",
                              text: "2 min ago"),
                          SizedBox(
                            height: 10,
                          ),
                          CustomListTile(
                              title: "Favour Ade",
                              subtititle: "Hello",
                              text: "2 min ago"),
                        ],
                      ),
                    ),
                  ),
                ))
          ],
        );
      }),
    );
  }
}
