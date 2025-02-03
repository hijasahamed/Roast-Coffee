import 'package:flutter/material.dart';
import 'package:roast_coffee/view/widgets/products_screen_widgets/products_appbar_widget.dart';

class OrdersScreen extends StatelessWidget {
  const OrdersScreen({super.key,required this.screenSize});
  final Size screenSize;
  @override
  Widget build(BuildContext context) {
    // return FutureBuilder<List<Product>>(
    //   future: DatabaseService().getAllProducts(),
    //   builder: (context, snapshot) {
    //     if (snapshot.connectionState == ConnectionState.waiting) {
    //       return Center(child: CircularProgressIndicator());
    //     } else if (snapshot.hasError) {
    //       return Center(child: Text('Error hhh: ${snapshot.error}'));
    //     } else if (snapshot.data!.isEmpty) {
    //       return Center(child: Text('No products added to the cart.'));
    //     } else {
    //       final products = snapshot.data!;
    //       return ListView.builder(
    //         itemCount: products.length,
    //         itemBuilder: (context, index) {
    //           final product = products[index];
    //           return ListTile(
    //             title: Text(product.name),
    //             subtitle: Text('${product.currency} ${product.price}'),
    //             leading: Image.network(product.imageUrl),
    //             trailing: IconButton(
    //               icon: Icon(Icons.remove_shopping_cart),
    //               onPressed: () {
    //                 // Implement remove product from database
    //               },
    //             ),
    //           );
    //         },
    //       );
    //     }
    //   },
    // );
    return Scaffold(  
      backgroundColor: Color(0XFFF5F5F5),
      appBar: ProductsAppbarWidget(screenSize: screenSize,isProduct: false,title: 'Order History',),
    );
  }
}