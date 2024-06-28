import '../database.dart';

class LandUseImpactTable extends SupabaseTable<LandUseImpactRow> {
  @override
  String get tableName => 'landUseImpact';

  @override
  LandUseImpactRow createRow(Map<String, dynamic> data) =>
      LandUseImpactRow(data);
}

class LandUseImpactRow extends SupabaseDataRow {
  LandUseImpactRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => LandUseImpactTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  String? get title => getField<String>('title');
  set title(String? value) => setField<String>('title', value);

  String? get description => getField<String>('description');
  set description(String? value) => setField<String>('description', value);
}
