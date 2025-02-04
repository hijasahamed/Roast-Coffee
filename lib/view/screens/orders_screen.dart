import 'package:flutter/material.dart';
import 'package:roast_coffee/model/product_model.dart';
import 'package:roast_coffee/service/data_base_service.dart';
import 'package:roast_coffee/view/widgets/common_widgets/text_widget.dart';
import 'package:roast_coffee/view/widgets/products_screen_widgets/products_appbar_widget.dart';

class OrdersScreen extends StatelessWidget {
  const OrdersScreen({super.key,required this.screenSize});
  final Size screenSize;
  @override
  Widget build(BuildContext context) {
    return Scaffold(  
      backgroundColor: Color(0XFFF5F5F5),
      appBar: ProductsAppbarWidget(screenSize: screenSize,isProduct: false,title: 'Order History',),
      body: FutureBuilder<List<Product>>(
        future: DatabaseService().getAllProducts(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator(color: Colors.blue,strokeWidth: 2,));
          } else if (snapshot.hasError) {
            return Center(child: Text('Error hhh: ${snapshot.error}'));
          } else if (snapshot.data!.isEmpty) {
            return Center(child: TextWidget(text: 'Cart is empty', color: Color(0XFF356B69), size: screenSize.width/25, weight: FontWeight.w500));
          } else {
            final products = snapshot.data!;
            return Padding(
              padding: EdgeInsets.symmetric(horizontal: screenSize.width/20,vertical: screenSize.width/22),
              child: ListView.builder(
                itemCount: products.length,
                itemBuilder: (context, index) {
                  final product = products[index];
                  return Container(
                    width: screenSize.width,
                    padding: EdgeInsets.symmetric(horizontal: screenSize.width/45,vertical: screenSize.width/45),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(screenSize.width/35),
                      color: Color(0XFFFFFFFF)
                    ),
                    child: Row(
                      spacing: screenSize.width/25,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(screenSize.width/35),
                          child: Image.network(
                            product.imageUrl,
                            height: screenSize.width / 4.3,
                            width: screenSize.width / 2.8,
                            fit: BoxFit.cover,
                          ),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            TextWidget(text: product.name, color: Color(0XFF356B69), size: screenSize.width / 22, weight: FontWeight.w600),
                            TextWidget(text: '${product.currency} ${product.price}', color: Color(0XFFCEAC6D), size: screenSize.width / 35, weight: FontWeight.w600),
                            TextWidget(text: index==0? 'Order placed.':'Order placed.', color: index==0? Color(0XFF6E8382):Color(0XFF73AB89), size: screenSize.width/35, weight: FontWeight.w500)
                          ],
                        )
                      ],
                    ),
                  );
                },
              ),
            );
          }
        },
      ),
    );
  }
}