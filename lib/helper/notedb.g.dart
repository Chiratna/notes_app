// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notedb.dart';

// **************************************************************************
// MoorGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps, unnecessary_this
class Note extends DataClass implements Insertable<Note> {
  final int id;
  final int colorIndex;
  final String body;
  final String title;
  final DateTime creationDate;
  final bool isImportant;
  final bool isArchived;
  Note(
      {@required this.id,
      @required this.colorIndex,
      this.body,
      this.title,
      @required this.creationDate,
      @required this.isImportant,
      @required this.isArchived});
  factory Note.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    final intType = db.typeSystem.forDartType<int>();
    final stringType = db.typeSystem.forDartType<String>();
    final dateTimeType = db.typeSystem.forDartType<DateTime>();
    final boolType = db.typeSystem.forDartType<bool>();
    return Note(
      id: intType.mapFromDatabaseResponse(data['${effectivePrefix}id']),
      colorIndex: intType
          .mapFromDatabaseResponse(data['${effectivePrefix}color_index']),
      body: stringType.mapFromDatabaseResponse(data['${effectivePrefix}body']),
      title:
          stringType.mapFromDatabaseResponse(data['${effectivePrefix}title']),
      creationDate: dateTimeType
          .mapFromDatabaseResponse(data['${effectivePrefix}creation_date']),
      isImportant: boolType
          .mapFromDatabaseResponse(data['${effectivePrefix}is_important']),
      isArchived: boolType
          .mapFromDatabaseResponse(data['${effectivePrefix}is_archived']),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || id != null) {
      map['id'] = Variable<int>(id);
    }
    if (!nullToAbsent || colorIndex != null) {
      map['color_index'] = Variable<int>(colorIndex);
    }
    if (!nullToAbsent || body != null) {
      map['body'] = Variable<String>(body);
    }
    if (!nullToAbsent || title != null) {
      map['title'] = Variable<String>(title);
    }
    if (!nullToAbsent || creationDate != null) {
      map['creation_date'] = Variable<DateTime>(creationDate);
    }
    if (!nullToAbsent || isImportant != null) {
      map['is_important'] = Variable<bool>(isImportant);
    }
    if (!nullToAbsent || isArchived != null) {
      map['is_archived'] = Variable<bool>(isArchived);
    }
    return map;
  }

  NotesCompanion toCompanion(bool nullToAbsent) {
    return NotesCompanion(
      id: id == null && nullToAbsent ? const Value.absent() : Value(id),
      colorIndex: colorIndex == null && nullToAbsent
          ? const Value.absent()
          : Value(colorIndex),
      body: body == null && nullToAbsent ? const Value.absent() : Value(body),
      title:
          title == null && nullToAbsent ? const Value.absent() : Value(title),
      creationDate: creationDate == null && nullToAbsent
          ? const Value.absent()
          : Value(creationDate),
      isImportant: isImportant == null && nullToAbsent
          ? const Value.absent()
          : Value(isImportant),
      isArchived: isArchived == null && nullToAbsent
          ? const Value.absent()
          : Value(isArchived),
    );
  }

  factory Note.fromJson(Map<String, dynamic> json,
      {ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return Note(
      id: serializer.fromJson<int>(json['id']),
      colorIndex: serializer.fromJson<int>(json['colorIndex']),
      body: serializer.fromJson<String>(json['body']),
      title: serializer.fromJson<String>(json['title']),
      creationDate: serializer.fromJson<DateTime>(json['creationDate']),
      isImportant: serializer.fromJson<bool>(json['isImportant']),
      isArchived: serializer.fromJson<bool>(json['isArchived']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'colorIndex': serializer.toJson<int>(colorIndex),
      'body': serializer.toJson<String>(body),
      'title': serializer.toJson<String>(title),
      'creationDate': serializer.toJson<DateTime>(creationDate),
      'isImportant': serializer.toJson<bool>(isImportant),
      'isArchived': serializer.toJson<bool>(isArchived),
    };
  }

  Note copyWith(
          {int id,
          int colorIndex,
          String body,
          String title,
          DateTime creationDate,
          bool isImportant,
          bool isArchived}) =>
      Note(
        id: id ?? this.id,
        colorIndex: colorIndex ?? this.colorIndex,
        body: body ?? this.body,
        title: title ?? this.title,
        creationDate: creationDate ?? this.creationDate,
        isImportant: isImportant ?? this.isImportant,
        isArchived: isArchived ?? this.isArchived,
      );
  @override
  String toString() {
    return (StringBuffer('Note(')
          ..write('id: $id, ')
          ..write('colorIndex: $colorIndex, ')
          ..write('body: $body, ')
          ..write('title: $title, ')
          ..write('creationDate: $creationDate, ')
          ..write('isImportant: $isImportant, ')
          ..write('isArchived: $isArchived')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(
      id.hashCode,
      $mrjc(
          colorIndex.hashCode,
          $mrjc(
              body.hashCode,
              $mrjc(
                  title.hashCode,
                  $mrjc(creationDate.hashCode,
                      $mrjc(isImportant.hashCode, isArchived.hashCode)))))));
  @override
  bool operator ==(dynamic other) =>
      identical(this, other) ||
      (other is Note &&
          other.id == this.id &&
          other.colorIndex == this.colorIndex &&
          other.body == this.body &&
          other.title == this.title &&
          other.creationDate == this.creationDate &&
          other.isImportant == this.isImportant &&
          other.isArchived == this.isArchived);
}

class NotesCompanion extends UpdateCompanion<Note> {
  final Value<int> id;
  final Value<int> colorIndex;
  final Value<String> body;
  final Value<String> title;
  final Value<DateTime> creationDate;
  final Value<bool> isImportant;
  final Value<bool> isArchived;
  const NotesCompanion({
    this.id = const Value.absent(),
    this.colorIndex = const Value.absent(),
    this.body = const Value.absent(),
    this.title = const Value.absent(),
    this.creationDate = const Value.absent(),
    this.isImportant = const Value.absent(),
    this.isArchived = const Value.absent(),
  });
  NotesCompanion.insert({
    this.id = const Value.absent(),
    @required int colorIndex,
    this.body = const Value.absent(),
    this.title = const Value.absent(),
    @required DateTime creationDate,
    @required bool isImportant,
    @required bool isArchived,
  })  : colorIndex = Value(colorIndex),
        creationDate = Value(creationDate),
        isImportant = Value(isImportant),
        isArchived = Value(isArchived);
  static Insertable<Note> custom({
    Expression<int> id,
    Expression<int> colorIndex,
    Expression<String> body,
    Expression<String> title,
    Expression<DateTime> creationDate,
    Expression<bool> isImportant,
    Expression<bool> isArchived,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (colorIndex != null) 'color_index': colorIndex,
      if (body != null) 'body': body,
      if (title != null) 'title': title,
      if (creationDate != null) 'creation_date': creationDate,
      if (isImportant != null) 'is_important': isImportant,
      if (isArchived != null) 'is_archived': isArchived,
    });
  }

  NotesCompanion copyWith(
      {Value<int> id,
      Value<int> colorIndex,
      Value<String> body,
      Value<String> title,
      Value<DateTime> creationDate,
      Value<bool> isImportant,
      Value<bool> isArchived}) {
    return NotesCompanion(
      id: id ?? this.id,
      colorIndex: colorIndex ?? this.colorIndex,
      body: body ?? this.body,
      title: title ?? this.title,
      creationDate: creationDate ?? this.creationDate,
      isImportant: isImportant ?? this.isImportant,
      isArchived: isArchived ?? this.isArchived,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (colorIndex.present) {
      map['color_index'] = Variable<int>(colorIndex.value);
    }
    if (body.present) {
      map['body'] = Variable<String>(body.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (creationDate.present) {
      map['creation_date'] = Variable<DateTime>(creationDate.value);
    }
    if (isImportant.present) {
      map['is_important'] = Variable<bool>(isImportant.value);
    }
    if (isArchived.present) {
      map['is_archived'] = Variable<bool>(isArchived.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('NotesCompanion(')
          ..write('id: $id, ')
          ..write('colorIndex: $colorIndex, ')
          ..write('body: $body, ')
          ..write('title: $title, ')
          ..write('creationDate: $creationDate, ')
          ..write('isImportant: $isImportant, ')
          ..write('isArchived: $isArchived')
          ..write(')'))
        .toString();
  }
}

class $NotesTable extends Notes with TableInfo<$NotesTable, Note> {
  final GeneratedDatabase _db;
  final String _alias;
  $NotesTable(this._db, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  GeneratedIntColumn _id;
  @override
  GeneratedIntColumn get id => _id ??= _constructId();
  GeneratedIntColumn _constructId() {
    return GeneratedIntColumn('id', $tableName, false,
        hasAutoIncrement: true, declaredAsPrimaryKey: true);
  }

  final VerificationMeta _colorIndexMeta = const VerificationMeta('colorIndex');
  GeneratedIntColumn _colorIndex;
  @override
  GeneratedIntColumn get colorIndex => _colorIndex ??= _constructColorIndex();
  GeneratedIntColumn _constructColorIndex() {
    return GeneratedIntColumn(
      'color_index',
      $tableName,
      false,
    );
  }

  final VerificationMeta _bodyMeta = const VerificationMeta('body');
  GeneratedTextColumn _body;
  @override
  GeneratedTextColumn get body => _body ??= _constructBody();
  GeneratedTextColumn _constructBody() {
    return GeneratedTextColumn(
      'body',
      $tableName,
      true,
    );
  }

  final VerificationMeta _titleMeta = const VerificationMeta('title');
  GeneratedTextColumn _title;
  @override
  GeneratedTextColumn get title => _title ??= _constructTitle();
  GeneratedTextColumn _constructTitle() {
    return GeneratedTextColumn(
      'title',
      $tableName,
      true,
    );
  }

  final VerificationMeta _creationDateMeta =
      const VerificationMeta('creationDate');
  GeneratedDateTimeColumn _creationDate;
  @override
  GeneratedDateTimeColumn get creationDate =>
      _creationDate ??= _constructCreationDate();
  GeneratedDateTimeColumn _constructCreationDate() {
    return GeneratedDateTimeColumn(
      'creation_date',
      $tableName,
      false,
    );
  }

  final VerificationMeta _isImportantMeta =
      const VerificationMeta('isImportant');
  GeneratedBoolColumn _isImportant;
  @override
  GeneratedBoolColumn get isImportant =>
      _isImportant ??= _constructIsImportant();
  GeneratedBoolColumn _constructIsImportant() {
    return GeneratedBoolColumn(
      'is_important',
      $tableName,
      false,
    );
  }

  final VerificationMeta _isArchivedMeta = const VerificationMeta('isArchived');
  GeneratedBoolColumn _isArchived;
  @override
  GeneratedBoolColumn get isArchived => _isArchived ??= _constructIsArchived();
  GeneratedBoolColumn _constructIsArchived() {
    return GeneratedBoolColumn(
      'is_archived',
      $tableName,
      false,
    );
  }

  @override
  List<GeneratedColumn> get $columns =>
      [id, colorIndex, body, title, creationDate, isImportant, isArchived];
  @override
  $NotesTable get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'notes';
  @override
  final String actualTableName = 'notes';
  @override
  VerificationContext validateIntegrity(Insertable<Note> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id'], _idMeta));
    }
    if (data.containsKey('color_index')) {
      context.handle(
          _colorIndexMeta,
          colorIndex.isAcceptableOrUnknown(
              data['color_index'], _colorIndexMeta));
    } else if (isInserting) {
      context.missing(_colorIndexMeta);
    }
    if (data.containsKey('body')) {
      context.handle(
          _bodyMeta, body.isAcceptableOrUnknown(data['body'], _bodyMeta));
    }
    if (data.containsKey('title')) {
      context.handle(
          _titleMeta, title.isAcceptableOrUnknown(data['title'], _titleMeta));
    }
    if (data.containsKey('creation_date')) {
      context.handle(
          _creationDateMeta,
          creationDate.isAcceptableOrUnknown(
              data['creation_date'], _creationDateMeta));
    } else if (isInserting) {
      context.missing(_creationDateMeta);
    }
    if (data.containsKey('is_important')) {
      context.handle(
          _isImportantMeta,
          isImportant.isAcceptableOrUnknown(
              data['is_important'], _isImportantMeta));
    } else if (isInserting) {
      context.missing(_isImportantMeta);
    }
    if (data.containsKey('is_archived')) {
      context.handle(
          _isArchivedMeta,
          isArchived.isAcceptableOrUnknown(
              data['is_archived'], _isArchivedMeta));
    } else if (isInserting) {
      context.missing(_isArchivedMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Note map(Map<String, dynamic> data, {String tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : null;
    return Note.fromData(data, _db, prefix: effectivePrefix);
  }

  @override
  $NotesTable createAlias(String alias) {
    return $NotesTable(_db, alias);
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(SqlTypeSystem.defaultInstance, e);
  $NotesTable _notes;
  $NotesTable get notes => _notes ??= $NotesTable(this);
  @override
  Iterable<TableInfo> get allTables => allSchemaEntities.whereType<TableInfo>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [notes];
}
