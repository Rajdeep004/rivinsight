import '../database.dart';

class NewsTable extends SupabaseTable<NewsRow> {
  @override
  String get tableName => 'news';

  @override
  NewsRow createRow(Map<String, dynamic> data) => NewsRow(data);
}

class NewsRow extends SupabaseDataRow {
  NewsRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => NewsTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  String? get title => getField<String>('title');
  set title(String? value) => setField<String>('title', value);

  String? get description => getField<String>('description');
  set description(String? value) => setField<String>('description', value);

  String? get imageURL => getField<String>('imageURL');
  set imageURL(String? value) => setField<String>('imageURL', value);

  String? get author => getField<String>('author');
  set author(String? value) => setField<String>('author', value);
}
