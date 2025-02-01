import 'package:flutter/material.dart';
import 'package:roast_coffee/view/widgets/common_widgets/text_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key,required this.screenSize});
  final Size screenSize;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      body: Column(
        children: [         
          Stack(
            children: [
              Container(
                color: Colors.blue,
                height: 400,
              ),
              Container(
                height: 300,
                decoration: BoxDecoration(
                  color: Color(0XFF356B69),
                  image: DecorationImage(image: AssetImage('assets/images/transparent frame.png'),fit: BoxFit.cover)
                ),
              ),
              Positioned(
                top: screenSize.height/20,
                child: Padding(
                  padding: EdgeInsets.all(screenSize.width/25),
                  child: Column(
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: screenSize.width/1.8,
                            child: TextWidget(text: 'What are you craving today?', color: Colors.white, size: screenSize.width/20, weight: FontWeight.w600,maxline: true,)
                          ),
                          SizedBox(width: screenSize.width/3.6,),
                          Image.asset('assets/images/settings icon.png',fit: BoxFit.cover,height: screenSize.width/15,width: screenSize.width/15,)
                        ],
                      ),
                      Row(
                        children: [
                          
                        ],
                      ),
                    ],
                  ),
                ),
              )
            ],
          )
        ],
      )
    );
  }
}