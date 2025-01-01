

import 'package:student_supabase/student/student_model.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class StudentREspository{
  final SupabaseClient _client = Supabase.instance.client;
  Stream<List<Student>> getAllStudent(){
   final student = _client.from('student')
          .stream(primaryKey: ['id'])
          .map((convert){
            return convert.map((e){
              return Student.fromJson(e);
            }).toList();
          });
          return student;

  }

  Future addStudent(Student student) async{

    await _client.from('student').insert(student);
  }

  Future getDetail(int id)async{
   final student = await _client.from('student').select().eq('id', id)
   .single();
   return Student.fromJson(student);
  }

  Future deleteStudent(int id)async{
    await _client.from('student').delete().eq('id', id);
  }

  Future updateStudent(int id,Student student)async{
    await _client.from('table').update({
      'id': student.id,
      'name':student.name,
      'age':student.age,
      'address': student.address
    });
  }

}