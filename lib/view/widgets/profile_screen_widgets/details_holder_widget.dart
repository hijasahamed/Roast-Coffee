import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:roast_coffee/controller/bottom_nav_controller.dart';
import 'package:roast_coffee/controller/home_screen_controller.dart';
import 'package:roast_coffee/view/widgets/common_widgets/text_widget.dart';
import 'package:roast_coffee/view/widgets/profile_screen_widgets/login_approval_dialog.dart';

class DetailsHolderWidget extends StatelessWidget {
  const DetailsHolderWidget({super.key,required this.image,required this.screenSize,required this.title,this.isLogout});
  final String image;
  final Size screenSize;
  final String title;
  final bool? isLogout;
  @override
  Widget build(BuildContext context) {
    final homeProvider = Provider.of<HomeProvider>(context);
    final bottomNavProvider = Provider.of<BottomNavProvider>(context);
    return InkWell(
      onTap: () {
        showLogoutDialog(context, screenSize,homeProvider,bottomNavProvider);
      },
      child: Column(
        spacing: screenSize.width/75,
        children: [
          SizedBox(height: screenSize.width/200,),
          Row(
            children: [
              Image.asset(
                  image,
                  fit: BoxFit.cover,
                  height: screenSize.width / 16,
                  width: screenSize.width / 16,
                ),
                SizedBox(width: screenSize.width * 0.035),
                TextWidget(
                  text: title,
                  color: Color(isLogout==true?0XFFE9806E:0XFFCEAC6D),
                  size: screenSize.width * 0.040,
                  weight: FontWeight.w500,
                ),
            ],
          ),
          isLogout == true ?SizedBox.shrink():
          Divider(color: Color(0XFFCEAC6D),thickness: .3,)
        ],
      ),
    );
  }
}