import 'package:flutter/material.dart';
import 'package:notes_app/models/note_model.dart';
import 'package:provider/provider.dart';
import 'package:notes_app/providers/notes_provider.dart';

class EditNote extends StatefulWidget {
  final NoteModel note;
  const EditNote({super.key, required this.note});

  @override
  State<EditNote> createState() => _EditNoteState();
}

class _EditNoteState extends State<EditNote> {
  late final TextEditingController _topicController;
  late final TextEditingController _descriptionController;

  @override
  void initState() {
    super.initState();
    _topicController = TextEditingController(text: widget.note.title);
    _descriptionController =
        TextEditingController(text: widget.note.description);
  }

  @override
  void dispose() {
    _topicController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: const Color.fromRGBO(248, 238, 226, 1),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: const Color.fromRGBO(248, 238, 226, 1),
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios_new,
            color: Colors.black,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        leadingWidth: 20,
        title: const Text(
          'Edit Note',
          style: TextStyle(
              fontWeight: FontWeight.w900, fontSize: 14, color: Colors.black),
        ),
        centerTitle: true,
        actions: const [
          Icon(
            Icons.more_vert,
            color: Colors.black,
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: SafeArea(
            child: Column(
          children: [
            TextFormField(
              controller: _topicController,
              decoration:
                  const InputDecoration(hintText: 'Title', border: InputBorder.none),
            ),
            TextFormField(
              controller: _descriptionController,
              minLines: 1,
              maxLines: 10,
              keyboardType: TextInputType.multiline,
              decoration: const InputDecoration(
                  hintText: 'Your Note Here', border: InputBorder.none),
            ),
            const Spacer(),
            GestureDetector(
              onTap: () {
                if (_topicController.text.isEmpty &
                    _descriptionController.text.isEmpty) {
                  Navigator.pop(context);
                } else {
                  final editedNote = NoteModel(title: _topicController.text, description: _descriptionController.text, id: widget.note.id);
                  Provider.of<NotesProvider>(context, listen: false).editNote(editedNote);
                  Navigator.pop(context);
                }
              },
              child: Container(
                margin: const EdgeInsets.only(bottom: 80, top: 20),
                padding: const EdgeInsets.all(24),
                height: 74,
                width: 319,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: const Color.fromRGBO(217, 97, 76, 1)),
                child: const Text(
                  'Edit Note',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontWeight: FontWeight.w900,
                      fontSize: 20,
                      color: Colors.white),
                ),
              ),
            )
          ],
        )),
      ),
    );
  }
}
