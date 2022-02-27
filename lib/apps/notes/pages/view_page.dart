import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:notes_app/apps/notes/helper/database.dart';
import 'package:notes_app/apps/notes/pages/description_page.dart';
import 'package:notes_app/apps/notes/pages/notes_page.dart';
import '../models/note.dart';

class ViewPage extends StatefulWidget {
  final int noteId;
  const ViewPage({Key? key, required this.noteId}) : super(key: key);

  @override
  State<ViewPage> createState() => _ViewPageState();
}

class _ViewPageState extends State<ViewPage> {
  late Note note;
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    refreshNote();
  }

  Future refreshNote() async {
    setState(() => isLoading = true);

    this.note = await NotesDatabase.instance.readNote(widget.noteId);

    setState(() => isLoading = false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (context) => NotesPage()));
          },
          icon: Icon(Icons.arrow_back),
          color: Color.fromARGB(255, 238, 196, 10),
          iconSize: 30,
        ),
        actions: [editButton(), deleteButton()],
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Text(
                  note.title,
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 27,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 20),
                Text(
                  note.description,
                  style: TextStyle(color: Colors.black, fontSize: 18),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget editButton() => IconButton(
      padding: EdgeInsets.only(right: 10),
      icon: Icon(
        Icons.edit_outlined,
        color: Color.fromARGB(255, 238, 196, 10),
        size: 27,
      ),
      onPressed: () async {
        if (isLoading) return;

        await Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => DescriptionPage(note: note),
        ));

        refreshNote();
      });

  Widget deleteButton() => IconButton(
        icon: Icon(
          Icons.delete,
          color: Color.fromARGB(255, 238, 196, 10),
        ),
        onPressed: () async {
          await NotesDatabase.instance.delete(widget.noteId);
          // Navigator.of(context).pop();
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => NotesPage(),
          ));

          refreshNote();
        },
      );
}
