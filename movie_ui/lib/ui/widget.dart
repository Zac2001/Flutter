import 'package:flutter/material.dart';

class TitleWidget extends StatelessWidget {
  const TitleWidget({
    super.key,
    required this.title
  });

  final String title;

  @override
  Widget build(BuildContext context) {

    

    return Padding(
      padding: EdgeInsets.all(16),
      child: Text(title,
      style: TextStyle(
        color: Colors.white,
        fontSize: 16,
        fontWeight: FontWeight.w400,
        letterSpacing: 1,
        
      ),),
    );
  }
}