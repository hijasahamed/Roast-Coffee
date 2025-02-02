import 'package:flutter/material.dart';
import 'package:roast_coffee/view/widgets/reward_screen_widgets/reward_appbar_widget.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key,required this.screenSize});
  final Size screenSize;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: RewardAppbarWidget(screenSize: screenSize,),
    );
  }
}