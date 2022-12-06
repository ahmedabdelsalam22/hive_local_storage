import 'package:flutter/material.dart';
import 'package:todo_hive/widgets/custom_appbar.dart';

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
        ],
      ),
    );
  }
}
