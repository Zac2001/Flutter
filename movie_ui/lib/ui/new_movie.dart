import 'package:flutter/material.dart';
import 'package:movie_ui/data/data.dart';
import 'package:movie_ui/data/movie.dart';
import 'package:movie_ui/ui/widget.dart';

class NewMovie extends StatefulWidget {
  const NewMovie({super.key,required this.title,required this.movies});

  final String title;
  final List<Movie> movies;

  @override
  State<NewMovie> createState() => _NewMovieState();
}

class _NewMovieState extends State<NewMovie> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      
      children: [
         TitleWidget(title: widget.title),
        SizedBox(
          height: 160,
          
          child: ListView.builder(
            
            scrollDirection: Axis.horizontal,
            itemCount:widget.movies.length,
            itemBuilder: (context, index) {
              
              return Column(
                children: [
                  Container(
                    
                    margin: EdgeInsets.all(8.0),
                    padding: EdgeInsets.all(8.0),
                    width: 100,
                    height: 120,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(6),
                        color: Colors.amberAccent,
                        image: DecorationImage(image: AssetImage(widget.movies[index].imgUrl)
                        ,fit: BoxFit.cover)
                      ),
                  ),
                  SizedBox(
                    width: 100,
                    
                    child: Center(
                      child: Text(widget.movies[index].name ,
                      maxLines: 1,
                      
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                        fontWeight: FontWeight.normal,
                        
                      ),),
                    ),
                  ),
                  
                ],
                
              );
            },),
        )
      ],
    );
  }
}