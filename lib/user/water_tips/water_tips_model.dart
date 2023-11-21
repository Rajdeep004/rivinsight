import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/user/appbar/appbar_widget.dart';
import '/user/water_conserv/water_conserv_widget.dart';
import 'water_tips_widget.dart' show WaterTipsWidget;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class WaterTipsModel extends FlutterFlowModel<WaterTipsWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for APPBAR component.
  late AppbarModel appbarModel;
  // Models for WaterConserv dynamic component.
  late FlutterFlowDynamicModels<WaterConservModel> waterConservModels;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    appbarModel = createModel(context, () => AppbarModel());
    waterConservModels = FlutterFlowDynamicModels(() => WaterConservModel());
  }

  void dispose() {
    unfocusNode.dispose();
    appbarModel.dispose();
    waterConservModels.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
