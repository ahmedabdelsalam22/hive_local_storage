import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:todo_hive/controller/get_note_cubit/note_cubit.dart';
import 'package:todo_hive/models/note_model.dart';
import 'package:todo_hive/view/edit_note_view.dart';

class NoteItem extends StatelessWidget {
  const NoteItem({Key? key, required this.noteModel}) : super(key: key);

  final NoteModel noteModel;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => EditNoteView(
              noteModel: noteModel,
            ),
          ),
        );
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
        child: Container(
          decoration: BoxDecoration(
            color: Color(noteModel.color),
            borderRadius: BorderRadius.circular(16),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                ListTile(
                  textColor: Colors.black,
                  title: Text(
                    noteModel.title,
                    style: const TextStyle(fontSize: 23),
                  ),
                  subtitle: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      noteModel.subTitle,
                      style: TextStyle(color: Colors.black.withOpacity(.4)),
                    ),
                  ),
                  trailing: IconButton(
                    icon: const Icon(FontAwesomeIcons.trash),
                    color: Colors.black,
                    onPressed: () {
                      /// delete note with hive
                      noteModel.delete();
                      BlocProvider.of<NoteCubit>(context).fetchAllNotes();
                    },
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      noteModel.date,
                      style: TextStyle(color: Colors.black.withOpacity(.4)),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
