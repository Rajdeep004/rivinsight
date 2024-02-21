import '../database.dart';

class TourismTable extends SupabaseTable<TourismRow> {
  @override
  String get tableName => 'tourism';

  @override
  TourismRow createRow(Map<String, dynamic> data) => TourismRow(data);
}

class TourismRow extends SupabaseDataRow {
  TourismRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => TourismTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  String? get title => getField<String>('title');
  set title(String? value) => setField<String>('title', value);

  String? get description => getField<String>('description');
  set description(String? value) => setField<String>('description', value);

  String? get imageURL => getField<String>('imageURL');
  set imageURL(String? value) => setField<String>('imageURL', value);

  String? get address => getField<String>('address');
  set address(String? value) => setField<String>('address', value);

  String? get timing => getField<String>('timing');
  set timing(String? value) => setField<String>('timing', value);

  String? get moreInfo => getField<String>('moreInfo');
  set moreInfo(String? value) => setField<String>('moreInfo', value);
}
