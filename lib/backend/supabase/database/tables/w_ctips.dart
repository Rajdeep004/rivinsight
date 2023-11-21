import '../database.dart';

class WCtipsTable extends SupabaseTable<WCtipsRow> {
  @override
  String get tableName => 'WCtips';

  @override
  WCtipsRow createRow(Map<String, dynamic> data) => WCtipsRow(data);
}

class WCtipsRow extends SupabaseDataRow {
  WCtipsRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => WCtipsTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  String? get content => getField<String>('content');
  set content(String? value) => setField<String>('content', value);

  String? get image => getField<String>('image');
  set image(String? value) => setField<String>('image', value);
}
