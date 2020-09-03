import 'package:moor/ffi.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;
import 'package:moor/moor.dart';
import 'dart:io';

part 'notedb.g.dart';

class Notes extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get colorIndex => integer()();
  TextColumn get body => text().nullable()();
  TextColumn get title => text().nullable()();
  DateTimeColumn get creationDate => dateTime()();
  BoolColumn get isImportant => boolean()();
  BoolColumn get isArchived => boolean()();
}

LazyDatabase _openConnection() {
  // the LazyDatabase util lets us find the right location for the file async.
  return LazyDatabase(() async {
    // put the database file, called db.sqlite here, into the documents folder
    // for your app.
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'db.sqlite'));
    return VmDatabase(file);
  });
}

@UseMoor(tables: [Notes])
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 1;

  Future<List<Note>> getAllNotes() => select(notes).get();
  Stream<List<Note>> watchAllNotes() =>
      (select(notes)..where((tbl) => tbl.isArchived.not())).watch();
  Future insertNote(NotesCompanion note) => into(notes).insert(note);
  Future updateNote(Note note) => update(notes).replace(note);
  Future deleteNote(Note note) => delete(notes).delete(note);

  Stream<List<Note>> watchArchiveNotes() =>
      (select(notes)..where((tbl) => tbl.isArchived)).watch();
  Stream<List<Note>> watchImportantNotes() =>
      (select(notes)..where((tbl) => tbl.isImportant & tbl.isArchived.not()))
          .watch();
}
