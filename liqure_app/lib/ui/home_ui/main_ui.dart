// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:liqure_app/ui/home_ui/widget/category_slider.dart';

class MainUi extends StatefulWidget {
  const MainUi({super.key});

  @override
  State<MainUi> createState() => _MainUiState();
}

class _MainUiState extends State<MainUi> {
  final Color _backgroundColor = const Color(0xff4a4e69);
  int _currentSlide = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _backgroundColor,
      appBar: AppBar(
          backgroundColor: _backgroundColor,
          title: const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CircleAvatar(
                radius: 20,
                backgroundImage: AssetImage("images/logo.jpg"),
              ),
              Icon(
                Icons.shopping_cart,
                size: 35,
              ),
            ],
          )),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Stack(children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.white,
                ),
                child: TextField(
                  decoration: InputDecoration(
                      prefixIcon: Icon(Icons.search),
                      hintText: "Search....",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20))),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              SizedBox(
                height: 200,
                width: double.infinity,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(25),
                  child: PageView(
                    scrollDirection: Axis.horizontal,
                    onPageChanged: (value) {
                      setState(() {
                        _currentSlide = value;
                      });
                    },
                    children: [
                      Image.asset(
                        "images/beer-banner.webp",
                        fit: BoxFit.cover,
                      ),
                      Image.asset(
                        "images/banner1.webp",
                        fit: BoxFit.cover,
                      ),
                      Image.asset(
                        "images/banner2.webp",
                        fit: BoxFit.cover,
                      ),
                      Image.asset(
                        "images/banner3.jpg",
                        fit: BoxFit.cover,
                      ),
                    ],
                  ),
                ),
              ),
              Positioned.fill(
                bottom: 1,
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(
                      4,
                      (index) => AnimatedContainer(
                        duration: const Duration(microseconds: 300),
                        width: _currentSlide == index ? 20 : 15,
                        height: 8,
                        margin: const EdgeInsets.only(right: 5),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: _currentSlide == index
                                ? Colors.white
                                : Colors.transparent,
                            border: Border.all(color: Colors.white)),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 40,
              ),
            ]),
          ),
          const Padding(
            padding: EdgeInsets.only(right: 320),
            child: Text(
              "Category",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          const CategorySlider(),
          SizedBox(
            height: 30,
          ),
          Padding(
              padding: EdgeInsets.only(right: 300),
              child: Text(
                "Top Seller",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
              )),
          Container(
            width: MediaQuery.of(context).size.width,
            height: 300,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListView(
                children: [
                  Row(
                    children: [
                      Card(
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(12),
                          child: Image.asset("images/whisky/bluelabel.jpg",
                          height: MediaQuery.of(context).size.width * 0.3,
                          width: MediaQuery.of(context).size.width * 0.3,
                          fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      
                      Card(
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(12),
                          child: Image.asset("images/beer/korona.webp",
                          height: MediaQuery.of(context).size.width * 0.3,
                          width: MediaQuery.of(context).size.width * 0.3,
                          fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Card(
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(12),
                          child: Image.asset("images/wine/betsellerwine.webp",
                          height: MediaQuery.of(context).size.width * 0.3,
                          width: MediaQuery.of(context).size.width * 0.3,
                          fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ],
                  ),
                  
                   Row(
                    children: [
                      Card(
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(12),
                          child: Image.asset("images/whisky/doubleblk.webp",
                          height: MediaQuery.of(context).size.width * 0.3,
                          width: MediaQuery.of(context).size.width * 0.3,
                          fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Card(
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(12),
                          child: Image.asset("images/whisky/jackdaniel.jpg",
                          height: MediaQuery.of(context).size.width * 0.3,
                          width: MediaQuery.of(context).size.width * 0.3,
                          fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Card(
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(12),
                          child: Image.asset("images/beer/tiger.jpg",
                          height: MediaQuery.of(context).size.width * 0.3,
                          width: MediaQuery.of(context).size.width * 0.3,
                          fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ],
                  ),

                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
