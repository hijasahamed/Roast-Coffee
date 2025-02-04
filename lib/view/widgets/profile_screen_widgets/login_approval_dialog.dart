import 'package:flutter/material.dart';
import 'package:roast_coffee/controller/home_screen_controller.dart';
import 'package:roast_coffee/view/widgets/common_widgets/text_widget.dart';

void showLogoutDialog(BuildContext context, Size screenSize, HomeProvider homeProvider) {
  showDialog(
    context: context,
    builder: (context) {
      return Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(screenSize.width / 30),
        ),
        backgroundColor: Colors.white,
        child: Padding(
          padding: EdgeInsets.all(screenSize.width / 20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextWidget(
                text: 'Logout',
                color: Color(0XFF356B69),
                size: screenSize.width / 18,
                weight: FontWeight.w600,
              ),
              SizedBox(height: screenSize.width / 30),
              TextWidget(
                text: 'Are you sure you want to logout?',
                color: Color(0XFF6E8382),
                size: screenSize.width / 25,
                weight: FontWeight.w500,
              ),
              SizedBox(height: screenSize.width / 15),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Cancel Button
                  Expanded(
                    child: InkWell(
                      onTap: () => Navigator.pop(context),
                      child: Container(
                        padding: EdgeInsets.symmetric(vertical: screenSize.width / 30),
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: Colors.grey[300],
                          borderRadius: BorderRadius.circular(screenSize.width / 40),
                        ),
                        child: TextWidget(
                          text: 'Cancel',
                          color: Color(0XFF356B69),
                          size: screenSize.width / 25,
                          weight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: screenSize.width / 25),
                  // Logout Button
                  Expanded(
                    child: InkWell(
                      onTap: () {
                        homeProvider.logoutUser(context);
                      },
                      child: Container(
                        padding: EdgeInsets.symmetric(vertical: screenSize.width / 30),
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: Color(0XFFCEAC6D),
                          borderRadius: BorderRadius.circular(screenSize.width / 40),
                        ),
                        child: TextWidget(
                          text: 'Logout',
                          color: Colors.white,
                          size: screenSize.width / 25,
                          weight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      );
    },
  );
}