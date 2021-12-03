import 'package:flutter/material.dart';

class ProductDetailScreen extends StatelessWidget {
  final String? title;
  final String? imageUrl;
  final double? price;
  const ProductDetailScreen({
    this.title,
    this.imageUrl,
    this.price,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title!),
      ),
    );
  }
}
