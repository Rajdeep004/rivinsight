import 'dart:convert';
import 'dart:typed_data';

import '/flutter_flow/flutter_flow_util.dart';
import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

const _kPrivateApiFunctionName = 'ffPrivateApiCall';

class GetSabarmatiWeatherCall {
  static Future<ApiCallResponse> call() async {
    return ApiManager.instance.makeApiCall(
      callName: 'GetSabarmatiWeather',
      apiUrl: 'https://api.openweathermap.org/data/2.5/weather',
      callType: ApiCallType.GET,
      headers: {
        'Content-Length': 'application/json',
      },
      params: {
        'appid': "f7ed74e40629ac8cc1b555bb4eb4a727",
        'lat': "23.02368",
        'lon': "72.57665",
        'units': "metric",
        'timezone': "IST",
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: true,
      alwaysAllowBody: false,
    );
  }

  static String? weatherConditon(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.weather[:].main''',
      ));
  static double? mainTemp(dynamic response) => castToType<double>(getJsonField(
        response,
        r'''$.main.temp''',
      ));
  static int? humidity(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.main.humidity''',
      ));
  static int? pressure(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.main.pressure''',
      ));
  static double? minTemp(dynamic response) => castToType<double>(getJsonField(
        response,
        r'''$.main.temp_min''',
      ));
  static double? maxTemp(dynamic response) => castToType<double>(getJsonField(
        response,
        r'''$.main.temp_max''',
      ));
  static double? feellikeTemp(dynamic response) =>
      castToType<double>(getJsonField(
        response,
        r'''$.main.feels_like''',
      ));
  static String? weatherIcon(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.weather[:].icon''',
      ));
  static int? windSpeed(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.wind.speed''',
      ));
}

class ApiPagingParams {
  int nextPageNumber = 0;
  int numItems = 0;
  dynamic lastResponse;

  ApiPagingParams({
    required this.nextPageNumber,
    required this.numItems,
    required this.lastResponse,
  });

  @override
  String toString() =>
      'PagingParams(nextPageNumber: $nextPageNumber, numItems: $numItems, lastResponse: $lastResponse,)';
}

String _serializeList(List? list) {
  list ??= <String>[];
  try {
    return json.encode(list);
  } catch (_) {
    return '[]';
  }
}

String _serializeJson(dynamic jsonVar, [bool isList = false]) {
  jsonVar ??= (isList ? [] : {});
  try {
    return json.encode(jsonVar);
  } catch (_) {
    return isList ? '[]' : '{}';
  }
}
