import 'package:flutter/material.dart';
import 'package:todo_hive/models/note_model.dart';

import '../widgets/custom_appbar.dart';
import '../widgets/custom_text_field.dart';

class EditNoteView extends StatelessWidget {
  const EditNoteView({Key? key, required this.noteModel}) : super(key: key);
  final NoteModel noteModel;

  @override
  Widget build(BuildContext context) {
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
            onPressedIcon: () {},
          ),
          const SizedBox(
            height: 50,
          ),
          CustomTextField(
            hint: noteModel.title,
          ),
          const SizedBox(
            height: 15,
          ),
          CustomTextField(
            hint: noteModel.subTitle,
            maxLine: 5,
          ),
        ],
      ),
    ));
  }
}
