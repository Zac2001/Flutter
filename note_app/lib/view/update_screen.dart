
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:note_app/database/note_dao.dart';
import 'package:note_app/database/note_tbl.dart';

class UpdateScreen extends StatelessWidget {
   UpdateScreen({super.key});
  TextEditingController title = TextEditingController();
  TextEditingController description = TextEditingController();

  
  @override
  Widget build(BuildContext context) {
    
    final NoteDao noteDao = Get.find();
     Note note = Get.arguments;
     title.text = note.title;
    description.text = note.description;
   
    return Scaffold(
      appBar: AppBar(
        title: const Text("Update screen"),
      ),
      body: Container(
        margin: EdgeInsets.all(12),
        child: Column(
          
          children: [
            TextField(
              controller: title,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              hintText: "title",

        
            ),
            ),
            SizedBox(height: 10,),
            TextField(
              controller: description,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: "description",
              ),
            ),
            const SizedBox(height: 12,),
            ElevatedButton(onPressed: (){
             
              noteDao.updateNote(Note(title.text,description.text,id: note.id));
              Get.back();

            }, child: const Text("Save"))
          ],
        ),
      ),
    );
  }
}