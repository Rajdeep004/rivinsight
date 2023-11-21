import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/user/appbar/appbar_widget.dart';
import '/user/news/news_widget.dart';
import 'community_widget.dart' show CommunityWidget;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class CommunityModel extends FlutterFlowModel<CommunityWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for news component.
  late NewsModel newsModel1;
  // Model for news component.
  late NewsModel newsModel2;
  // Model for news component.
  late NewsModel newsModel3;
  // Model for news component.
  late NewsModel newsModel4;
  // Model for news component.
  late NewsModel newsModel5;
  // Model for news component.
  late NewsModel newsModel6;
  // Model for news component.
  late NewsModel newsModel7;
  // Model for news component.
  late NewsModel newsModel8;
  // Model for APPBAR component.
  late AppbarModel appbarModel;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    newsModel1 = createModel(context, () => NewsModel());
    newsModel2 = createModel(context, () => NewsModel());
    newsModel3 = createModel(context, () => NewsModel());
    newsModel4 = createModel(context, () => NewsModel());
    newsModel5 = createModel(context, () => NewsModel());
    newsModel6 = createModel(context, () => NewsModel());
    newsModel7 = createModel(context, () => NewsModel());
    newsModel8 = createModel(context, () => NewsModel());
    appbarModel = createModel(context, () => AppbarModel());
  }

  void dispose() {
    unfocusNode.dispose();
    newsModel1.dispose();
    newsModel2.dispose();
    newsModel3.dispose();
    newsModel4.dispose();
    newsModel5.dispose();
    newsModel6.dispose();
    newsModel7.dispose();
    newsModel8.dispose();
    appbarModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
