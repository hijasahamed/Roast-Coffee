import 'package:flutter/material.dart';
import 'package:roast_coffee/view/widgets/common_widgets/text_widget.dart';
import 'package:roast_coffee/view/widgets/home_screen_widget/search_bar_widget.dart';

class ProductsAppbarWidget extends StatelessWidget implements PreferredSizeWidget{
  const ProductsAppbarWidget({
    super.key,
    required this.screenSize,
  });

  final Size screenSize;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      backgroundColor: Color(0XFF356B69),
      toolbarHeight: screenSize.width/4,
      flexibleSpace: Container(
        padding: EdgeInsets.only(bottom: screenSize.width/50),
        decoration: BoxDecoration(
          image: DecorationImage(image: AssetImage('assets/images/reward transparent.png'))
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          spacing: screenSize.width/55,
          children: [
            Padding(
              padding: EdgeInsets.only(right: screenSize.width/25),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    }, 
                    icon: Icon(Icons.arrow_back_ios,color: Colors.white,size: screenSize.width/22,)
                  ),
                  TextWidget(text: 'Products', color: Colors.white, size: screenSize.width/20, weight: FontWeight.w600),
                  Image.asset('assets/images/settings icon.png',fit: BoxFit.cover,height: screenSize.width/15,width: screenSize.width/15,)
                ],
              ),
            ),
            SearchBarWidget(screenSize: screenSize),
          ],
        ),
      ),
    );
  }
  @override
  Size get preferredSize => Size.fromHeight(screenSize.height/9);
}