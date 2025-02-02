import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:roast_coffee/controller/home_screen_controller.dart';
import 'package:roast_coffee/view/widgets/home_screen_widget/appbar_carosal_widget.dart';
import 'package:roast_coffee/view/widgets/home_screen_widget/circlular_menu_widget.dart';
import 'package:roast_coffee/view/widgets/home_screen_widget/trending_card_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key,required this.screenSize});
  final Size screenSize;
  @override
  Widget build(BuildContext context) {
    final productProvider = Provider.of<HomeProvider>(context, listen: false);
    return Scaffold(
      backgroundColor: Color(0XFFF5F5F5),
      extendBodyBehindAppBar: true,
      body: Column(
        children: [         
          AppbarCarosalContentWidget(screenSize: screenSize),
          TrendingCardWidget(screenSize: screenSize, productProvider: productProvider),
          ProductCircularMenu(screenSize: screenSize, productProvider: productProvider),
        ],
      )
    );
  }
}

