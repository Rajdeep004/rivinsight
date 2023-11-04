import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class RiversRecord extends FirestoreRecord {
  RiversRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  bool hasName() => _name != null;

  // "description" field.
  String? _description;
  String get description => _description ?? '';
  bool hasDescription() => _description != null;

  // "video" field.
  String? _video;
  String get video => _video ?? '';
  bool hasVideo() => _video != null;

  // "photo" field.
  String? _photo;
  String get photo => _photo ?? '';
  bool hasPhoto() => _photo != null;

  void _initializeFields() {
    _name = snapshotData['name'] as String?;
    _description = snapshotData['description'] as String?;
    _video = snapshotData['video'] as String?;
    _photo = snapshotData['photo'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('Rivers');

  static Stream<RiversRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => RiversRecord.fromSnapshot(s));

  static Future<RiversRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => RiversRecord.fromSnapshot(s));

  static RiversRecord fromSnapshot(DocumentSnapshot snapshot) => RiversRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static RiversRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      RiversRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'RiversRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is RiversRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createRiversRecordData({
  String? name,
  String? description,
  String? video,
  String? photo,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'name': name,
      'description': description,
      'video': video,
      'photo': photo,
    }.withoutNulls,
  );

  return firestoreData;
}

class RiversRecordDocumentEquality implements Equality<RiversRecord> {
  const RiversRecordDocumentEquality();

  @override
  bool equals(RiversRecord? e1, RiversRecord? e2) {
    return e1?.name == e2?.name &&
        e1?.description == e2?.description &&
        e1?.video == e2?.video &&
        e1?.photo == e2?.photo;
  }

  @override
  int hash(RiversRecord? e) =>
      const ListEquality().hash([e?.name, e?.description, e?.video, e?.photo]);

  @override
  bool isValidKey(Object? o) => o is RiversRecord;
}
