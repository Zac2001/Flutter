
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:note_app/database/note_dao.dart';
import 'package:note_app/database/note_tbl.dart';

class AddScreen extends StatelessWidget {
  AddScreen({super.key});
  TextEditingController title = TextEditingController();
  TextEditingController description = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final NoteDao noteDao = Get.find();
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add screen"),

      ),
      body: Container(
        margin: const EdgeInsets.all(15),
        child: Column(
          
          children: [
            TextField(
              autofocus: true,
              controller: title,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: "Title",
              ),
            ),
            const SizedBox(height: 12,),
            TextField(
              controller: description,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: "Description",
              ),

            ),
            const SizedBox(height: 12,),
            ElevatedButton(onPressed: (){
                noteDao.addNote(Note(title.text, description.text));
                Get.back();
            }, child: const Text("Add")),
          ],
        ),
      ),
    );
  }
}