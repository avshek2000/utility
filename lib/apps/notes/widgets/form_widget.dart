import 'package:flutter/material.dart';

class FormPageWidget extends StatelessWidget {
  final String? title;
  final String? description;
  final ValueChanged<String> onChangedTitle;
  final ValueChanged<String> onChangedDescription;

  const FormPageWidget(
      {Key? key,
      this.title = ' ',
      this.description = ' ',
      required this.onChangedTitle,
      required this.onChangedDescription})
      : super(key: key);

  @override
  Widget build(BuildContext context) => SingleChildScrollView(
          child: Padding(
        padding: EdgeInsets.all(10),
        child: Column(
          children: [
            buildTitle(),
            SizedBox(height: 10),
            buildDescription(),
          ],
        ),
      ));

  Widget buildTitle() => TextFormField(
        initialValue: title,
        style: TextStyle(fontSize: 27, fontWeight: FontWeight.bold),
        decoration: InputDecoration(
            hintText: "Title",
            hintStyle: TextStyle(fontSize: 27, fontWeight: FontWeight.bold),
            border: InputBorder.none),
        validator: (title) =>
            title != null && title.isEmpty ? 'The title cannot be empty' : null,
        onChanged: onChangedTitle,
      );

  Widget buildDescription() => Column(
        children: [
          TextFormField(
            initialValue: description,
            style: TextStyle(fontSize: 20),
            decoration: InputDecoration(
                hintText: "Description ...",
                hintStyle: TextStyle(fontSize: 20),
                border: InputBorder.none),
            maxLines: null,
            validator: (description) =>
                description != null && description.isEmpty
                    ? 'The title cannot be empty'
                    : null,
            onChanged: onChangedDescription,
          ),
        ],
      );
}
