import 'package:flutter/material.dart';
import 'package:roast_coffee/view/widgets/common_widgets/text_widget.dart';
import 'package:roast_coffee/view/widgets/home_screen_widget/appbar_carosal_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key,required this.screenSize});
  final Size screenSize;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0XFFF5F5F5),
      extendBodyBehindAppBar: true,
      body: Column(
        children: [         
          AppbarCarosalContentWidget(screenSize: screenSize),
          Expanded(
            child: Container(
              padding: EdgeInsets.all(screenSize.width/25),
              child: Column(
                children: [
                  Row(
                    children: [
                      TextWidget(text: 'Trending', color: Color(0XFF356B69), size: screenSize.width/20, weight: FontWeight.w600),
                      SizedBox(width: screenSize.width/55,),
                      Container(
                        height: screenSize.width/18.5,
                        width: screenSize.width/12.5,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(screenSize.width/50),
                          color: Color(0XFFCEAC6D)
                        ),
                        child: Center(child: TextWidget(text: '16', color: Color(0XFFFFFFFF), size: screenSize.width/32, weight: FontWeight.w600)),
                      ),
                      Spacer(),
                      SizedBox(
                        child: Row(
                          spacing: screenSize.width/55,
                          children: [
                            TextWidget(text: 'View all', color: Color(0XFF356B69), size: screenSize.width/30, weight: FontWeight.w600),
                            Icon(Icons.arrow_forward_ios,color: Color(0XFF356B69),size: screenSize.width/37,)
                          ],
                        ),
                      )
                    ],
                  ),
                  
                ],
              ),
            ),
          )
        ],
      )
    );
  }
}