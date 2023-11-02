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

  // "Name" field.
  String? _name;
  String get name => _name ?? '';
  bool hasName() => _name != null;

  // "Description" field.
  String? _description;
  String get description => _description ?? '';
  bool hasDescription() => _description != null;

  // "Location" field.
  String? _location;
  String get location => _location ?? '';
  bool hasLocation() => _location != null;

  // "Video" field.
  String? _video;
  String get video => _video ?? '';
  bool hasVideo() => _video != null;

  void _initializeFields() {
    _name = snapshotData['Name'] as String?;
    _description = snapshotData['Description'] as String?;
    _location = snapshotData['Location'] as String?;
    _video = snapshotData['Video'] as String?;
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
  String? location,
  String? video,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'Name': name,
      'Description': description,
      'Location': location,
      'Video': video,
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
        e1?.location == e2?.location &&
        e1?.video == e2?.video;
  }

  @override
  int hash(RiversRecord? e) => const ListEquality()
      .hash([e?.name, e?.description, e?.location, e?.video]);

  @override
  bool isValidKey(Object? o) => o is RiversRecord;
}
