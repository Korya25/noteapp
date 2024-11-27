import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notesapp/cubits/theme_cubit/theme_cuibt.dart';
import 'package:notesapp/screens/edit_view.dart';
import 'package:notesapp/screens/notes_view.dart';

void main() {
  runApp(
    BlocProvider(
      create: (context) {
        return ThemeCubit();
      },
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeCubit, ThemeState>(
      builder: (context, state) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData.dark(),
          darkTheme: ThemeData.dark(),
          themeMode:
              state == ThemeState.dark ? ThemeMode.dark : ThemeMode.light,
          home: const NotesView(),
        );
      },
    );
  }
}
