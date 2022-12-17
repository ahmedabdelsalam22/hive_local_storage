import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_hive/controller/get_note_cubit/note_cubit.dart';

import 'note_item.dart';

class NotesListView extends StatelessWidget {
  const NotesListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NoteCubit, NoteState>(
      builder: (context, state) {
        var cubit = BlocProvider.of<NoteCubit>(context);

        return Expanded(
          child: ListView.builder(
            physics: const BouncingScrollPhysics(),
            itemBuilder: (context, index) {
              return const NoteItem();
            },
            itemCount: cubit.notes!.length ?? 0,
          ),
        );
      },
    );
  }
}
