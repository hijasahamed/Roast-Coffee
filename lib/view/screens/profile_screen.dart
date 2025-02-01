import 'package:flutter/material.dart';
import 'package:roast_coffee/view/widgets/profile_screen_widgets/profile_app_bar_widget.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key,required this.screenSize});
  final Size screenSize;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0XFFF5F5F5),
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        toolbarHeight: screenSize.height/4,
        flexibleSpace: ProfileAppbarWidget(screenSize: screenSize),
      ),
    );
  }
}