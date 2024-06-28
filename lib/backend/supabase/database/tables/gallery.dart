import '../database.dart';

class GalleryTable extends SupabaseTable<GalleryRow> {
  @override
  String get tableName => 'Gallery';

  @override
  GalleryRow createRow(Map<String, dynamic> data) => GalleryRow(data);
}

class GalleryRow extends SupabaseDataRow {
  GalleryRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => GalleryTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  String? get imageURL => getField<String>('imageURL');
  set imageURL(String? value) => setField<String>('imageURL', value);
}
