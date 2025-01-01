import 'package:flutter/material.dart';
import 'package:student_supabase/student/add_screen.dart';
import 'package:student_supabase/student/detail_screen.dart';
import 'package:student_supabase/student/resporsity.dart';
import 'package:student_supabase/student/student_model.dart';

class StudentScreen extends StatefulWidget {
  const StudentScreen({super.key});

  @override
  State<StudentScreen> createState() => _StudentScreenState();
}

class _StudentScreenState extends State<StudentScreen> {

  final StudentREspository _respository = StudentREspository();
  int? id;
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        title: const Text("Supabase Lesson"),
        actions: [
          IconButton(onPressed: (){
            Navigator.of(context).push(MaterialPageRoute(builder: (_) => AddScreen()));
          }, icon: const  Icon(Icons.add))
        ],
      ),
      body: StreamBuilder<List<Student>>(
        stream: _respository.getAllStudent(), 
        builder: (context, snapshot) {
          if(snapshot.hasData){
            List<Student> students = snapshot.data ?? [];
            return ListView.builder(
              itemCount: students.length,
              itemBuilder: (context, index) {
                Student student = students[index];
                return InkWell(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(builder: (_)=> DetailScreen(id: student.id ?? 0)));
                  },
                  child: Card(
                    child: Column(
                      children: [
                        Text('id : ${student.id}'),
                        Text('Name : ${student.name}'),
                        Text('Age : ${student.age}'),
                        Text('Address : ${student.address}'),
                        
                      ],
                    ),
                  ),
                );
              },);
          }
          else if(snapshot.hasError){
              return Text(snapshot.error.toString());
          }
          else{
            return const Center(child: CircularProgressIndicator(),);
          }
        },),
    );
  }
}