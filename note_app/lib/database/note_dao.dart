
import 'package:floor/floor.dart';
import 'package:note_app/database/note_tbl.dart';

@dao
abstract class NoteDao {

    
    @Query("select * from note")
    Stream<List<Note>> getAllNotes();

    @insert
    Future<void> addNote(Note note);

    @delete
    Future<void> deleteNote(Note note);

    @update
    Future<void> updateNote(Note note);

    @delete
    Future<void> deleteAll(List<Note> note);

    
}