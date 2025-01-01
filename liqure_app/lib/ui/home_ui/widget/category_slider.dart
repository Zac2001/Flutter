import 'package:flutter/material.dart';

class CategorySlider extends StatelessWidget {
  const CategorySlider({super.key});

  @override
  Widget build(BuildContext context) {
    return  SizedBox(
            width: MediaQuery.of(context).size.width * 0.95,
            height: 100,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: const [
                 CircleAvatar(
                  backgroundImage: AssetImage("images/icons/beericon1.jpg"),
                  radius: 50,
                  
                ),
                SizedBox(
                  width: 20,
                ),
                CircleAvatar(
                  backgroundImage: AssetImage("images/icons/whiskeyicon.jpg"),
                  radius: 50,
                  
                ),
                SizedBox(
                  width: 10,
                ),
                CircleAvatar(
                  radius: 60,
                  backgroundImage: AssetImage("images/icons/wineicon.webp"),
                ),
                SizedBox(
                  width: 8,
                ),
                CircleAvatar(
                  radius: 60,
                  backgroundImage: AssetImage("images/wine/sixseeds.jpg"),
                )
              ],
            ),
          );
  }
}