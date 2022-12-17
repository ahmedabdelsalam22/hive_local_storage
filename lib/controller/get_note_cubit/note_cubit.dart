import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';

import '../../models/note_model.dart';
import '../../shared/constance.dart';

part 'note_state.dart';

class NoteCubit extends Cubit<NoteState> {
  NoteCubit() : super(NoteInitial());

  static NoteCubit get(context) => BlocProvider.of(context);

  fetchAllNotes() {
    var notesBox = Hive.box<NoteModel>(AppConsts.kNotesBox);

    List<NoteModel> notes = notesBox.values.toList();
    emit(NoteSuccess(notes));
  }
}
