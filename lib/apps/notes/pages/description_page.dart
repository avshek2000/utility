import 'dart:io';
import 'package:notes_app/apps/notes/helper/database.dart';
import 'package:notes_app/apps/notes/models/note.dart';
import 'package:notes_app/apps/notes/widgets/form_widget.dart';
import 'package:notes_app/routes/routes.dart';
import 'package:path_provider/path_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:notes_app/apps/notes/pages/notes_page.dart';
import 'package:notes_app/apps/notes/pages/view_page.dart';

class DescriptionPage extends StatefulWidget {
  final Note? note;

  DescriptionPage({
    Key? key,
    this.note,
  }) : super(key: key);

  @override
  State<DescriptionPage> createState() => _DescriptionPageState();
}

class _DescriptionPageState extends State<DescriptionPage> {
  final _formKey = GlobalKey<FormState>();
  String? title;
  String? description;

  // late List<Note> notes;
  bool isLoading = false;

  void initState() {
    super.initState();
    title = widget.note?.title ?? '';
    description = widget.note?.description ?? '';
  }

  Future pickImage() async {
    final image = await ImagePicker().pickImage(source: ImageSource.gallery);
  }

  Future clickImage() async {
    final image = await ImagePicker().pickImage(source: ImageSource.camera);
  }

  // File _image;
  final picker = ImagePicker();

  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          leading: IconButton(
            onPressed: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => NotesPage()));
            },
            icon: Icon(Icons.arrow_back),
            color: Color.fromARGB(255, 238, 196, 10),
            iconSize: 30,
          ),
          actions: [
            IconButton(
              onPressed: () => clickImage(),
              icon: Icon(Icons.camera_alt_outlined),
              color: Color.fromARGB(255, 238, 196, 10),
              iconSize: 30,
            ),
            SizedBox(
              width: 5,
            ),
            IconButton(
              onPressed: () => pickImage(),
              icon: Icon(
                Icons.image_outlined,
                color: Color.fromARGB(255, 238, 196, 10),
              ),
              color: Color.fromARGB(255, 238, 196, 10),
              iconSize: 30,
            ),
            SizedBox(
              width: 5,
            ),
            buildButton()
          ],
        ),
        backgroundColor: Colors.white,
        body: Form(
          key: _formKey,
          child: SafeArea(
            child: SingleChildScrollView(
              child: FormPageWidget(
                title: title,
                description: description,
                onChangedDescription: (description) =>
                    setState(() => this.description = description),
                onChangedTitle: (title) => setState(() => this.title = title),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget buildButton() {
    return Padding(
        padding: EdgeInsets.all(10),
        child: FloatingActionButton(
          onPressed: addOrUpdateNote,
          child: Icon(
            Icons.save,
          ),
          backgroundColor: Color.fromARGB(255, 238, 196, 10),
        ));
  }

  void addOrUpdateNote() async {
    final isValid = _formKey.currentState!.validate();

    if (isValid) {
      final isUpdating = widget.note != null;

      if (isUpdating) {
        await updateNote();
      } else {
        await addNote();
      }

      Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => NotesPage(),
      ));
    }
  }

  Future updateNote() async {
    final note = widget.note!.copy(
      title: title,
      description: description,
    );

    await NotesDatabase.instance.update(note);
  }

  Future addNote() async {
    final note = Note(
      title: title!,
      description: description!,
    );

    await NotesDatabase.instance.create(note);
  }
}
