import 'package:flutter/material.dart';
import 'package:movie_ui/data/data.dart';
import 'package:movie_ui/ui/widget.dart';

class TrandingWG extends StatefulWidget {
  const TrandingWG({super.key});

  @override
  State<TrandingWG> createState() => _TrandingWGState();

  
}



class _TrandingWGState extends State<TrandingWG> {

  late final PageController _controller;
  int currentIndex = 2;
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
         TitleWidget(title: "Tranding"),
           SizedBox(height: 250,
           child: PageView.builder(
            onPageChanged: (value) {
              setState(() {
                currentIndex = value;
              });
            },
            controller: _controller ,
           itemCount: trandings.length,
          itemBuilder: (context, index) =>Container(       
            padding: EdgeInsets.all(10),
            margin: EdgeInsets.only(right: 20),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.indigoAccent,
                image: DecorationImage(image: AssetImage(trandings[index].imgUrl
                ),
                fit: BoxFit.cover
                )
              ),
            
          )),),
          const SizedBox(height: 10,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            
            children: List.generate(trandings.length, (generator) =>
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