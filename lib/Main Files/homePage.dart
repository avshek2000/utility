import 'package:flutter/material.dart';

import '../apps/notes/pages/notes_page.dart';
import 'dbHelper.dart';

class Home_Page extends StatefulWidget {
  final List<Apps> _apps = [
    Apps("Notes",
        "https://p1.hiclipart.com/preview/918/678/510/ios-7-icons-updated-notes-note-icon-png-clipart.jpg"),
    Apps("Scanner",
        "https://p1.hiclipart.com/preview/918/678/510/ios-7-icons-updated-notes-note-icon-png-clipart.jpg"),
    Apps("Ruler",
        "https://p1.hiclipart.com/preview/918/678/510/ios-7-icons-updated-notes-note-icon-png-clipart.jpg"),
    Apps("Compass",
        "https://p1.hiclipart.com/preview/918/678/510/ios-7-icons-updated-notes-note-icon-png-clipart.jpg"),
    Apps("Unit Converter",
        "https://p1.hiclipart.com/preview/918/678/510/ios-7-icons-updated-notes-note-icon-png-clipart.jpg"),
    Apps("Language Translater",
        "https://p1.hiclipart.com/preview/918/678/510/ios-7-icons-updated-notes-note-icon-png-clipart.jpg"),
  ];

  @override
  State<Home_Page> createState() => _HomePageState();
}

class _HomePageState extends State<Home_Page> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 140),
            child: Center(
              child: Text(
                "AVAIL",
                style: TextStyle(
                    fontSize: 45,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 238, 196, 10)),
              ),
            ),
          ),
        ],
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        child: GridView(
          children: [
            InkWell(
              onTap: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) => NotesPage()));
              },
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: Color.fromARGB(255, 238, 196, 10),
                ),
                child: Column(
                  children: [
                    Icon(
                      Icons.notes,
                      size: 50,
                      color: Colors.white,
                    ),
                    Text(
                      "NOTES",
                      style: TextStyle(fontSize: 35, color: Colors.white),
                    )
                  ],
                ),
              ),
            ),
            InkWell(
              onTap: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) => NotesPage()));
              },
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: Colors.blue,
                ),
                child: Column(
                  children: [
                    Icon(
                      Icons.notes,
                      size: 50,
                      color: Colors.white,
                    ),
                    Text(
                      "Scanner",
                      style: TextStyle(fontSize: 35, color: Colors.white),
                    )
                  ],
                ),
              ),
            ),
            InkWell(
              onTap: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) => NotesPage()));
              },
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: Colors.red,
                ),
                child: Column(
                  children: [
                    Icon(
                      Icons.notes,
                      size: 50,
                      color: Colors.white,
                    ),
                    Text(
                      "Compass",
                      style: TextStyle(fontSize: 35, color: Colors.white),
                    )
                  ],
                ),
              ),
            ),
            InkWell(
              onTap: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) => NotesPage()));
              },
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: Colors.teal,
                ),
                child: Column(
                  children: [
                    Icon(
                      Icons.notes,
                      size: 50,
                      color: Colors.white,
                    ),
                    Text(
                      "Ruler",
                      style: TextStyle(fontSize: 35, color: Colors.white),
                    )
                  ],
                ),
              ),
            ),
            InkWell(
              onTap: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) => NotesPage()));
              },
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: Colors.purple,
                ),
                child: Column(
                  children: [
                    Icon(
                      Icons.notes,
                      size: 50,
                      color: Colors.white,
                    ),
                    Text(
                      "Unit   Convert",
                      style: TextStyle(fontSize: 35, color: Colors.white),
                    )
                  ],
                ),
              ),
            ),
            InkWell(
              onTap: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) => NotesPage()));
              },
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: Colors.black,
                ),
                child: Column(
                  children: [
                    Icon(
                      Icons.notes,
                      size: 50,
                      color: Colors.white,
                    ),
                    Text(
                      "Language Translate",
                      style: TextStyle(fontSize: 35, color: Colors.white),
                    )
                  ],
                ),
              ),
            ),
            // Container(
            //   decoration: BoxDecoration(
            //     borderRadius: BorderRadius.circular(8),
            //     color: Colors.blue,
            //   ),
            // ),
            // Container(
            //   decoration: BoxDecoration(
            //     borderRadius: BorderRadius.circular(8),
            //     color: Colors.teal,
            //   ),
            // ),
            // Container(
            //   decoration: BoxDecoration(
            //     borderRadius: BorderRadius.circular(8),
            //     color: Colors.yellow,
            //   ),
            // ),
            // Container(
            //   padding: EdgeInsets.all(15),
            //   decoration: BoxDecoration(
            //     borderRadius: BorderRadius.circular(8),
            //     color: Colors.brown,
            //   ),
            // ),
            // Container(
            //   decoration: BoxDecoration(
            //     borderRadius: BorderRadius.circular(8),
            //     color: Colors.purple,
            //   ),
            // ),
          ],
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, mainAxisSpacing: 12, crossAxisSpacing: 12),
        ),
      ),
    );
  }
}
