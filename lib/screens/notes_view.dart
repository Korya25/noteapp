import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notesapp/constants/text_style.dart';
import 'package:notesapp/cubits/notes_cuibt.dart/notes_cuibt.dart';
import 'package:notesapp/widgets/icon/customSearchIcon.dart';
import 'package:notesapp/widgets/floating_action_button/custom_floating_action_button.dart';
import 'package:notesapp/widgets/body/notes_view_body.dart';
import 'package:notesapp/widgets/main/notes_app_bar_title.dart';

class NotesView extends StatelessWidget {
  const NotesView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NoteCuibt(),
      child: Scaffold(
        floatingActionButton: const CustomFloatingActionButton(),
        appBar: AppBar(
          title: NotesAppBarTitle(
            textTitle: 'Notes',
            textTitleStyle: AppTextStyles.heading,
            icon: const CustomSearchIcon(),
          ),
        ),
        body: const NotesViewBody(),
      ),
    );
  }
}
