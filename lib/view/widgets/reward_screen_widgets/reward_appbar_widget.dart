import 'package:flutter/material.dart';
import 'package:roast_coffee/view/widgets/common_widgets/text_widget.dart';

class RewardAppbarWidget extends StatelessWidget implements PreferredSizeWidget{
  const RewardAppbarWidget({
    super.key,
    required this.screenSize,
  });

  final Size screenSize;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Color(0XFF356B69),
      centerTitle: true,
      title: TextWidget(text: 'Rewards and offers', color: Colors.white, size: screenSize.width/20, weight: FontWeight.w600),
      flexibleSpace: Container(
        decoration: BoxDecoration(
          image: DecorationImage(image: AssetImage('assets/images/reward transparent.png'))
        ),
      ),
      actions: [
        Image.asset('assets/images/settings icon.png',fit: BoxFit.cover,height: screenSize.width/15,width: screenSize.width/15,)
      ],
      actionsPadding: EdgeInsets.only(right: screenSize.width/25),
    );
  }
  @override
  Size get preferredSize => Size.fromHeight(screenSize.height/15);
}