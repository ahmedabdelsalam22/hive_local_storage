part of 'note_cubit.dart';

abstract class NoteState {}

class NoteInitial extends NoteState {}

class NoteLoading extends NoteState {}

class NoteSuccess extends NoteState {
  final List<NoteModel> notes;

  NoteSuccess(this.notes);
}

class NoteError extends NoteState {
  final String msg;

  NoteError(this.msg);
}
