import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:roast_coffee/controller/home_screen_controller.dart';
import 'package:roast_coffee/view/widgets/common_widgets/text_widget.dart';
import 'package:roast_coffee/view/widgets/home_screen_widget/appbar_carosal_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key,required this.screenSize});
  final Size screenSize;
  @override
  Widget build(BuildContext context) {
    final productProvider = Provider.of<HomeProvider>(context, listen: false);
    return Scaffold(
      backgroundColor: Color(0XFFF5F5F5),
      extendBodyBehindAppBar: true,
      body: Column(
        children: [         
          AppbarCarosalContentWidget(screenSize: screenSize),
          Expanded(
            child: Container(
              padding: EdgeInsets.all(screenSize.width/25),
              child: Column(
                children: [
                  Row(
                    children: [
                      TextWidget(text: 'Trending', color: Color(0XFF356B69), size: screenSize.width/20, weight: FontWeight.w600),
                      SizedBox(width: screenSize.width/55,),
                      Container(
                        height: screenSize.width/18.5,
                        width: screenSize.width/12.5,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(screenSize.width/50),
                          color: Color(0XFFCEAC6D)
                        ),
                        child: Center(child: TextWidget(text: '16', color: Color(0XFFFFFFFF), size: screenSize.width/32, weight: FontWeight.w600)),
                      ),
                      Spacer(),
                      SizedBox(
                        child: Row(
                          spacing: screenSize.width/55,
                          children: [
                            TextWidget(text: 'View all', color: Color(0XFF356B69), size: screenSize.width/30, weight: FontWeight.w600),
                            Icon(Icons.arrow_forward_ios,color: Color(0XFF356B69),size: screenSize.width/37,)
                          ],
                        ),
                      )
                    ],
                  ),
                  Expanded(
                    child: FutureBuilder(
                      future: productProvider.fetchProducts(),
                      builder: (context, snapshot) {
                        if (snapshot.connectionState == ConnectionState.waiting) {
                          return const Center(child: CircularProgressIndicator());
                        } else if (snapshot.hasError) {
                          return Center(child: Text('Error: ${snapshot.error}'));
                        }

                        return Consumer<HomeProvider>(
                          builder: (context, provider, child) {
                            return provider.products.isEmpty
                                ? const Center(child: Text("No Products Available"))
                                : ListView.builder(
                                    itemCount: provider.products.length,
                                    itemBuilder: (context, index) {
                                      final product = provider.products[index];
                                      return ProductCard(
                                        name: product.name,
                                        price: product.price,
                                        currency: product.currency,
                                        rating: product.rating,
                                        imageUrl: product.imageUrl,
                                      );
                                      
                                    },
                                  );
                          },
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      )
    );
  }
}


class ProductCard extends StatelessWidget {
  final String name;
  final double price;
  final String currency;
  final double rating;
  final String imageUrl;

  const ProductCard({
    super.key,
    required this.name,
    required this.price,
    required this.currency,
    required this.rating,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: ListTile(
        leading: Image.network(imageUrl, width: 50, height: 50, fit: BoxFit.cover),
        title: Text(name, style: const TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Text("$currency $price"),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(Icons.star, color: Colors.amber, size: 18),
            Text(rating.toStringAsFixed(1)),
          ],
        ),
      ),
    );
  }
}