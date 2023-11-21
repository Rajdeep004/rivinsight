import '../database.dart';

class RiversTable extends SupabaseTable<RiversRow> {
  @override
  String get tableName => 'Rivers';

  @override
  RiversRow createRow(Map<String, dynamic> data) => RiversRow(data);
}

class RiversRow extends SupabaseDataRow {
  RiversRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => RiversTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  String get name => getField<String>('name')!;
  set name(String value) => setField<String>('name', value);

  double get floodrisk => getField<double>('floodrisk')!;
  set floodrisk(double value) => setField<double>('floodrisk', value);
}
