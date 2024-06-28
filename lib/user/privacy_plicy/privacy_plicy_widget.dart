import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'privacy_plicy_model.dart';
export 'privacy_plicy_model.dart';

class PrivacyPlicyWidget extends StatefulWidget {
  const PrivacyPlicyWidget({super.key});

  @override
  State<PrivacyPlicyWidget> createState() => _PrivacyPlicyWidgetState();
}

class _PrivacyPlicyWidgetState extends State<PrivacyPlicyWidget> {
  late PrivacyPlicyModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PrivacyPlicyModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).primaryBackground,
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Padding(
          padding: EdgeInsetsDirectional.fromSTEB(16.0, 12.0, 16.0, 12.0),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                FFLocalizations.of(context).getText(
                  '1lnjwgrv' /* Main Header */,
                ),
                style: FlutterFlowTheme.of(context).titleLarge,
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 4.0, 0.0, 0.0),
                child: Text(
                  FFLocalizations.of(context).getText(
                    '1zmoqkyc' /* I’ll be working on a few diffe... */,
                  ),
                  style: FlutterFlowTheme.of(context).labelMedium,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
