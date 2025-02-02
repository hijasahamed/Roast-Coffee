import 'package:flutter/material.dart';
import 'package:roast_coffee/view/widgets/common_widgets/text_widget.dart';

class SearchBarWidget extends StatelessWidget {
  const SearchBarWidget({
    super.key,
    required this.screenSize,
  });

  final Size screenSize;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: screenSize.height/17,
      width: screenSize.width/1.1,
      padding: EdgeInsets.only(left: screenSize.width/30,right: screenSize.width/30),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(screenSize.width/50)
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          TextWidget(text: 'What are you looking for ?', color: Color(0XFF6E8382), size: screenSize.width/26, weight: FontWeight.w500,maxline: true,),
          Image.asset('assets/images/tabler-icon-adjustments-horizontal.png',fit: BoxFit.cover,height: screenSize.width/18,width: screenSize.width/18,),
        ],
      ),
    );
  }
}