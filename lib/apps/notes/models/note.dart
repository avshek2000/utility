final String tableNotes = 'notes'; //creating a table

class NoteFields {
  //defining the fields/column names for the table in database
  static final List<String> values = [id, title, description];
  static final String id = '_id';
  static final String title = 'title';
  static final String description = 'description';
}

class Note {
  final int? id;
  final String title;
  final String description;

  Note({
    this.id,
    required this.title,
    required this.description,
  });

  Note copy({
    int? id,
    String? title,
    String? description,
  }) =>
      Note(
        id: id ?? this.id,
        title: title ?? this.title,
        description: description ?? this.description,
      );
  static Note fromJson(Map<String, Object?> json) => Note(
      id: json[NoteFields.id] as int?,
      title: json[NoteFields.title] as String,
      description: json[NoteFields.description] as String);

  Map<String, Object?> toJson() => {
        //converting to json where using key : value
        NoteFields.id: id,
        NoteFields.title: title,
        NoteFields.description: description,
      };
}
