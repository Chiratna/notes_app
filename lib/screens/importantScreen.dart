import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:notes_app/helper/notedb.dart';
import 'package:notes_app/widgets/myDrawer.dart';
import 'package:notes_app/widgets/noteItem.dart';
import 'package:provider/provider.dart';

import '../constants.dart';
import 'note_edit.dart';
import 'searchscreen.dart';

class ImportantScreen extends StatefulWidget {
  @override
  _ImportantScreenState createState() => _ImportantScreenState();
}

class _ImportantScreenState extends State<ImportantScreen> {
  List<Note> notes = [];

  int axisCount = 2;

  @override
  Widget build(BuildContext context) {
    final database = Provider.of<AppDatabase>(context);
    return Scaffold(
      backgroundColor: Colors.white,
      drawer: CustomDrawer(Modes.Important),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        title: Text(
          'Important Notes',
          style: TextStyle(
            color: Colors.black,
            fontFamily: 'Product Sans',
            fontWeight: FontWeight.bold,
            fontSize: 25,
          ),
        ),
        actions: [
          IconButton(
              icon: Icon(
                Icons.search,
                color: Colors.black,
                size: 30,
              ),
              onPressed: () async {
                Note item = await showSearch(
                    context: context, delegate: NoteSearch(notes));
                if (item != null) gotoEditNote(context, item, database);
              }),
          builtTogglingViewIcon(database),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: Colors.black,
        icon: Icon(
          FontAwesomeIcons.plus,
          color: Colors.white,
        ),
        onPressed: () {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (_) => EditNote()));
        },
        label: Text(
          'Add Note',
          style: TextStyle(
              fontFamily: 'Product Sans',
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.white),
        ),
      ),
      // body: widget.mode == Modes.All
      //     ? builtBodyHome(context, database)
      //     : builtArchiveHome(context, database),
      body: builtBodyHome(context, database),
    );
  }

  Widget builtBodyHome(BuildContext ctx, AppDatabase database) {
    return StreamBuilder(
      stream: database.watchImportantNotes(),
      builder: (context, AsyncSnapshot<List<Note>> snapshot) {
        notes = snapshot.data;

        return notes == null || notes.isEmpty
            ? Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    alignment: Alignment.center,
                    child: Icon(
                      FontAwesomeIcons.stickyNote,
                      color: Colors.black38,
                      size: 50,
                    ),
                  ),
                  Container(
                      alignment: Alignment.center,
                      child: Text(
                        'You do not have any important note...',
                        softWrap: true,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontFamily: 'Product Sans',
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          color: Colors.black38,
                        ),
                      )),
                ],
              )
            : StaggeredGridView.countBuilder(
                crossAxisCount: 4,
                physics: BouncingScrollPhysics(),
                itemCount: notes.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      gotoEditNote(context, notes[index], database);
                    },
                    child: NoteItem(
                      note: notes[index],
                    ),
                  );
                },
                staggeredTileBuilder: (index) => StaggeredTile.fit(axisCount),
              );
      },
    );
  }

  void gotoEditNote(BuildContext ctx, Note item, AppDatabase database) {
    Navigator.push(
        ctx,
        MaterialPageRoute(
          builder: (context) => EditNote(
            oldnote: item,
            database: database,
          ),
        ));
  }

  Widget builtTogglingViewIcon(AppDatabase database) {
    return StreamBuilder(
        stream: database.watchImportantNotes(),
        builder: (context, AsyncSnapshot<List<Note>> snapshot) {
          notes = snapshot.data;

          return notes == null || notes.isEmpty
              ? Container()
              : IconButton(
                  icon: Icon(
                    axisCount == 2 ? FontAwesomeIcons.list : Icons.grid_on,
                  ),
                  onPressed: () {
                    setState(() {
                      axisCount = axisCount == 2 ? 4 : 2;
                    });
                  });
        });
  }
}
