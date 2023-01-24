import 'package:flutter/material.dart';
import 'package:notes_app/screens/add/add_note_screen.dart';
import '../../widgets/note_widget.dart';
import '../add/add_note_screen.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:notes_app/providers/notes_provider.dart';
import 'package:provider/provider.dart';

class RecentNoteScreen extends StatefulWidget {
  const RecentNoteScreen({super.key});

  @override
  State<RecentNoteScreen> createState() => _RecentNoteScreenState();
}

class _RecentNoteScreenState extends State<RecentNoteScreen> {
  @override
  Widget build(BuildContext context) {
    return 
    Provider.of<NotesProvider>(context).noteCount
        ? Scaffold(
            appBar: AppBar(
              leading: const Icon(
                Icons.menu,
                color: Colors.black,
              ),
              title: Text(Provider.of<NotesProvider>(context).noteCount
                  ? "All Notes"
                  : "Recent Notes"),
              actions: [
                Provider.of<NotesProvider>(context).noteEmpty
                    ? IconButton(
                        color: Colors.black,
                        onPressed: () {},
                        icon: const Icon(Icons.add),
                      )
                    : const Icon(
                        Icons.abc,
                        color: Colors.transparent,
                      )
              ],
            ),
            body: Center(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset('assets/Note.png'),
                    const Spacer(),
                    const Text(
                      'Create Your First Note',
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.w900),
                    ),
                    const SizedBox(
                      height: 19,
                    ),
                    const Text(
                      'Add a note about anything (your thoughts \n on climate change, or your history essay)\n and share it witht the world.',
                      textAlign: TextAlign.center,
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
                    ),
                    const Spacer(),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: ((context) {
                              return const AddNote();
                            }),
                          ),
                        );
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
                          'Create a Note',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontWeight: FontWeight.w900,
                              fontSize: 20,
                              color: Colors.white),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          )
        : Scaffold(
            body: MasonryGridView.builder(
              padding: const EdgeInsets.all(10.0),
              itemCount: Provider.of<NotesProvider>(context).noteLength,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              gridDelegate:
                  const SliverSimpleGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
              ),
              itemBuilder: (context, index) {
                return NoteWidget(
                  note: Provider.of<NotesProvider>(context).notes[index],
                );
              },
            ),
          );
  }
}
