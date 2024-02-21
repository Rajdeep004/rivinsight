import 'package:flutter/material.dart';
import 'flutter_flow/request_manager.dart';
import 'backend/api_requests/api_manager.dart';
import 'backend/supabase/supabase.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'flutter_flow/flutter_flow_util.dart';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {}

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  final _floodRiskManager = FutureRequestManager<List<RiversRow>>();
  Future<List<RiversRow>> floodRisk({
    String? uniqueQueryKey,
    bool? overrideCache,
    required Future<List<RiversRow>> Function() requestFn,
  }) =>
      _floodRiskManager.performRequest(
        uniqueQueryKey: uniqueQueryKey,
        overrideCache: overrideCache,
        requestFn: requestFn,
      );
  void clearFloodRiskCache() => _floodRiskManager.clear();
  void clearFloodRiskCacheKey(String? uniqueKey) =>
      _floodRiskManager.clearRequest(uniqueKey);

  final _newsCacheManager = FutureRequestManager<List<NewsRow>>();
  Future<List<NewsRow>> newsCache({
    String? uniqueQueryKey,
    bool? overrideCache,
    required Future<List<NewsRow>> Function() requestFn,
  }) =>
      _newsCacheManager.performRequest(
        uniqueQueryKey: uniqueQueryKey,
        overrideCache: overrideCache,
        requestFn: requestFn,
      );
  void clearNewsCacheCache() => _newsCacheManager.clear();
  void clearNewsCacheCacheKey(String? uniqueKey) =>
      _newsCacheManager.clearRequest(uniqueKey);
}
