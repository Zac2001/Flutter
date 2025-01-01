import 'package:flutter/material.dart';
import 'package:student_supabase/student/resporsity.dart';
import 'package:student_supabase/student/student_model.dart';

class AddScreen extends StatefulWidget {
   AddScreen({super.key});

  @override
  State<AddScreen> createState() => _AddScreenState();
}

class _AddScreenState extends State<AddScreen> {
  final TextEditingController _nameController = TextEditingController();

  final TextEditingController _ageController = TextEditingController();

  final TextEditingController _addressController = TextEditingController();

  final StudentREspository _respository = StudentREspository();

  bool isLoading = false;
  String _status = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add Screen"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _nameController,
              decoration: const InputDecoration(
                hintText: "Name",
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 15,),
            TextField(
              controller: _ageController,
              keyboardType: TextInputType.number,
              decoration: const  InputDecoration(
                hintText: "Age",
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 15,),
            TextField(
              controller: _addressController,
              decoration: const InputDecoration(
                hintText: "Address",
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height:15,),
            ElevatedButton(onPressed: (){
                
               String name = _nameController.text.trim();
                String age = _ageController.text.trim();
                String address = _addressController.text.trim();
                if(name.isNotEmpty && age.isNotEmpty && address.isNotEmpty){
                    int age1 = int.parse(age);
                    setState(() {
                      isLoading = true;
                      _status = 'uploading';
                    });
                    Student student = Student(name,age1,address);
                    _respository.addStudent(student).then((value){
                        _status = 'success';
                    }).catchError((e){
                      _status = 'failed';
                    }).whenComplete((){
                      setState(() {
                        isLoading = false;
                      });
                    });
                }else{
                  ScaffoldMessenger.of(context)
                  .showSnackBar(const SnackBar(content:  Text("plz enter completely")));
                }
                
            }, child: const Text("Add")),
            Divider(),
            if(isLoading)
            CircularProgressIndicator()
          ],
        ),
      ),
    );
  }
}