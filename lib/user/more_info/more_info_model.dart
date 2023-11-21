import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/user/appbar/appbar_widget.dart';
import '/user/biodiversity/biodiversity_widget.dart';
import 'more_info_widget.dart' show MoreInfoWidget;
import 'package:aligned_dialog/aligned_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:octo_image/octo_image.dart';
import 'package:provider/provider.dart';

class MoreInfoModel extends FlutterFlowModel<MoreInfoWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for APPBAR component.
  late AppbarModel appbarModel;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    appbarModel = createModel(context, () => AppbarModel());
  }

  void dispose() {
    unfocusNode.dispose();
    appbarModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
