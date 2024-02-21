import '../database.dart';

class ClimateChangeTipsTable extends SupabaseTable<ClimateChangeTipsRow> {
  @override
  String get tableName => 'climateChangeTips';

  @override
  ClimateChangeTipsRow createRow(Map<String, dynamic> data) =>
      ClimateChangeTipsRow(data);
}

class ClimateChangeTipsRow extends SupabaseDataRow {
  ClimateChangeTipsRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => ClimateChangeTipsTable();

  int get id => getField<int>('id ')!;
  set id(int value) => setField<int>('id ', value);

  String? get title => getField<String>('title');
  set title(String? value) => setField<String>('title', value);

  String? get description1 => getField<String>('description 1');
  set description1(String? value) => setField<String>('description 1', value);

  String? get imageURL1 => getField<String>('imageURL1');
  set imageURL1(String? value) => setField<String>('imageURL1', value);

  String? get imageCaption1 => getField<String>('imageCaption1');
  set imageCaption1(String? value) => setField<String>('imageCaption1', value);

  String? get description2 => getField<String>('description2');
  set description2(String? value) => setField<String>('description2', value);

  String? get imageURL2 => getField<String>('imageURL2');
  set imageURL2(String? value) => setField<String>('imageURL2', value);

  String? get imageCaption2 => getField<String>('imageCaption2');
  set imageCaption2(String? value) => setField<String>('imageCaption2', value);
}
