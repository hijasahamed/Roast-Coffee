import 'package:flutter/material.dart';
import 'package:roast_coffee/view/widgets/common_widgets/text_widget.dart';

class ProductCircleCard extends StatelessWidget {
  const ProductCircleCard({super.key,required this.screenSize,required this.imageUrl,required this.name});
  final Size screenSize;
  final String imageUrl;
  final String name;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        ClipOval(
          child: Image.network(
            imageUrl,
            width: screenSize.width * 0.15,
            height: screenSize.width * 0.15,
            fit: BoxFit.cover,
            errorBuilder: (context, error, stackTrace) {
              return Container(
                width: screenSize.width * 0.15,
                height: screenSize.width * 0.15,
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  shape: BoxShape.circle,
                ),
                child: const Icon(Icons.image, color: Colors.grey),
              );
            },
            loadingBuilder: (context, child, loadingProgress) {
              if (loadingProgress == null) {
                return child;
              }
              return SizedBox(
                width: screenSize.width * 0.15,
                height: screenSize.width * 0.15,
                child: Center(
                  child: CircularProgressIndicator(
                    value: loadingProgress.expectedTotalBytes != null
                        ? loadingProgress.cumulativeBytesLoaded / (loadingProgress.expectedTotalBytes ?? 1)
                        : null,
                    strokeWidth: 2,
                    color: const Color.fromARGB(255, 247, 247, 247),
                  ),
                ),
              );
            },
          ),
        ),
        TextWidget(text: name, color: Color(0XFF6E8382), size: screenSize.width/35, weight: FontWeight.w500)
      ],
    );
  }
}