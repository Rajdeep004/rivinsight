import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'climate_compo_model.dart';
export 'climate_compo_model.dart';

class ClimateCompoWidget extends StatefulWidget {
  const ClimateCompoWidget({super.key});

  @override
  State<ClimateCompoWidget> createState() => _ClimateCompoWidgetState();
}

class _ClimateCompoWidgetState extends State<ClimateCompoWidget> {
  late ClimateCompoModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ClimateCompoModel());
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
        height: 719.0,
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).primaryBackground,
        ),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Align(
                alignment: AlignmentDirectional(-1.0, 0.0),
                child: Padding(
                  padding:
                      EdgeInsetsDirectional.fromSTEB(20.0, 10.0, 10.0, 0.0),
                  child: Text(
                    FFLocalizations.of(context).getText(
                      'nqrnic5l' /* "Effect of climate on Sabarmat... */,
                    ),
                    style: FlutterFlowTheme.of(context).titleLarge,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(20.0, 10.0, 10.0, 10.0),
                child: Text(
                  FFLocalizations.of(context).getText(
                    'nvbawtaa' /* "It originates in the Aravalli... */,
                  ),
                  style: FlutterFlowTheme.of(context).bodyLarge,
                ),
              ),
              ClipRRect(
                borderRadius: BorderRadius.circular(8.0),
                child: Image.network(
                  'https://picsum.photos/seed/819/600',
                  width: 300.0,
                  height: 200.0,
                  fit: BoxFit.cover,
                ),
              ),
              Align(
                alignment: AlignmentDirectional(0.0, 0.0),
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 5.0, 0.0, 0.0),
                  child: Text(
                    FFLocalizations.of(context).getText(
                      'xsuakaiy' /* caption */,
                    ),
                    style: FlutterFlowTheme.of(context).bodySmall,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(20.0, 10.0, 10.0, 10.0),
                child: Text(
                  FFLocalizations.of(context).getText(
                    'lfqmfykk' /* "It originates in the Aravalli... */,
                  ),
                  style: FlutterFlowTheme.of(context).bodyLarge,
                ),
              ),
              ClipRRect(
                borderRadius: BorderRadius.circular(8.0),
                child: Image.network(
                  'https://picsum.photos/seed/819/600',
                  width: 300.0,
                  height: 200.0,
                  fit: BoxFit.cover,
                ),
              ),
              Align(
                alignment: AlignmentDirectional(0.0, 0.0),
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 5.0, 0.0, 0.0),
                  child: Text(
                    FFLocalizations.of(context).getText(
                      '8syz9mm6' /* caption */,
                    ),
                    style: FlutterFlowTheme.of(context).bodySmall,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
