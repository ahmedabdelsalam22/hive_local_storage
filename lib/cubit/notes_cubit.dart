import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:todo_hive/models/note_model.dart';
import 'package:todo_hive/shared/constance.dart';

part 'notes_state.dart';

class AddNoteCubit extends Cubit<AddNoteState> {
  AddNoteCubit() : super(AddNoteInitial());

  static AddNoteCubit get(context) => BlocProvider.of(context);

  addNote(NoteModel noteModel) async {
    try {
      var notesBox = Hive.box(AppConsts.kNotesBox);
      await notesBox.add(noteModel);
      emit(AddNoteSuccess());
    } catch (e) {
      emit(AddNoteError(e.toString()));
    }
  }
}
