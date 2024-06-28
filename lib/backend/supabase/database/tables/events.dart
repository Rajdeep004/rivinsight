import '../database.dart';

class EventsTable extends SupabaseTable<EventsRow> {
  @override
  String get tableName => 'events';

  @override
  EventsRow createRow(Map<String, dynamic> data) => EventsRow(data);
}

class EventsRow extends SupabaseDataRow {
  EventsRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => EventsTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  String? get title => getField<String>('title');
  set title(String? value) => setField<String>('title', value);

  String? get description => getField<String>('description');
  set description(String? value) => setField<String>('description', value);

  String? get imgURL => getField<String>('img URL');
  set imgURL(String? value) => setField<String>('img URL', value);

  String? get address => getField<String>('Address');
  set address(String? value) => setField<String>('Address', value);

  String? get timing => getField<String>('Timing');
  set timing(String? value) => setField<String>('Timing', value);

  String? get dates => getField<String>('Dates');
  set dates(String? value) => setField<String>('Dates', value);
}
