import 'package:flutter/material.dart';
import 'package:todo_hive/widgets/custom_appbar.dart';

import 'custom_text_field.dart';

class EditNoteViewBody extends StatelessWidget {
  const EditNoteViewBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        children: [
          const SizedBox(
            height: 50,
          ),
          CustomAppBar(
            title: 'Edit',
            icon: Icons.edit,
            onPressedIcon: () {},
          ),
          const SizedBox(
            height: 50,
          ),
          const CustomTextField(
            hint: 'Title',
          ),
          const SizedBox(
            height: 15,
          ),
          const CustomTextField(
            hint: 'Content',
            maxLine: 5,
          ),
        ],
      ),
    );
  }
}
