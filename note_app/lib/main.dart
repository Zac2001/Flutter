
import 'dart:math';

import 'package:floor/floor.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:note_app/database/note_dao.dart';
import 'package:note_app/database/note_database.dart';
import 'package:note_app/database/note_tbl.dart';
import 'package:note_app/view/add_screen.dart';
import 'package:note_app/view/update_screen.dart';

void main(List<String> args) {
  runApp(const  MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      
      home: FutureBuilder<NoteDatabase>(
        future: $FloorNoteDatabase.databaseBuilder("note.db").build(),
         builder: (context, snapshot) {
           if(snapshot.hasData){
              Get.put(snapshot.data!.noteDao);
              return Home();
           }else if(snapshot.hasError){
            return Text(snapshot.error.toString());
           }else{
            return const CircularProgressIndicator();
           }
         }),
      
      
    );
  }
}

class Home extends StatelessWidget {
    NoteDao noteDao = Get.find();
   Home({
    super.key,
    
  });

  List<Note> notes = [];

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      
      appBar: AppBar(
        title: const Center(child:  Text("Note App"),
        
        
        ),
        
        
      ),
      body: noteList(),
      
      floatingActionButton: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          FloatingActionButton(
            heroTag: "add",
            onPressed: (){
             Get.to(AddScreen());
          },child: const Icon(Icons.add),
          ),
          const SizedBox(width: 10,),
          FloatingActionButton(
            heroTag: "delete",
            onPressed: (){
              noteDao.deleteAll(notes);
          },child: const Icon(Icons.delete),
          ),
        ],
      ),
      
    );
  }
  Widget noteList(){
    return StreamBuilder<List<Note>>(
      stream: noteDao.getAllNotes(),
      builder: (context, snapshot) {
        if(snapshot.hasData){
          notes =snapshot.data!;
          return ListView.builder(
            itemCount: snapshot.data!.length,
            itemBuilder: (context, index) {
              return SingleChildScrollView(
                child: Card(
                  shadowColor: Colors.black,
                  elevation: 10,
                  child: ListTile(
                    title: Text(snapshot.data![index].title),
                    subtitle: Text(snapshot.data![index].description),
                    trailing: TextButton(onPressed: (){
                          noteDao.deleteNote(snapshot.data![index]);
                    }, child: const Icon(Icons.delete)),
                    leading: TextButton(
                        
                      onPressed: (){
                          Get.to(()=> UpdateScreen(),arguments: snapshot.data![index]);
                          print(" hello ${snapshot.data![index].toString()}");
                    }, child: const Icon(Icons.edit)),
                  ),
                ),
              );
            });
        }else if(snapshot.hasError){
          return Text (snapshot.error.toString());
        }else{
          return const Text("Loading");
        }
      },
    );
  }
}