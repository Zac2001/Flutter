import 'package:flutter/material.dart';
import 'package:student_supabase/student/resporsity.dart';
import 'package:student_supabase/student/student_model.dart';
import 'package:student_supabase/student/student_screen.dart';

class DetailScreen extends StatefulWidget {
   DetailScreen({super.key,required this.id});
   final int id;

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  final StudentREspository _rEspository = StudentREspository();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Detail Screen"),
      ),
      body: FutureBuilder(
        future: _rEspository.getDetail(widget.id ),
        builder: (context, snapshot) {
          if(snapshot.hasData) {
            Student student = snapshot.data;
           return (student == null) ? const Center(child:Text("Student not found") ,)
            : Column(
                children: [
                  ListTile(
                    title: Text('Name :'),
                    trailing: Text(student.name),
                  ),
                  ListTile(
                    title: Text('Age :'),
                    trailing: Text(student.age.toString()),
                  ),
                  ListTile(
                    title: Text('address') ,
                    trailing: Text(student.address),
                  ),
                  IconButton(onPressed: (){
                      _rEspository.deleteStudent(widget.id);
                      
                      setState(() {
                        Navigator.pop(context);
                      });
                  }, icon: Icon(Icons.delete))
                ],
            );
          }else if(snapshot.hasError) {
              Text(snapshot.error.toString());
          }
           return const  Center(child: const CircularProgressIndicator(),);
          
        },
      ),
    );
  }
}