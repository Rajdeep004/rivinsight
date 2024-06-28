import '../database.dart';

class TnCTable extends SupabaseTable<TnCRow> {
  @override
  String get tableName => 'TnC';

  @override
  TnCRow createRow(Map<String, dynamic> data) => TnCRow(data);
}

class TnCRow extends SupabaseDataRow {
  TnCRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => TnCTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  String? get title => getField<String>('title');
  set title(String? value) => setField<String>('title', value);

  String? get description => getField<String>('description');
  set description(String? value) => setField<String>('description', value);
}
