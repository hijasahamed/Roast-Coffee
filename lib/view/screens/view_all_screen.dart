import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:roast_coffee/controller/home_screen_controller.dart';
import 'package:roast_coffee/view/widgets/common_widgets/text_widget.dart';
import 'package:roast_coffee/view/widgets/home_screen_widget/product_card_widget.dart';
import 'package:roast_coffee/view/widgets/home_screen_widget/search_bar_widget.dart';

class ViewAllScreen extends StatelessWidget {
  const ViewAllScreen({super.key, required this.screenSize});
  final Size screenSize;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0XFFFFFFFF),
      appBar: AppBar(
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
                      icon: Icon(Icons.arrow_back_ios,color: Colors.white,)
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
      ),
      body: Padding(
        padding: EdgeInsets.all(screenSize.width/35),
        child: Consumer<HomeProvider>(
          builder: (context, provider, child) {
            return provider.products.isEmpty?
            Center(child: TextWidget(text: 'No products available', color: Color(0XFF356B69), size: screenSize.width/30, weight: FontWeight.w500))
            : GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,  
                crossAxisSpacing: screenSize.width / 50,  
                mainAxisSpacing: screenSize.height / 50,  
                childAspectRatio: screenSize.width / (screenSize.height / 2.0), 
              ),
              itemCount: provider.products.length,
              itemBuilder: (context, index) {
                final product = provider.products[index];
                return InkWell(
                  onTap: (){
                    Navigator.pushNamed(context, '/cart');
                  },
                  child: ProductCard(
                    name: product.name,
                    price: product.price,
                    currency: product.currency,
                    rating: product.rating,
                    imageUrl: product.imageUrl,
                    screenSize: screenSize,
                    ratingCount: product.ratingCount,
                    makingTime: product.makingTime,
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}