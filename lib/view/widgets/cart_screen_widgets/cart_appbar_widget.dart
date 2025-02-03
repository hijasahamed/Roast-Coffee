import 'package:flutter/material.dart';
import 'package:roast_coffee/view/widgets/common_widgets/text_widget.dart';

class CartAppbarWidget extends StatelessWidget implements PreferredSizeWidget{
  const CartAppbarWidget({
    super.key,
    required this.screenSize,
    required this.product,
  });

  final Size screenSize;
  final dynamic product;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Color(0XFF356B69),
      leading: IconButton(
        onPressed: () {
          Navigator.of(context).pop();
        }, 
        icon: Icon(Icons.arrow_back_ios,color: Colors.white,size: screenSize.width/22,)
      ),
      title: TextWidget(text: product.name, color: Colors.white, size: screenSize.width/20, weight: FontWeight.w600),
      centerTitle: true,
      flexibleSpace: Container(
      decoration: BoxDecoration(
        image: DecorationImage(image: AssetImage('assets/images/reward transparent.png'))
      ),
    ),
    actions: [
      Image.asset('assets/images/settings icon.png',fit: BoxFit.cover,height: screenSize.width/15,width: screenSize.width/15,)
    ],
    actionsPadding: EdgeInsets.only(right: screenSize.width/20),
    );
  }
  @override
  Size get preferredSize => Size.fromHeight(screenSize.height/15);
}