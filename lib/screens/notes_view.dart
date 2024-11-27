import 'package:flutter/material.dart';
import 'package:notesapp/constants/text_style.dart';
import 'package:notesapp/widgets/icon/customSearchIcon.dart';
import 'package:notesapp/widgets/floating_action_button/custom_floating_action_button.dart';
import 'package:notesapp/widgets/body/notes_view_body.dart';
import 'package:notesapp/widgets/main/notes_app_bar_title.dart';

class NotesView extends StatelessWidget {
  const NotesView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: const CustomFloatingActionButton(),
      appBar: AppBar(
        title: NotesAppBarTitle(
          textTitle: 'Notes',
          textTitleStyle: AppTextStyles.heading,
          icon: const CustomSearchIcon(),
        ),
      ),
      body: const NotesViewBody(),
    );
  }
}
