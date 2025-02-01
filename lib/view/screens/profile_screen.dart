import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
      extendBodyBehindAppBar: false,
      appBar: AppBar(
        toolbarHeight: screenSize.height/4,
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: Colors.white, 
          statusBarIconBrightness: Brightness.light,
          statusBarBrightness: Brightness.light,
        ),
        flexibleSpace: ProfileAppbarWidget(screenSize: screenSize),
      ),
      body: Container(
        margin: EdgeInsets.only(left: screenSize.width/20,right: screenSize.width/20),
        padding: EdgeInsets.only(left: screenSize.width/17,right: screenSize.width/17,top: screenSize.width/25,),
        height: screenSize.height,
        width: screenSize.width,
        color: Color(0XFFFFFFFF),
        child: Column(
          children: [
            WalletAddressWidget(image: 'assets/images/tabler-icon-wallet blue.png', subtitle: 'BHD 86.000', title: 'Wallet Balance', screenSize: screenSize,cardnum: 1,),
            Divider(color: Color(0XFF6E8382),thickness: .3,),
            WalletAddressWidget(image: 'assets/images/tabler-icon-address-book blue.png', subtitle: '107, Omar Bin Abdulaziz Avenue Al Hoora, Manama, Capital Governorate, Bahrain, 0319.', title: 'Address', screenSize: screenSize,cardnum: 2,),
            Divider(color: Color(0XFF6E8382),thickness: .3,),
            Expanded(
            child: Column(
              children: List.generate(detailsList.length, (index) => DetailsHolderWidget(
                image: detailsList[index]['image']!,
                screenSize: screenSize,
                title: detailsList[index]['title']!,
                isLogout: index==5? true:false
              )),
            ),
          ),
          ],
        ),
      ),
    );
  }
}