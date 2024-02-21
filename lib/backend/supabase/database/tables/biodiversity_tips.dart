import '../database.dart';

class BiodiversityTipsTable extends SupabaseTable<BiodiversityTipsRow> {
  @override
  String get tableName => 'biodiversityTips';

  @override
  BiodiversityTipsRow createRow(Map<String, dynamic> data) =>
      BiodiversityTipsRow(data);
}

class BiodiversityTipsRow extends SupabaseDataRow {
  BiodiversityTipsRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => BiodiversityTipsTable();

  int get id => getField<int>('id ')!;
  set id(int value) => setField<int>('id ', value);

  String? get title => getField<String>('title');
  set title(String? value) => setField<String>('title', value);

  String? get description => getField<String>('description');
  set description(String? value) => setField<String>('description', value);

  String? get imageURL => getField<String>('imageURL');
  set imageURL(String? value) => setField<String>('imageURL', value);
}
