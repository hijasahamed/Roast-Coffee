import 'package:flutter/material.dart';
import 'package:roast_coffee/view/widgets/common_widgets/text_widget.dart';

class UnKnownRouteScreen extends StatelessWidget {
  const UnKnownRouteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(child: TextWidget(text: 'Something went wrong', color: Colors.black, size: 15, weight: FontWeight.w500),),
    );
  }
}