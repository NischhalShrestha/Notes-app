import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:notes_app/models/note_model.dart';
import 'package:notes_app/screens/edit/edit_note_screen.dart';

class NotesProvider extends ChangeNotifier {
  final List<NoteModel> _noteModels = [];

  UnmodifiableListView<NoteModel> get notes {
    return UnmodifiableListView(_noteModels);
  }

  bool get noteCount {
    return _noteModels.isEmpty;
  }

  bool get noteEmpty {
    return _noteModels.isNotEmpty;
  }

  int get noteLength {
    return _noteModels.length;
  }

  getNoteindex(int noteIndex) {
    return _noteModels[noteIndex];
  }

  addNote(String notes, String description, int id) {
    final note = NoteModel(title: notes, description: description, id: id);
    _noteModels.add(note);
    notifyListeners();
  }

  editNote(NoteModel note) {
    final noteIndex = _noteModels.indexWhere((element) => element.id == note.id);
    _noteModels[noteIndex] = note;
    notifyListeners();
  }
}
