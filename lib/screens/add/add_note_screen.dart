import 'package:flutter/material.dart';
import 'package:notes_app/providers/notes_provider.dart';
import 'package:provider/provider.dart';

class AddNote extends StatefulWidget {
  const AddNote({super.key});

  @override
  State<AddNote> createState() => _AddNoteState();
}

class _AddNoteState extends State<AddNote> {
  final _topicController = TextEditingController();
  final _descriptionController = TextEditingController();

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
        leading: GestureDetector(
          child: const Padding(
            padding: EdgeInsets.all(10.0),
            child: Icon(
              Icons.arrow_back_ios_new_outlined,
              color: Colors.black,
            ),
          ),
        ),
        leadingWidth: 20,
        title: const Text(
          'Create a Note',
          style: TextStyle(
              fontWeight: FontWeight.w900, fontSize: 14, color: Colors.black),
        ),
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
              decoration: const InputDecoration(
                  hintText: 'Title', border: InputBorder.none),
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
                  Navigator.pop(
                    context,
                    Provider.of<NotesProvider>(context, listen: false).addNote(
                        _topicController.text,
                        _descriptionController.text,
                        DateTime.now().microsecond),
                  );
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
                  'Save Note',
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
