import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notesapp/Models/NoteModal.dart';
import 'package:notesapp/Views/NotesView.dart';
import 'package:notesapp/Widgets/edit_note_view.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:notesapp/constants.dart';
import 'package:notesapp/cubit/add_note_cubit/add_note_cubit.dart';
import 'package:notesapp/simple_bloc_observer.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Hive.registerAdapter(NoteModalAdapter());
  await Hive.initFlutter();
  await Hive.openBox<NoteModal>(kNotesBox);

  Bloc.observer = simple_bloc_observer();
  runApp(const NotesApp());
}

class NotesApp extends StatelessWidget {
  const NotesApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [BlocProvider(create: (context) => AddNoteCubit())],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {"editnote": (context) => EditNoteView()},
        theme: ThemeData(
          brightness: Brightness.dark,
          fontFamily: "Poppins",
          appBarTheme: AppBarTheme(
            centerTitle: true,
            elevation: 0,
            titleSpacing: 2,
          ),
        ),
        home: const NotesView(),
      ),
    );
  }
}
