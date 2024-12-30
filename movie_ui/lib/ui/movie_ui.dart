import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:movie_ui/auth/login_form.dart';
import 'package:movie_ui/data/data.dart';
import 'package:movie_ui/ui/new_movie.dart';
import 'package:movie_ui/ui/sag_ui.dart';

import 'package:movie_ui/ui/tranding.dart';


class MovieScreen extends StatefulWidget {
   MovieScreen({super.key});

 static const  blackColor = Color(0xff202124);

  @override
  State<MovieScreen> createState() => _MovieScreenState();
}

class _MovieScreenState extends State<MovieScreen> {

   
 int currentIndex = 0;

  @override
  Widget build(BuildContext context) {

    
    

    return Scaffold(
      drawer:  Drawer(
        width: 250,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const DrawerHeader(
              child: Column(
                children: [
                  CircleAvatar(
                    radius: 40,
                    child: Icon(Icons.person,size: 40,),
                  ),
                  SizedBox(height: 15,),
                  Text("Mg Mg")
                ],
              )),
            const ListTile(
              leading: Icon(Icons.home),
              title: Text("Home",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w500),),
              titleAlignment: ListTileTitleAlignment.center,
            ),
            const ListTile(
              leading: Icon(Icons.notifications),
              title: Text("Notifications",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w500),),  
            ),
            const ListTile(
              leading: Icon(Icons.favorite),
              title: Text("Whistlist",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w500),),
            ),
            const ListTile(
              leading: Icon(Icons.movie_filter),
              title: Text("Series",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w500),),
            ),
            const ListTile(
              leading: Icon(Icons.movie),
              title: Text("Movies",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w500),),
            ),
            const ListTile(
              leading: Icon(Icons.settings),
              title: Text("Settings",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w500),),
            ),
            Container(
             margin: const EdgeInsets.only(top: 50),
              width: 150,
              child: FilledButton(onPressed: () async{
                  await GoogleSignIn().signOut();
                  FirebaseAuth.instance.signOut();
                  Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (_)=>LoginForm()));
              }, child: const Text("Log out")),
            )
           
          ],
        ) ,
        
      ),
      backgroundColor: MovieScreen.blackColor ,
      
      appBar: AppBar(
        title:  const Text("Pocket TV",style: TextStyle(fontSize: 16),),
        centerTitle: true,
        backgroundColor: MovieScreen.blackColor,
        foregroundColor: Colors.white,
        actions: [
          IconButton(onPressed: (){
             
          }, icon: const Icon(Icons.search))
        ],
      ),
      body:  SingleChildScrollView(
        child:  Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const TrandingWG(),
            NewMovie(title: "New Movie",movies: movies,),
            const Sagg(),
            NewMovie(title: "Tv Series", movies: tvs)
            
          ],
        ),
      ),

      
    );
  }
}

