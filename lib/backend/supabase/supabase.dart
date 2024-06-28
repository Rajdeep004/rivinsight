import 'package:supabase_flutter/supabase_flutter.dart' hide Provider;

export 'database/database.dart';

const _kSupabaseUrl = 'https://pjcucdfdlfjodwlwuxan.supabase.co';
const _kSupabaseAnonKey =
    'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InBqY3VjZGZkbGZqb2R3bHd1eGFuIiwicm9sZSI6ImFub24iLCJpYXQiOjE2OTkwMTg0OTksImV4cCI6MjAxNDU5NDQ5OX0.tySQTM0pfDju_-3n6j8-di5aJXthdQGuF-JCsWgdVJ4';

class SupaFlow {
  SupaFlow._();

  static SupaFlow? _instance;
  static SupaFlow get instance => _instance ??= SupaFlow._();

  final _supabase = Supabase.instance.client;
  static SupabaseClient get client => instance._supabase;

  static Future initialize() => Supabase.initialize(
        url: _kSupabaseUrl,
        anonKey: _kSupabaseAnonKey,
        debug: false,
      );
}
