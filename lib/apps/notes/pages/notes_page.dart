import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:notes_app/Main%20Files/homePage.dart';
import 'package:notes_app/apps/notes/helper/database.dart';
import 'package:notes_app/apps/notes/models/note.dart';
import 'package:notes_app/apps/notes/pages/view_page.dart';
import 'package:notes_app/apps/notes/widgets/notes_card.dart';
import 'package:notes_app/routes/routes.dart';
import 'description_page.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class NotesPage extends StatefulWidget {
  const NotesPage({Key? key}) : super(key: key);

  @override
  _NotesPageState createState() => _NotesPageState();
}

class _NotesPageState extends State<NotesPage> {
  late List<Note> notes;
  bool isLoading = false;

  @override
  void initState() {
    super.initState();

    refreshNotes();
  }

  Future refreshNotes() async {
    setState(() => isLoading = true);

    this.notes = await NotesDatabase.instance.readAllNotes();

    setState(() => isLoading = false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0,
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () {
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (context) => Home_Page()));
          },
          icon: Icon(Icons.arrow_back),
          color: Color.fromARGB(255, 238, 196, 10),
          iconSize: 30,
        ),
        title: Padding(
          padding: const EdgeInsets.fromLTRB(55, 0, 0, 0),
          child: Text(
            "NOTES",
            style: TextStyle(
              fontSize: 40,
              fontWeight: FontWeight.bold,
              color: Color.fromARGB(255, 238, 196, 10),
            ),
          ),
        ),
      ),
      body: Center(
        child: isLoading
            ? CircularProgressIndicator()
            : notes.isEmpty
                ? Text(
                    'No Notes',
                    style: TextStyle(
                        color: Color.fromARGB(255, 238, 196, 10), fontSize: 30),
                  )
                : Notes(),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => DescriptionPage()));
        },
        child: Icon(
          Icons.add,
        ),
        backgroundColor: Color.fromARGB(255, 238, 196, 10),
      ),
    );
  }

  Widget Notes() => ListView.builder(
      itemCount: notes.length,
      itemBuilder: (context, index) {
        final note = notes[index];
        return GestureDetector(
          onTap: () async {
            await Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => ViewPage(noteId: note.id!)));
          },
          child: NoteCardWidget(note: note, index: index),
        );
      });
}
