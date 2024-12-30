
import 'package:floor/floor.dart';
import 'package:note_app/database/note_dao.dart';
import 'package:note_app/database/note_tbl.dart';
import 'package:sqflite/sqflite.dart' as sqflite;
import 'dart:async';
part 'note_database.g.dart';

@Database(version: 1, entities:[Note])
abstract class NoteDatabase extends FloorDatabase{
  NoteDao get noteDao;
  

}