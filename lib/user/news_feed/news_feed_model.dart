import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/user/app_bar/app_bar_widget.dart';
import '/user/news_component/news_component_widget.dart';
import 'dart:async';
import 'news_feed_widget.dart' show NewsFeedWidget;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class NewsFeedModel extends FlutterFlowModel<NewsFeedWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  bool requestCompleted = false;
  String? requestLastUniqueKey;
  // Model for AppBar component.
  late AppBarModel appBarModel;
  // Models for NewsComponent dynamic component.
  late FlutterFlowDynamicModels<NewsComponentModel> newsComponentModels;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {
    appBarModel = createModel(context, () => AppBarModel());
    newsComponentModels = FlutterFlowDynamicModels(() => NewsComponentModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    appBarModel.dispose();
    newsComponentModels.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.

  Future waitForRequestCompleted({
    double minWait = 0,
    double maxWait = double.infinity,
  }) async {
    final stopwatch = Stopwatch()..start();
    while (true) {
      await Future.delayed(Duration(milliseconds: 50));
      final timeElapsed = stopwatch.elapsedMilliseconds;
      final requestComplete = requestCompleted;
      if (timeElapsed > maxWait || (requestComplete && timeElapsed > minWait)) {
        break;
      }
    }
  }
}
