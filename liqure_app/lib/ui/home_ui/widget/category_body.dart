import 'package:flutter/material.dart';

class CategoryBody extends StatelessWidget {
  const CategoryBody({super.key,
  required this.bigItemName,
  required this.smallItemName,
  required this.bottleIcon
  });

  final String bigItemName;
  final String smallItemName;
  final String bottleIcon;
  final Color _backgroundColor = const Color(0xff4a4e69);
  @override
  Widget build(BuildContext context) {
    return  Container(
        color: _backgroundColor,
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height / 2.5,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Text(
                bigItemName,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 50,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Text(
                "The Most Popular $smallItemName",
                style: TextStyle(fontSize: 20, color: Colors.white),
              ),
            ),
            Padding(
              padding:  EdgeInsets.only(left: 10),
              child: Text(
                "in Burma",
                style: TextStyle(fontSize: 20, color: Colors.white),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Image.asset(
                  bottleIcon,
                  width: 200,
                  height: 250,
                )
              ],
            ),
          ],
        ),
      );
  }
}