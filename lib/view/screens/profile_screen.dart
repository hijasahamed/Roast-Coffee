import 'package:flutter/material.dart';
import 'package:roast_coffee/model/details_list_model.dart';
import 'package:roast_coffee/view/widgets/profile_screen_widgets/details_holder_widget.dart';
import 'package:roast_coffee/view/widgets/profile_screen_widgets/profile_app_bar_widget.dart';
import 'package:roast_coffee/view/widgets/profile_screen_widgets/wallet_address_widget.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key,required this.screenSize});
  final Size screenSize;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0XFFF5F5F5),
      extendBodyBehindAppBar: true,
      body: Column(
        children: [
          ProfileAppbarWidget(screenSize: screenSize),
          Expanded(
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: screenSize.width/20),
              padding: EdgeInsets.only(left: screenSize.width/17,right: screenSize.width/17,top: screenSize.width/25,),
              color: Color(0XFFFFFFFF),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    WalletAddressWidget(image: 'assets/images/tabler-icon-wallet blue.png', subtitle: 'BHD 86.000', title: 'Wallet Balance', screenSize: screenSize,cardnum: 1,),
                    Divider(color: Color(0XFF6E8382),thickness: .3,),
                    WalletAddressWidget(image: 'assets/images/tabler-icon-address-book blue.png', subtitle: '107, Omar Bin Abdulaziz Avenue Al Hoora, Manama, Capital Governorate, Bahrain, 0319.', title: 'Address', screenSize: screenSize,cardnum: 2,),
                    Divider(color: Color(0XFF6E8382),thickness: .3,),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      mainAxisSize: MainAxisSize.max,
                      children: List.generate(detailsList.length, (index) => DetailsHolderWidget(
                        image: detailsList[index]['image']!,
                        screenSize: screenSize,
                        title: detailsList[index]['title']!,
                        isLogout: index==5? true:false
                      )),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}