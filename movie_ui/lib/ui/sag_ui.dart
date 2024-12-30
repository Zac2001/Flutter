import 'package:flutter/material.dart';
import 'package:movie_ui/data/data.dart';
import 'package:movie_ui/ui/widget.dart';

class Sagg extends StatefulWidget {
  const Sagg({super.key});

  @override
  State<Sagg> createState() => _SaggState();
}

class _SaggState extends State<Sagg> {

   late final PageController _controller;
  int currentIndex = 1;
 @override
  void initState() {
    
    super.initState();
    _controller = PageController(
      viewportFraction: 0.6,
      initialPage: currentIndex,
    );

    
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
         const TitleWidget(title: "May you like"),
           SizedBox(height: 150,
           
           child: PageView.builder(
            onPageChanged: (value) {
              setState(() {
                currentIndex = value;
              });
            },
            controller: _controller ,
           itemCount: sag.length,
          itemBuilder: (context, index) =>Container( 
            width: 300,      
            padding: const EdgeInsets.all(10),
            margin: const EdgeInsets.only(right: 20),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              
              color: Colors.indigoAccent,
                image: DecorationImage(image: AssetImage(sag[index].imgUrl
                ),
                fit: BoxFit.cover
                )
              ),
            
          )),),
          const SizedBox(height: 10,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            
            children: List.generate(sag.length, (generator) =>
           Padding(
             padding: const EdgeInsets.all(6.0),
             child:  CircleAvatar(
              radius: 6,
              backgroundColor: generator == currentIndex ? Colors.red : Colors.white,
              
             
             ),
           ),
           
            ),
          )
      ],
    );
  }
}