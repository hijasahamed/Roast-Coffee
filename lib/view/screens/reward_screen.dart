import 'package:flutter/material.dart';
import 'package:roast_coffee/view/widgets/reward_screen_widgets/reward_appbar_widget.dart';
import 'package:roast_coffee/view/widgets/reward_screen_widgets/reward_body_widget.dart';

class RewardScreen extends StatelessWidget {
  const RewardScreen({super.key,required this.screenSize});
  final Size screenSize;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0XFFF5F5F5),
      appBar: RewardAppbarWidget(screenSize: screenSize),
      body: RewardBodyContentWidget(screenSize: screenSize),
    );
  }
}