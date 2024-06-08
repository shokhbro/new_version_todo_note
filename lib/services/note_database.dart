import 'package:todo_note_project/models/note.dart';
import 'package:todo_note_project/services/local_database.dart';

class NoteDatabase {
  final _localDatabase = LocalDatabase();
  final _tableName = "notes";

  Future<List<Note>> getNotes() async {
    final db = await _localDatabase.database;
    final rows = await db.query(_tableName);
    List<Note> notes = [];

    for (var row in rows) {
      notes.add(Note.fromJson(row));
    }
    return notes;
  }

  Future<void> addNotes(Map<String, dynamic> notesDate) async {
    final db = await _localDatabase.database;
    await db.insert(_tableName, notesDate);
  }
}
