import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:roast_coffee/controller/coffee_order_controller.dart';
import 'package:roast_coffee/view/widgets/cart_screen_widgets/cart_add_button.dart';
import 'package:roast_coffee/view/widgets/cart_screen_widgets/cart_appbar_widget.dart';
import 'package:roast_coffee/view/widgets/common_widgets/text_widget.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key,required this.screenSize,required this.product});
  final Size screenSize;
  final dynamic product;
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<CoffeeOrderProvider>(context);
    return PopScope(
      canPop: true,
      onPopInvokedWithResult: (didPop, result) {
        if (didPop) {
          Provider.of<CoffeeOrderProvider>(context, listen: false).resetCount();
        }
      },
      child: Scaffold(
        backgroundColor: Color(0XFFF5F5F5),
        appBar: CartAppbarWidget(screenSize: screenSize, product: product),
        body: Stack(
          children: [
            Container(
              color: Color(0XFFFFFFFF),
              child: Column(
                children: [
                  Image.network(
                    product.imageUrl,
                    fit: BoxFit.cover,
                    height: screenSize.height / 4,
                    width: screenSize.width,
                    loadingBuilder: (context, child, loadingProgress) {
                      if (loadingProgress == null) return child;
      
                      return Container(
                        height: screenSize.height / 3.8,
                        width: screenSize.width,
                        color: Colors.grey[300],
                        child: Center(
                          child: CircularProgressIndicator(
                            color: Colors.blueGrey,
                            value: loadingProgress.expectedTotalBytes != null
                                ? loadingProgress.cumulativeBytesLoaded /
                                    (loadingProgress.expectedTotalBytes ?? 1)
                                : null,
                          ),
                        ),
                      );
                    },
                    errorBuilder: (context, error, stackTrace) {
                      return Container(
                        height: screenSize.height / 3.8,
                        width: screenSize.width,
                        color: Colors.grey[300],
                        child: Image.asset(
                          'assets/images/placeholder.png',
                          fit: BoxFit.cover,
                        ),
                      );
                    },
                  ),
                  SizedBox(height: screenSize.height / 125),
                  Flexible(
                    child: Container(
                      padding: EdgeInsets.all(screenSize.width/20),
                      width: screenSize.width,
                      color: Color(0XFF356B69),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(height: screenSize.width/15),
                          _buildSectionTitle("Cup size"),
                          _buildCups(),
                          SizedBox(height: screenSize.width/55),
                          _buildSizeOptions(provider),
                          SizedBox(height: screenSize.width/25),
                          Divider(color: Color(0XFFFFFFFF),thickness: .25,),
                          SizedBox(height: screenSize.width/55),
                          _buildSectionTitle("Milk options"),
                          SizedBox(height: screenSize.width/55),
                          _buildMilkOptions(provider),
                          SizedBox(height: screenSize.width/25),
                          Divider(color: Color(0XFFFFFFFF),thickness: .25,),
                          SizedBox(height: screenSize.width/55),
                          _buildSectionTitle("Count"),
                          _buildCounter(provider),
                          SizedBox(height: screenSize.width/10),
                          CartAddButton(product: product,screenSize: screenSize,provider: provider,)
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Positioned( 
              top: screenSize.width/2.25,
              left: screenSize.width / 28,
              right: screenSize.width / 28,
              child: Container(
                height: screenSize.height / 8.9,
                width: screenSize.width * 0.9,
                padding: EdgeInsets.only(left: screenSize.width/22,right: screenSize.width/22,top: screenSize.width/35,bottom: screenSize.width/35),
                decoration: BoxDecoration(
                  color: Color(0XFFFFFFFF),
                  borderRadius: BorderRadius.circular(screenSize.width / 40),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  spacing: screenSize.width/75,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TextWidget(text: product.name, color: Color(0XFF356B69), size: screenSize.width/25, weight: FontWeight.w600),
                        Spacer(), 
                        Icon(Icons.favorite_border,color: Color(0XFF6E8382),)
                      ],
                    ),
                    Row(
                      children: [
                        Image.asset(
                          'assets/images/tabler-icon-star-filled.png',
                          height: screenSize.width / 30,
                          width: screenSize.width / 30,
                        ),
                        SizedBox(width: screenSize.width / 70),
                        TextWidget(text: '${product.rating}', color: Color(0XFF6E8382), size: screenSize.width / 35, weight: FontWeight.w500),
                        SizedBox(width: screenSize.width / 150),
                        TextWidget(text: '(${product.ratingCount.toString()})', color: Color(0XFF6E8382), size: screenSize.width / 35, weight: FontWeight.w500),
                        SizedBox(width: screenSize.width / 3.7),
                        TextWidget(text: product.makingTime, color: Color(0XFF6E8382), size: screenSize.width / 35, weight: FontWeight.w500),
                      ],
                    ),
                    TextWidget(text: '${product.currency} ${product.price}', color: Color(0XFFCEAC6D), size: screenSize.width / 30, weight: FontWeight.w600),
                  ],
                ),
              ),
            ),
          ],
        )
      ),
    );
  }

  Row _buildCups() {
    return Row(
      spacing: screenSize.width/20,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset('assets/images/tabler-icon-cup.png',height: screenSize.width/9,width: screenSize.width/9,),
        Image.asset('assets/images/tabler-icon-cup.png',height: screenSize.width/9,width: screenSize.width/9,),
        Image.asset('assets/images/tabler-icon-cup.png',height: screenSize.width/9,width: screenSize.width/9,),
      ],
    );
  }


  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: EdgeInsets.only(bottom: screenSize.width/23),
      child: TextWidget(text: title, color: Color(0XFFFFFFFF), size: screenSize.width/25, weight: FontWeight.w600),
    );
  }

  Widget _buildSizeOptions(CoffeeOrderProvider provider) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: ["Small", "Medium", "Large"].map((size) {
        return _buildOptionButton(
          text: size,
          isSelected: provider.selectedSize == size,
          onTap: () => provider.selectSize(size),
        );
      }).toList(),
    );
  }

  Widget _buildMilkOptions(CoffeeOrderProvider provider) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: ["Regular", "Skimmed", "Whole"].map((milk) {
        return _buildOptionButton(
          text: milk,
          isSelected: provider.selectedMilk == milk,
          onTap: () => provider.selectMilk(milk),
        );
      }).toList(),
    );
  }

  Widget _buildOptionButton({required String text, required bool isSelected, required VoidCallback onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: screenSize.width/50),
        padding: EdgeInsets.symmetric(horizontal: screenSize.width/20, vertical: screenSize.width/100),
        decoration: BoxDecoration(
          color: isSelected ? Colors.white : Colors.transparent,
          borderRadius: BorderRadius.circular(screenSize.width/15),
          border: Border.all(color: Colors.white),
        ),
        child: TextWidget(text: text, color: isSelected? Color(0XFF356B69):Color(0XFFFFFFFF), size: screenSize.width/32, weight: FontWeight.w500),
      ),
    );
  }

  Widget _buildCounter(CoffeeOrderProvider provider) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _buildCounterButton("-", () => provider.decrementCount()),
        Container(
          margin: EdgeInsets.symmetric(horizontal: screenSize.width/30),
          width: screenSize.width/6.5,
          height: screenSize.width/11,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(screenSize.width/25),
            color: Colors.white
          ),
          child: Center(child: TextWidget(text: provider.count.toString(), color: Color(0XFF356B69), size: screenSize.width/20, weight: FontWeight.w600)),
        ),
        _buildCounterButton("+", () => provider.incrementCount()),
      ],
    );
  }

  Widget _buildCounterButton(String text, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: screenSize.width/6.5,
        height: screenSize.width/11,
        decoration: BoxDecoration(
          color: Colors.transparent,
          border: Border.all(color: Colors.white),
          borderRadius: BorderRadius.circular(20),
        ),
        alignment: Alignment.center,
        child:
         TextWidget(text: text, color: Colors.white, size: screenSize.width/15, weight: FontWeight.w500),
      ),
    );
  }
}