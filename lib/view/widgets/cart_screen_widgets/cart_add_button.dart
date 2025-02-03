import 'package:flutter/material.dart';
import 'package:roast_coffee/view/widgets/common_widgets/text_widget.dart';

class CartAddButton extends StatelessWidget {
  final Size screenSize;
  final dynamic product;

  const CartAddButton({
    super.key,
    required this.screenSize,
    required this.product,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      borderRadius: BorderRadius.circular(screenSize.width / 10),
      child: InkWell(
        onTap: () {
          
        },
        child: Ink(
          width: screenSize.width / 1.1,
          height: screenSize.width / 7.5,
          decoration: BoxDecoration(
            color: const Color(0XFFCEAC6D),
            borderRadius: BorderRadius.circular(screenSize.width / 10),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            spacing: screenSize.width/15,
            children: [
              TextWidget(
                text: 'Add to cart',
                color: Colors.white,
                size: screenSize.width / 23,
                weight: FontWeight.w600,
              ),
              Container(
                height: screenSize.width / 12,
                width: screenSize.width / 300,
                color: Colors.white,
              ),
              TextWidget(
                text: '${product.currency} ${product.price}',
                color: Colors.white,
                size: screenSize.width / 23,
                weight: FontWeight.w600,
              ),
            ],
          ),
        ),
      ),
    );
  }
}