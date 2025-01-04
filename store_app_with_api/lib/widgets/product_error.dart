import 'package:flutter/material.dart';

class ProductError extends StatelessWidget {
  const ProductError({super.key,required this.error});
  final String error;
  @override
  Widget build(BuildContext context) {
    return Center(child: Text(error),);
  }
}