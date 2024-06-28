import '../database.dart';

class LandUseCompreshionTable extends SupabaseTable<LandUseCompreshionRow> {
  @override
  String get tableName => 'landUseCompreshion';

  @override
  LandUseCompreshionRow createRow(Map<String, dynamic> data) =>
      LandUseCompreshionRow(data);
}

class LandUseCompreshionRow extends SupabaseDataRow {
  LandUseCompreshionRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => LandUseCompreshionTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  String? get title => getField<String>('title');
  set title(String? value) => setField<String>('title', value);

  String? get description => getField<String>('description');
  set description(String? value) => setField<String>('description', value);

  String? get imageURL => getField<String>('imageURL');
  set imageURL(String? value) => setField<String>('imageURL', value);
}
