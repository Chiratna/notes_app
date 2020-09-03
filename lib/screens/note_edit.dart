import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:moor/moor.dart';
import '../constants.dart';
import '../helper/notedb.dart';
import '../widgets/dateShow.dart';
import '../widgets/expandedHeading.dart';
import '../widgets/expandedItem.dart';
import '../widgets/saveIcon.dart';
import 'package:provider/provider.dart';

class EditNote extends StatefulWidget {
  EditNote({this.oldnote, this.database});
  final Note oldnote;
  final AppDatabase database;
  @override
  _EditNoteState createState() => _EditNoteState();
}

class _EditNoteState extends State<EditNote> {
  bool isNewNote = true;
  bool isChanged = false;
  bool isArchived = false;
  bool isImportant = false;
  int colorIndex = 0;
  FocusNode bodyNode;
  FocusNode titleNode;

  TextEditingController titleController = TextEditingController();
  TextEditingController bodyController = TextEditingController();

  Note currentNote;

  @override
  void initState() {
    bodyNode = FocusNode();
    titleNode = FocusNode();
    if (widget.oldnote != null) {
      currentNote = widget.oldnote;
      isArchived = widget.oldnote.isArchived;
      isImportant = widget.oldnote.isImportant;
      colorIndex =
          widget.oldnote.colorIndex == null ? 0 : widget.oldnote.colorIndex;
      isNewNote = false;
      titleController.text = widget.oldnote.title;
      bodyController.text = widget.oldnote.body;
    } else {
      colorIndex = 0;
      isNewNote = true;
    }
    super.initState();
  }

  @override
  void dispose() {
    bodyNode.dispose();
    titleController.dispose();
    bodyController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final db = Provider.of<AppDatabase>(context);
    return Scaffold(
      backgroundColor: colors[colorIndex],
      appBar: AppBar(
        backgroundColor: colors[colorIndex],
        title: Text(
          'Edit Note',
          style: TextStyle(
            color: Colors.black,
            fontFamily: 'Product Sans',
            fontSize: 25,
            fontWeight: FontWeight.bold,
          ),
        ),
        elevation: 0,
        actions: [
          IconButton(
              icon: Icon(
                FontAwesomeIcons.trash,
                color: Colors.black,
              ),
              onPressed: () {
                if (!isNewNote) {
                  Navigator.of(context).pop();
                  db.deleteNote(currentNote);
                }
              }),
          IconButton(
              icon: Icon(
                isImportant
                    ? FontAwesomeIcons.solidStar
                    : FontAwesomeIcons.star,
                color: Colors.black,
              ),
              onPressed: () {
                setState(() {
                  isImportant = !isImportant;
                  isChanged = true;
                });
              }),
          IconButton(
              icon: Icon(
                isArchived ? Icons.unarchive : Icons.archive,
                color: Colors.black,
                size: 33,
              ),
              onPressed: () {
                setState(() {
                  isArchived = !isArchived;
                  isChanged = true;
                });
              }),
          SaveIcon(
            isChanged: isChanged,
            pressHandler: () {
              FocusScope.of(context).requestFocus(new FocusNode());
              bodyNode.unfocus();
              titleNode.unfocus();
              setState(() {
                handleSave(db);
                isChanged = false;
              });
            },
          ),
        ],
      ),
      body: GestureDetector(
        onTap: () {
          bodyNode.requestFocus();
        },
        child: ListView(
          physics: BouncingScrollPhysics(),
          children: [
            DateDisplay(isNewNote ? DateTime.now() : currentNote.creationDate),
            GestureDetector(
              onTap: () {},
              child: Container(
                width: size.width,
                child: ExpandablePanel(
                  header: ExpandedHeading(),
                  expanded: Container(
                    height: 80,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      physics: BouncingScrollPhysics(),
                      itemCount: colors.length,
                      // itemExtent: size.width,
                      itemBuilder: (_, index) {
                        return GestureDetector(
                            onTap: () {
                              FocusScope.of(context)
                                  .requestFocus(new FocusNode());
                              bodyNode.unfocus();
                              titleNode.unfocus();
                              setState(() {
                                colorIndex = index;
                              });
                            },
                            child: ExpandedItemContainer(
                              curIndex: colorIndex,
                              index: index,
                            ));
                      },
                    ),
                  ),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.all(16),
              child: TextField(
                controller: titleController,
                keyboardType: TextInputType.multiline,
                style: kEditHeadingStyle,
                decoration: InputDecoration.collapsed(
                  hintText: 'Title',
                  hintStyle: kEditTitleHintStyle,
                ),
                onChanged: (value) {
                  setState(() {
                    isChanged = true;
                  });
                },
              ),
            ),
            Container(
              padding: EdgeInsets.all(16),
              child: TextField(
                controller: bodyController,
                focusNode: bodyNode,
                enabled: true,
                keyboardType: TextInputType.multiline,
                maxLines: null,
                style: kEditTitleHintStyle,
                decoration: InputDecoration.collapsed(
                  hintText: 'Body',
                  hintStyle: kEditTitleHintStyle,
                ),
                onChanged: (value) {
                  setState(() {
                    isChanged = true;
                  });
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  void handleSave(AppDatabase db) {
    if (isNewNote) {
      if (bodyController.text.trim().isNotEmpty &&
          titleController.text.trim().isNotEmpty) {
        NotesCompanion toAdd = NotesCompanion(
          body: Value(bodyController.text),
          title: Value(titleController.text),
          colorIndex: Value(colorIndex),
          isArchived: Value(isArchived),
          isImportant: Value(isImportant),
          creationDate: Value(DateTime.now()),
        );
        db.insertNote(toAdd);
        // print(currentNote.title);
        // print(notes.length);
      }
    }

    if (!isNewNote) {
      if (bodyController.text.trim() != widget.oldnote.body.trim() ||
          titleController.text.trim() != widget.oldnote.title.trim() ||
          colorIndex != widget.oldnote.colorIndex ||
          isArchived != widget.oldnote.isArchived ||
          isImportant != widget.oldnote.isImportant) {
        db.updateNote(currentNote.copyWith(
          body: bodyController.text.trim(),
          title: titleController.text.trim(),
          colorIndex: colorIndex,
          isArchived: isArchived,
          isImportant: isImportant,
          creationDate: DateTime.now(),
        ));
        print(currentNote.title);
        print(currentNote.isArchived);
      }
    }
  }
}
