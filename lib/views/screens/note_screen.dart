import 'package:flutter/material.dart';
import 'package:todo_note_project/controllers/note_controller.dart';
import 'package:todo_note_project/views/widgets/add_edit_note_widget.dart';
import 'package:intl/intl.dart';

class NoteScreen extends StatefulWidget {
  final NoteController noteController;

  const NoteScreen({required this.noteController, Key? key}) : super(key: key);

  @override
  State<NoteScreen> createState() => _NoteScreenState();
}

class _NoteScreenState extends State<NoteScreen> {
  void _editNote(int index) async {
    final initialTitle = widget.noteController.notes[index].title;
    final initialContent = widget.noteController.notes[index].content;

    final result = await showDialog<Map<String, String>>(
      context: context,
      builder: (context) {
        return NoteAddEditDialog(
          initialTitle: initialTitle,
          initialContent: initialContent,
          isEditing: true,
        );
      },
    );

    if (result != null) {
      setState(() {
        widget.noteController.editNote(
          index,
          result['title']!,
          result['content']!,
        );
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: widget.noteController.notes.length,
      itemBuilder: (context, index) {
        final note = widget.noteController.notes[index];
        final dateFormat = DateFormat('yyyy-MM-dd HH:mm');
        return Card(
          margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
          child: ListTile(
            title: Text(note.title),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(note.content),
                const SizedBox(height: 5),
                Text(
                  dateFormat.format(note.createDate),
                  style: const TextStyle(fontSize: 12, color: Colors.grey),
                ),
              ],
            ),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                  icon: const Icon(Icons.edit),
                  onPressed: () => _editNote(index),
                ),
                IconButton(
                  icon: const Icon(
                    Icons.delete,
                    color: Colors.red,
                  ),
                  onPressed: () {
                    setState(() {
                      widget.noteController.removeNote(index);
                    });
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
