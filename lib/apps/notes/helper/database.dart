import 'dart:developer';
import 'dart:io';
import 'package:notes_app/apps/notes/models/note.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class NotesDatabase {
  static final NotesDatabase instance = NotesDatabase
      ._init(); //creating a global field,which is calling NotesDatabase._init() constructor
  static Database? _database; //creating a field

  NotesDatabase._init(); //private constructor

  Future<Database> get database async {
    //creating a database
    if (_database != null) return _database!;

    _database = await _initDB('notes.db'); //creating a new file notes.db
    return _database!;
  }

  Future<Database> _initDB(String filePath) async {
    Directory datadirectory = await getApplicationDocumentsDirectory();
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, filePath);
    print('Location:' + datadirectory.path);
    return await openDatabase(path, version: 1, onCreate: _createDB);
  }

  Future _createDB(Database db, int version) async {
    //only elecutes if the above file notes.db doesnot exist

    final idType = 'INTEGER PRIMARY KEY AUTOINCREMENT'; //defining types for it
    final textType = 'TEXT NOT NULL'; //defining type for text

    await db.execute('''
    CREATE TABLE $tableNotes( 
      ${NoteFields.id} $idType,
      ${NoteFields.title} $textType,
      ${NoteFields.description} $textType

    )
    '''); //creating table columns
  }

  Future<Note> create(Note note) async {
    final db = await instance.database;

    final id = await db.insert(tableNotes, note.toJson());

    return note.copy(id: id);
  }

  Future<Note> readNote(int id) async {
    //reading single note
    final db = await instance.database;

    final maps = await db.query(tableNotes,
        columns: NoteFields.values,
        where: '${NoteFields.id} =?',
        whereArgs: [id]);

    if (maps.isNotEmpty) {
      return Note.fromJson(maps.first);
    } else {
      throw Exception('ID $id not fould');
    }
  }

  Future<List<Note>> readAllNotes() async {
    final db = await instance.database;

    final orderBy = '${NoteFields.id} ASC';
    final result = await db.query(tableNotes, orderBy: orderBy);

    return result
        .map((json) => Note.fromJson(json))
        .toList(); //converting json object to note object
  }

  Future<int> update(Note note) async {
    final db = await instance.database;

    return db.update(tableNotes, note.toJson(),
        where: '${NoteFields.id} = ?', whereArgs: [note.id]);
  }

  Future<int> delete(int id) async {
    final db = await instance.database;

    return await db
        .delete(tableNotes, where: '${NoteFields.id} = ?', whereArgs: [id]);
  }

  Future close() async {
    final db = await instance.database;
    db.close();
  }
}
