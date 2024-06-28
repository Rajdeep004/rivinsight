import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'tn_s_compo_model.dart';
export 'tn_s_compo_model.dart';

class TnSCompoWidget extends StatefulWidget {
  const TnSCompoWidget({super.key});

  @override
  State<TnSCompoWidget> createState() => _TnSCompoWidgetState();
}

class _TnSCompoWidgetState extends State<TnSCompoWidget> {
  late TnSCompoModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => TnSCompoModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(15.0),
      child: Container(
        width: double.infinity,
        height: 220.0,
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).secondaryBackground,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Align(
              alignment: AlignmentDirectional(-1.0, 0.0),
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(20.0, 10.0, 10.0, 0.0),
                child: Text(
                  FFLocalizations.of(context).getText(
                    'jimzmjmn' /* "Effect of climate on Sabarmat... */,
                  ),
                  style: FlutterFlowTheme.of(context).titleLarge,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(20.0, 10.0, 10.0, 10.0),
              child: Text(
                FFLocalizations.of(context).getText(
                  'mx9ucea6' /* "It originates in the Aravalli... */,
                ),
                style: FlutterFlowTheme.of(context).bodyLarge,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
