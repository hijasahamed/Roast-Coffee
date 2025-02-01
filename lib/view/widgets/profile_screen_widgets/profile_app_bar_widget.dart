import 'package:flutter/material.dart';
import 'package:roast_coffee/view/widgets/common_widgets/text_widget.dart';
import 'package:roast_coffee/view/widgets/profile_screen_widgets/order_reward_tile_widget.dart';

class ProfileAppbarWidget extends StatelessWidget {
  const ProfileAppbarWidget({
    super.key,
    required this.screenSize,
  });

  final Size screenSize;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: screenSize.width,
      decoration: BoxDecoration(
        color: Color(0XFF356B69),
        image: DecorationImage(image: AssetImage('assets/images/transparent frame.png'))
      ),
      child: Padding(
        padding: EdgeInsets.all(screenSize.width/25),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(height: screenSize.height/30,),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextWidget(text: 'Profile', color: Colors.white, size: screenSize.width/20, weight: FontWeight.w600),
                SizedBox(width: screenSize.width/3.15,),
                Image.asset('assets/images/settings icon.png',fit: BoxFit.cover,height: screenSize.width/15,width: screenSize.width/15,)
              ],
            ),
            SizedBox(height: screenSize.height/75,),
            CircleAvatar(
              radius: screenSize.width/17,
              backgroundImage: AssetImage('assets/images/profile image.png'),
            ),
            SizedBox(height: screenSize.height/100,),
            TextWidget(text: 'Kamjoo Bayat', color: Colors.white, size: screenSize.width/25, weight: FontWeight.w500),
            TextWidget(text: '+973 56 89 52 41', color: Colors.white, size: screenSize.width/25, weight: FontWeight.w500),
            SizedBox(height: screenSize.height/100,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                OrderRewardTile(
                  icon: 'assets/images/tabler-icon-wallet.png',
                  title: "Total Orders",
                  value: '552',
                  screenSize: screenSize,
                ),
                Container(
                  height: screenSize.height * 0.05,
                  width: 1,
                  color: Colors.white54,
                ),
                OrderRewardTile(
                  icon: 'assets/images/tabler-icon-award w.png',
                  title: "Reward Points",
                  value: '585',
                  screenSize: screenSize,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}