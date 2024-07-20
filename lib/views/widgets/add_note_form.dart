import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';


import '../../cubits/add_note_cubit/add_note_cubit.dart';
import '../../cubits/add_note_cubit/add_note_state.dart';
import '../../models/note_model.dart';
import '../constants/constants.dart';
import 'color_list.dart';
import 'custom_button.dart';
import 'custom_text_form_field.dart';

class AddNoteForm extends StatefulWidget {
  const AddNoteForm({
    super.key,
  });

  @override
  State<AddNoteForm> createState() => _AddNoteFormState();
}

class _AddNoteFormState extends State<AddNoteForm> {
  final f = DateFormat('yyyy-MM-dd hh:mm');
  final GlobalKey<FormState> formKey = GlobalKey();
  String? title, subTitle;
  AutovalidateMode autoValidateMode = AutovalidateMode.disabled;
  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      autovalidateMode: autoValidateMode,
      child: Padding(
        padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom,
        ),
        child: Container(
          height: 450,
          padding:
              const EdgeInsets.only(right: 12.0, left: 12, top: 20, bottom: 10),
          child: Column(
            children: <Widget>[
              // const Spacer(
              //     // flex: 1,
              //     ),
              BuildTextFeild(
                onSaved: (value) {
                  title = value;
                },
                hintText: "title",
              ),
              const SizedBox(height: 15.0),
              BuildTextFeild(
                onSaved: (value) {
                  subTitle = value;
                },
                hintText: "content",
                maxLines: 4,
              ),
              const Spacer(
                flex: 1,
              ),
              const ColorList(),
              const Spacer(
                flex: 1,
              ),
              BlocBuilder<AddNoteCubit, AddNoteState>(
                builder: (context, state) => BuildButton(
                  isLoading: state is AddNoteLoading ? true : false,
                  onTap: () {
                    if (formKey.currentState!.validate()) {
                      formKey.currentState!.save();
                      var noteModel = NoteModel(
                        title: title!,
                        subTitle: subTitle!,
                        // date: DateFormat.yMMMd().format(DateTime.now()),
                        date: DateFormat('dd-MM-yyyy ')
                            .add_jm()
                            .format(DateTime.now()),
                        color: Colors.blue.value,
                      );
                      BlocProvider.of<AddNoteCubit>(context).addNote(noteModel);
                    } else {
                      autoValidateMode = AutovalidateMode.always;
                      setState(() {});
                    }
                  },
                  title: "Add",
                  buttonColor: kPrimaryColor,
                  titleColor: Colors.black,
                  width: double.infinity,
                  height: 50,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

