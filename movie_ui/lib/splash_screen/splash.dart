import 'package:flutter/material.dart';
import 'package:movie_ui/ui/movie_ui.dart';

class MySplash extends StatefulWidget {
  const MySplash({super.key});

  @override
  State<MySplash> createState() => _MySplashState();
}

class _MySplashState extends State<MySplash> {

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 2),(){
      if(mounted){
        Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (_)=>MovieScreen()));
      }
    }
    );

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      
      body: Center(
        
        child: Column(
          
          mainAxisAlignment: MainAxisAlignment.center,
          
          children: [
            
            Image.asset("images/movieicon.jpg"),
           
            const Text("Movie",
            style: TextStyle(fontSize: 20),),

          ],
    ),
    
    ),
    
    );
  }
}