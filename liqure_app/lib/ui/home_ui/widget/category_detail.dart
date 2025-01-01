import 'package:flutter/material.dart';

class CategoryDetail extends StatelessWidget {
   CategoryDetail({super.key, required this.imageUrl, required this.name});

  final String imageUrl;
  final String name;

  @override
  Widget build(BuildContext context) {
    return  Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              padding: const EdgeInsets.all(2),
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.grey.shade100,
                borderRadius: BorderRadius.circular(20)
              ),
              height: 100,
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Image.asset(imageUrl,
                      fit: BoxFit.cover,
                      ),
                    ),
                    
                    Text(name,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 30),),
                    SizedBox(width: 70,),
                    Icon(Icons.arrow_forward_ios,size: 30,),
                    
                  ],
              ),
            ),
          );
  }
}