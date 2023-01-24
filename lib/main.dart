import 'package:flutter/material.dart';
import 'package:notes_app/providers/notes_provider.dart';
import 'package:notes_app/screens/recent/recent_note_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(ChangeNotifierProvider(
    create: (BuildContext context) => NotesProvider(),
    child: MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: const Color.fromRGBO(248, 238, 226, 1),
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.transparent,
          titleTextStyle: TextStyle(
            fontFamily: 'Nunito',
            fontSize: 14,
            color: Colors.black,
            fontWeight: FontWeight.w900,
          ),
          centerTitle: true,
          elevation: 0,
        ),
      ),
      home: const RecentNoteScreen(),
    ),
  ));
}
