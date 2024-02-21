import '../database.dart';

class LandUseDataTable extends SupabaseTable<LandUseDataRow> {
  @override
  String get tableName => 'landUseData';

  @override
  LandUseDataRow createRow(Map<String, dynamic> data) => LandUseDataRow(data);
}

class LandUseDataRow extends SupabaseDataRow {
  LandUseDataRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => LandUseDataTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  String? get title => getField<String>('title');
  set title(String? value) => setField<String>('title', value);

  String? get description => getField<String>('description');
  set description(String? value) => setField<String>('description', value);

  String? get imageURL => getField<String>('imageURL');
  set imageURL(String? value) => setField<String>('imageURL', value);
}
