import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/user/appbar/appbar_widget.dart';
import '/user/news_component/news_component_widget.dart';
import 'news_feed_widget.dart' show NewsFeedWidget;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class NewsFeedModel extends FlutterFlowModel<NewsFeedWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for APPBAR component.
  late AppbarModel appbarModel;
  // Models for NewsComponent dynamic component.
  late FlutterFlowDynamicModels<NewsComponentModel> newsComponentModels;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    appbarModel = createModel(context, () => AppbarModel());
    newsComponentModels = FlutterFlowDynamicModels(() => NewsComponentModel());
  }

  void dispose() {
    unfocusNode.dispose();
    appbarModel.dispose();
    newsComponentModels.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
