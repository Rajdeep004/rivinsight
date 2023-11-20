import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/user/appbarnew/appbarnew_widget.dart';
import '/user/weatherinfo/weatherinfo_widget.dart';
import 'home_page_widget.dart' show HomePageWidget;
import 'package:aligned_dialog/aligned_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class HomePageModel extends FlutterFlowModel<HomePageWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for appbarnew component.
  late AppbarnewModel appbarnewModel;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    appbarnewModel = createModel(context, () => AppbarnewModel());
  }

  void dispose() {
    unfocusNode.dispose();
    appbarnewModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
