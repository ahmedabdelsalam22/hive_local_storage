import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_hive/controller/get_note_cubit/note_cubit.dart';
import 'package:todo_hive/models/note_model.dart';

import '../widgets/custom_appbar.dart';
import '../widgets/custom_text_field.dart';

class EditNoteView extends StatefulWidget {
  const EditNoteView({Key? key, required this.noteModel}) : super(key: key);
  final NoteModel noteModel;

  @override
  State<EditNoteView> createState() => _EditNoteViewState();
}

class _EditNoteViewState extends State<EditNoteView> {
  String? title, content;

  @override
  Widget build(BuildContext context) {
    var cubit = BlocProvider.of<NoteCubit>(context);

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          children: [
            const SizedBox(
              height: 50,
            ),
            CustomAppBar(
              title: 'Edit',
              icon: Icons.check,
              onPressedIcon: () {
                widget.noteModel.title = title ?? widget.noteModel.title;

                widget.noteModel.subTitle =
                    content ?? widget.noteModel.subTitle;

                widget.noteModel.save();

                cubit.fetchAllNotes();
                Navigator.pop(context);
              },
            ),
            const SizedBox(
              height: 50,
            ),
            CustomTextField(
              hint: widget.noteModel.title,
              onChange: (value) {
                title = value;
              },
            ),
            const SizedBox(
              height: 15,
            ),
            CustomTextField(
              hint: widget.noteModel.subTitle,
              maxLine: 5,
              onChange: (value) {
                content = value;
              },
            ),
          ],
        ),
      ),
    );
  }
}
