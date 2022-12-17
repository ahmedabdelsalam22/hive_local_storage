import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_hive/cubit/notes_cubit.dart';
import 'package:todo_hive/models/note_model.dart';

import 'custom_button.dart';
import 'custom_text_field.dart';

class AddNoteBottomSheet extends StatelessWidget {
  const AddNoteBottomSheet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AddNoteCubit(),
      child: BlocConsumer<AddNoteCubit, AddNoteState>(
        listener: (context, state) {
          if (state is AddNoteError) debugPrint("failed${state.msg}");
          if (state is AddNoteSuccess) Navigator.pop(context);
        },
        builder: (context, state) {
          return AbsorbPointer(
            // make screen disabled when is loading ..
            absorbing: state is AddNoteLoading ? true : false,
            child: const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: AddNoteForm(),
            ),
          );
        },
      ),
    );
  }
}

class AddNoteForm extends StatefulWidget {
  const AddNoteForm({Key? key}) : super(key: key);

  @override
  State<AddNoteForm> createState() => _AddNoteFormState();
}

class _AddNoteFormState extends State<AddNoteForm> {
  var formKey = GlobalKey<FormState>();

  AutovalidateMode autoValidateMode = AutovalidateMode.disabled;

  String? title, subTitle;

  @override
  Widget build(BuildContext context) {
    var cubit = BlocProvider.of<AddNoteCubit>(context);

    return Form(
      key: formKey,
      autovalidateMode: autoValidateMode,
      child: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 35),
            CustomTextField(
              hint: 'Title',
              onSave: (value) {
                title = value;
              },
            ),
            const SizedBox(height: 15),
            CustomTextField(
              hint: 'Content',
              maxLine: 5,
              onSave: (value) {
                subTitle = value;
              },
            ),
            const SizedBox(
              height: 32,
            ),
            BlocBuilder<AddNoteCubit, AddNoteState>(
              builder: (context, state) {
                return CustomButton(
                  isLoading: state is AddNoteLoading ? true : false,
                  onTap: () {
                    if (formKey.currentState!.validate()) {
                      formKey.currentState!.save();
                      var noteModel = NoteModel(
                        title: title!,
                        subTitle: subTitle!,
                        date: DateTime.now().toString(),
                        color: const Color(0xffFFCC80).value,
                      );
                      cubit.addNote(noteModel);
                    } else {
                      autoValidateMode = AutovalidateMode.always;
                      setState(() {});
                    }
                  },
                );
              },
            ),
            const SizedBox(
              height: 16,
            ),
          ],
        ),
      ),
    );
  }
}
