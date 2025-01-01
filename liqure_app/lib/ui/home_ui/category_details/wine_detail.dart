import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:liqure_app/data/data.dart';
import 'package:liqure_app/ui/home_ui/widget/category_body.dart';
import 'package:liqure_app/ui/home_ui/widget/category_card.dart';

class WineDetail extends StatefulWidget {
  const WineDetail({super.key});

  @override
  State<WineDetail> createState() => _WineDetailState();
}

class _WineDetailState extends State<WineDetail> {

  final Color _backgroundColor = const Color(0xff4a4e69);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: _backgroundColor,
        leading:  GestureDetector(
          onTap: () => Get.back(),
          child: const Icon(
            Icons.arrow_back_ios,
            size: 30,
          ),
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Icon(
              Icons.shopping_cart,
              size: 30,
              color: Colors.black54,
            ),
          ),
        ],
      ),
      body: Column(
        children: [
         const CategoryBody(bigItemName: "WINE", smallItemName: "wine", bottleIcon: "images/wine/winenobg.png"),
         const SizedBox(height: 10,),
          CategoryCard(bottle: wineList),
         
        ],
      )
      
     
    );
  }
}