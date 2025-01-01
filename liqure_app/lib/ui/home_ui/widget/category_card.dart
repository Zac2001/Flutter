import 'package:flutter/material.dart';
import 'package:liqure_app/data/bottle.dart';

class CategoryCard extends StatelessWidget {
  CategoryCard({super.key, required this.bottle});

  final Color _backgroundColor = const Color(0xff4a4e69);

  final List<Bottle> bottle;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height / 2.3,
      child: ListView.builder(
          itemCount: bottle.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.all(9),
              child: Container(
                
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height / 8,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                          offset: Offset(1, 1),
                          blurRadius: 1,
                          color: Colors.black26,
                          blurStyle: BlurStyle.outer),
                      BoxShadow(
                          offset: Offset(-1, -1),
                          blurRadius: 1,
                          color: Colors.black26,
                          blurStyle: BlurStyle.outer)
                    ]),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Image.asset(
                      bottle[index].imgUrl,
                      height: 80,
                      width: 90,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(
                          bottle[index].name,
                          style: TextStyle(
                              fontWeight: FontWeight.w500, fontSize: 23),
                        ),
                        Text(
                          "\$${bottle[index].price}",
                          style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 25,
                              color: Colors.red),
                        )
                      ],
                    ),
                    const SizedBox(
                      width: 170,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: _backgroundColor,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      height: 40,
                      alignment: Alignment.centerRight,
                      child: TextButton(
                          onPressed: () {},
                          child: Text(
                            "Add",
                            style: TextStyle(color: Colors.white, fontSize: 20),
                          )),
                    ),
                  ],
                ),
              ),
            );
          }),
    );
  }
}
