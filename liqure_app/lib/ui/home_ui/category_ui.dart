import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:liqure_app/ui/home_ui/category_details/beer_detail.dart';
import 'package:liqure_app/ui/home_ui/category_details/rum_detail.dart';
import 'package:liqure_app/ui/home_ui/category_details/whisky_detail.dart';
import 'package:liqure_app/ui/home_ui/category_details/wine_detail.dart';
import 'package:liqure_app/ui/home_ui/widget/category_detail.dart';

class CategoryUi extends StatefulWidget {
  const CategoryUi({super.key});

  @override
  State<CategoryUi> createState() => _CategoryUiState();
}

class _CategoryUiState extends State<CategoryUi> {
  final Color _backgroundColor = const Color(0xff4a4e69);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _backgroundColor,
      appBar: AppBar(
        backgroundColor: _backgroundColor,
        centerTitle: true,
        title: const Text(
          "Categories",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Icon(
              Icons.shopping_cart,
              color: Colors.black38,
              size: 30,
            ),
          )
        ],
      ),
      body: Column(
        children: [
          InkWell(
              onTap: () {
                Get.to( const BeerDetail());
              },
              child: CategoryDetail(
                  imageUrl: "images/beer/heineken.webp", name: "Beer")),
          InkWell(
            onTap: () => Get.to(const WhiskyDetail()),
            child: CategoryDetail(imageUrl: "images/whkyforcate.webp", name: "Whiskey")),
          InkWell(
            onTap: ()=> Get.to(const RumDetail()),
            child: CategoryDetail(imageUrl: "images/icons/last.webp", name: "Rum")),
          InkWell(
            onTap: () => Get.to(const WineDetail()),
            child: CategoryDetail(imageUrl: "images/wineforcat2.jpg", name: "Wine"))
        ],
      ),
    );
  }
}
