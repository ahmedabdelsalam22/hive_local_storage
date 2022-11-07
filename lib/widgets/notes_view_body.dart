import 'package:flutter/material.dart';

import 'custom_appbar.dart';
import 'notes_list_view.dart';

class NotesViewBody extends StatelessWidget {
  const NotesViewBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: const [
          CustomAppBar(),
          SizedBox(height: 30),
          NotesListView(),
        ],
      ),
    );
  }
}
