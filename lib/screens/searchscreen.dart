import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../helper/notedb.dart';

class NoteSearch extends SearchDelegate<Note> {
  NoteSearch(this.notes);
  List<Note> filtered = [];
  final List<Note> notes;
  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(
          Icons.clear,
          color: Colors.black,
        ),
        onPressed: () {
          query = '';
        },
      )
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: Icon(
        Icons.arrow_back,
        color: Colors.black,
      ),
      onPressed: () {
        close(context, null);
      },
    );
  }

  List<Note> getFilteredList(List<Note> note) {
    for (int i = 0; i < note.length; i++) {
      if (note[i].title.toLowerCase().contains(query) ||
          note[i].body.toLowerCase().contains(query)) {
        filtered.add(note[i]);
      }
    }
    return filtered;
  }

  @override
  Widget buildResults(BuildContext context) {
    if (query == '') {
      return Container(
        color: Colors.white,
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(
              height: 40,
              child: Icon(
                Icons.search,
                color: Colors.black,
                size: 40,
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 32),
              width: double.infinity,
              alignment: Alignment.center,
              child: Text(
                'What are you looking for??',
                style: TextStyle(
                  fontFamily: 'Product Sans',
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 25,
                ),
              ),
            ),
          ],
        ),
      );
    } else {
      filtered = [];
      getFilteredList(notes);

      if (filtered.isEmpty) {
        return Container(
          color: Colors.white,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 40,
                child: Icon(
                  FontAwesomeIcons.question,
                  color: Colors.black,
                  size: 20,
                ),
              ),
              Container(
                width: double.infinity,
                alignment: Alignment.center,
                child: Text(
                  'No result found',
                  style: TextStyle(
                    fontFamily: 'Product Sans',
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 25,
                  ),
                ),
              )
            ],
          ),
        );
      } else {
        return Container(
          child: ListView.builder(
            itemCount: filtered == null ? 0 : filtered.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(
                  filtered[index].title,
                  style: TextStyle(
                    fontFamily: 'Product Sans',
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                subtitle: Text(
                  filtered[index].body,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                  style: TextStyle(
                    fontFamily: 'Product Sans',
                    fontSize: 18,
                    color: Colors.black,
                  ),
                ),
                onTap: () {
                  close(context, filtered[index]);
                },
              );
            },
          ),
        );
      }
    }
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    if (query == '') {
      return Container(
        color: Colors.white,
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 40,
              child: Icon(
                FontAwesomeIcons.search,
                color: Colors.black,
                size: 40,
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 32),
              width: double.infinity,
              alignment: Alignment.center,
              child: Text(
                'What are you looking for??',
                style: TextStyle(
                  fontFamily: 'Product Sans',
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 25,
                ),
              ),
            )
          ],
        ),
      );
    } else {
      filtered = [];
      getFilteredList(notes);

      if (filtered.isEmpty) {
        return Container(
          color: Colors.white,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 40,
                child: Icon(
                  FontAwesomeIcons.question,
                  color: Colors.black,
                  size: 20,
                ),
              ),
              Container(
                alignment: Alignment.center,
                width: double.infinity,
                child: Text(
                  'No result found',
                  style: TextStyle(
                    fontFamily: 'Product Sans',
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 25,
                  ),
                ),
              )
            ],
          ),
        );
      } else {
        return Container(
          child: ListView.builder(
            itemCount: filtered == null ? 0 : filtered.length,
            itemBuilder: (context, index) {
              return Container(
                margin: EdgeInsets.all(8),
                child: ListTile(
                  title: Text(
                    filtered[index].title,
                    style: TextStyle(
                      fontFamily: 'Product Sans',
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  subtitle: Text(
                    filtered[index].body,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 3,
                    style: TextStyle(
                      fontFamily: 'Product Sans',
                      fontSize: 18,
                      color: Colors.black,
                    ),
                  ),
                  onTap: () {
                    close(context, filtered[index]);
                  },
                ),
              );
            },
          ),
        );
      }
    }
  }
}
