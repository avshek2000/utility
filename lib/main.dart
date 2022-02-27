import 'package:flutter/material.dart';
import 'package:notes_app/apps/notes/pages/notes_page.dart';
import 'package:notes_app/apps/notes/pages/view_page.dart';
import 'package:notes_app/Main Files/homePage.dart';
import 'package:notes_app/Main Files/onboardingScreen.dart';
import 'package:notes_app/routes/routes.dart';
import 'package:notes_app/Main Files/splash.dart';
import 'apps/notes/pages/description_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(primaryColor: Color.fromARGB(255, 243, 176, 5)),
      home: Splash(),
      // routes: {
      //   MyRoutes.notes_List: (context) => NotesPage(),
      //   MyRoutes.notes_desc: (context) => DescriptionPage(),
      //   MyRoutes.notes_view: (context) => ViewPage(noteId: note.id!),
      // },
    );
  }
}
