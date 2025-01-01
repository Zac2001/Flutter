import 'package:flutter/material.dart';
import 'package:student_supabase/student/student_screen.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Supabase.initialize(
    url: 'https://xhnfathggvncaxrttrii.supabase.co' ,
    anonKey: 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InhobmZhdGhnZ3ZuY2F4cnR0cmlpIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MzQzMzQ4NTYsImV4cCI6MjA0OTkxMDg1Nn0.3B9VHkKb_QGpiFXHc3aV7mUsUkhrlN3HyEnuK4Ty6wE');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.purple
      ),
      debugShowCheckedModeBanner: false,
      home: const StudentScreen(),
    );
  }
}