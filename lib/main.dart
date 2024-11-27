import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:notesapp/constants/key_word.dart';
import 'package:notesapp/cubits/add_note/add_note_cuibt.dart';
import 'package:notesapp/cubits/theme_cubit/theme_cuibt.dart';
import 'package:notesapp/models/note_model.dart';
import 'package:notesapp/screens/notes_view.dart';
import 'package:notesapp/simple_block_observer.dart';

void main() async {
  await Hive.initFlutter();
  Bloc.observer = SimpleBlockObserver();
  await Hive.openBox(kNotesBox);
  Hive.registerAdapter(NoteModelAdapter());
  runApp(
    MultiBlocProvider(providers: [
      BlocProvider(create: (context) => ThemeCubit()),
      BlocProvider(create: (context) => AddNoteCuibt()),
    ], child: const MyApp()),
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
          theme: ThemeData.light(),
          darkTheme: ThemeData.dark(),
          themeMode:
              state == ThemeState.dark ? ThemeMode.dark : ThemeMode.light,
          home: const NotesView(),
        );
      },
    );
  }
}
