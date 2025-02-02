import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class CircularCardShimmer extends StatelessWidget {
  const CircularCardShimmer({super.key,required this.screenSize});
  final Size screenSize;
  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey[300]!,
      highlightColor: Colors.grey[100]!,
      child: Column(
        spacing: screenSize.width / 25,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _shimmerItem(),
              _shimmerItem(),
              _shimmerItem(),
              _shimmerItem(),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _shimmerItem(),
              _shimmerItem(),
              _shimmerItem(),
              _shimmerItem(),
            ],
          ),
        ],
      ),
    );
  }
  Widget _shimmerItem() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      spacing: screenSize.width/35,
      children: [
        ClipOval(
          child: Container(
            width: screenSize.width * 0.15,
            height: screenSize.width * 0.15,
            color: Colors.grey[300],
          ),
        ),
        Container(
          width: screenSize.width * 0.15,
          height: 10,
          color: Colors.grey[300],
        ),
      ],
    );
  }
}