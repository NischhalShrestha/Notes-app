import 'package:flutter/material.dart';
import 'package:notes_app/screens/edit/edit_note_screen.dart';
import 'package:notes_app/models/note_model.dart';
import 'package:notes_app/providers/notes_provider.dart';
import 'package:provider/provider.dart';

typedef NoteCallback = void Function(NoteModel);

class NoteWidget extends StatelessWidget {
  final NoteModel note;
  const NoteWidget({
    Key? key,
    required this.note,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
          MaterialPageRoute(
            builder: ((context) {
              return EditNote(
                note: note,
              );
            }),
        );
      },
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12), color: Colors.white),
        child: Column(children: [
          Text(
            note.title,
            style: const TextStyle(
                color: Colors.black, fontSize: 16, fontWeight: FontWeight.w900),
          ),
          Text(
            note.description,
            style: const TextStyle(
                color: Colors.black, fontSize: 14, fontWeight: FontWeight.w700),
          )
        ]),
      ),
    );
  }
}
