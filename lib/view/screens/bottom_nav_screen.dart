import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:roast_coffee/controller/bottom_nav_controller.dart';
import 'package:roast_coffee/view/widgets/bottom_nav_widgets/bottom_icon.dart';
import 'package:roast_coffee/view/widgets/bottom_nav_widgets/bottom_title.dart';

class BottomNavScreen extends StatelessWidget {
  const BottomNavScreen({super.key,required this.screenSize});
  final Size screenSize;

  @override
  Widget build(BuildContext context) {
    final bottomNavProvider = Provider.of<BottomNavProvider>(context);

    return Scaffold(
      body: bottomNavProvider.getScreen(bottomNavProvider.currentIndex, screenSize),
      bottomNavigationBar: Container(
        padding: EdgeInsets.symmetric(vertical: screenSize.width/25,horizontal: screenSize.width/35),
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 5,
              spreadRadius: 1,
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: List.generate(5, (index) {
            return GestureDetector(
              onTap: () => bottomNavProvider.setIndex(index),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  AnimatedContainer(
                    duration: Duration(milliseconds: 0),
                    padding: EdgeInsets.symmetric(horizontal: screenSize.width/35, vertical: screenSize.width/50),
                    decoration: BoxDecoration(
                      color: bottomNavProvider.currentIndex == index
                          ? Color(0xFFCEAC6D)
                          : Colors.transparent,
                      borderRadius: BorderRadius.circular(screenSize.width/50),
                    ),
                    child: Column(
                      children: [
                        Image.asset(
                          getIcon(index: index,isSelected: bottomNavProvider.currentIndex == index),
                          width: 24, 
                          height: 24,
                        ),
                        SizedBox(height: screenSize.width / 100),
                        Text(
                          getLabel(index),
                          style: TextStyle(
                            color: bottomNavProvider.currentIndex == index
                                ? Colors.white
                                : Colors.grey.shade700,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          }),
        ),
      ),
    );
  }
}