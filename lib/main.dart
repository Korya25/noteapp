import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:notesapp/constants/key_word.dart';
import 'package:notesapp/cubits/notes_cuibt.dart/notes_cuibt.dart';
import 'package:notesapp/cubits/theme_cubit/theme_cuibt.dart';
import 'package:notesapp/models/note_model.dart';
import 'package:notesapp/screens/notes_view.dart';
import 'package:notesapp/simple_block_observer.dart';

void main() async {
  await Hive.initFlutter();
  Bloc.observer = SimpleBlockObserver();
  Hive.registerAdapter(NoteModelAdapter());
  await Hive.openBox<NoteModel>(kNotesBox);
  runApp(
    MultiBlocProvider(providers: [
      BlocProvider(create: (context) => ThemeCubit()),
      BlocProvider(create: (context) => NoteCuibt()..fetchAllNotes()),
    ], child: const MyApp()),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
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
