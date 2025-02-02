import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';


class ProductCardSkeleton extends StatelessWidget {
  final Size screenSize;

  const ProductCardSkeleton({super.key, required this.screenSize});

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Card(
        color: const Color(0XFFFFFFFF),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.transparent,
            borderRadius: BorderRadius.circular(screenSize.width / 35),
          ),
          padding: EdgeInsets.all(screenSize.width / 60),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Image Placeholder
              Shimmer.fromColors(
                baseColor: Colors.grey[300]!,
                highlightColor: Colors.grey[100]!,
                child: Container(
                  height: screenSize.height / 9,
                  width: screenSize.width,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(screenSize.width / 35),
                  ),
                ),
              ),
              SizedBox(height: screenSize.width / 35),

              Padding(
                padding: EdgeInsets.symmetric(horizontal: screenSize.width / 55),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Product Name Placeholder
                    Shimmer.fromColors(
                      baseColor: Colors.grey[300]!,
                      highlightColor: Colors.grey[100]!,
                      child: Container(
                        height: screenSize.width / 20,
                        width: screenSize.width / 3,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                    ),
                    SizedBox(height: screenSize.width / 50),

                    // Rating Row Placeholder
                    Row(
                      children: [
                        // Star Icon Placeholder
                        Shimmer.fromColors(
                          baseColor: Colors.grey[300]!,
                          highlightColor: Colors.grey[100]!,
                          child: Container(
                            height: screenSize.width / 28,
                            width: screenSize.width / 28,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(width: screenSize.width / 70),

                        // Rating Placeholder
                        Shimmer.fromColors(
                          baseColor: Colors.grey[300]!,
                          highlightColor: Colors.grey[100]!,
                          child: Container(
                            height: screenSize.width / 25,
                            width: screenSize.width / 10,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(width: screenSize.width / 120),

                        // Rating Count Placeholder
                        Shimmer.fromColors(
                          baseColor: Colors.grey[300]!,
                          highlightColor: Colors.grey[100]!,
                          child: Container(
                            height: screenSize.width / 35,
                            width: screenSize.width / 8,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: screenSize.width / 40),

                    // Price Placeholder
                    Shimmer.fromColors(
                      baseColor: Colors.grey[300]!,
                      highlightColor: Colors.grey[100]!,
                      child: Container(
                        height: screenSize.width / 25,
                        width: screenSize.width / 5,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}