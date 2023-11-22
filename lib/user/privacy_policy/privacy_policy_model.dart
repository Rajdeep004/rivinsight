import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/user/appbar/appbar_widget.dart';
import '/user/privacy_p_olicy/privacy_p_olicy_widget.dart';
import 'privacy_policy_widget.dart' show PrivacyPolicyWidget;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class PrivacyPolicyModel extends FlutterFlowModel<PrivacyPolicyWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for APPBAR component.
  late AppbarModel appbarModel;
  // Model for PrivacyPOlicy component.
  late PrivacyPOlicyModel privacyPOlicyModel;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    appbarModel = createModel(context, () => AppbarModel());
    privacyPOlicyModel = createModel(context, () => PrivacyPOlicyModel());
  }

  void dispose() {
    unfocusNode.dispose();
    appbarModel.dispose();
    privacyPOlicyModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
