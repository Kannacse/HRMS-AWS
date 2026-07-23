import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerLoader extends StatelessWidget {
  const ShimmerLoader({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey.shade300,
      highlightColor: Colors.grey.shade100,
      child: ListView.builder(
        itemCount: 6, // Number of skeleton sections
        padding: const EdgeInsets.all(16),
        itemBuilder: (context, index) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Title line
              Container(
                width: 200,
                height: 18,
                color: Colors.white,
              ),
              const SizedBox(height: 12),

              // Big block (banner or card)
              Container(
                width: double.infinity,
                height: 140,
                color: Colors.white,
              ),
              const SizedBox(height: 20),

              // 3 small lines
              Container(
                width: double.infinity,
                height: 14,
                color: Colors.white,
              ),
              const SizedBox(height: 10),
              Container(
                width: 250,
                height: 14,
                color: Colors.white,
              ),
              const SizedBox(height: 10),
              Container(
                width: 180,
                height: 14,
                color: Colors.white,
              ),

              const SizedBox(height: 30),
            ],
          );
        },
      ),
    );
  }
}
