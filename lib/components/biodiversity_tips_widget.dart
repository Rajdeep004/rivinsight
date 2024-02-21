import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'biodiversity_tips_model.dart';
export 'biodiversity_tips_model.dart';

class BiodiversityTipsWidget extends StatefulWidget {
  const BiodiversityTipsWidget({super.key});

  @override
  State<BiodiversityTipsWidget> createState() => _BiodiversityTipsWidgetState();
}

class _BiodiversityTipsWidgetState extends State<BiodiversityTipsWidget> {
  late BiodiversityTipsModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => BiodiversityTipsModel());
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
        height: 421.0,
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
                    'ym29kqpi' /* "Effect of climate on Sabarmat... */,
                  ),
                  style: FlutterFlowTheme.of(context).titleLarge,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(20.0, 10.0, 10.0, 10.0),
              child: Text(
                FFLocalizations.of(context).getText(
                  '630vewyi' /* "It originates in the Aravalli... */,
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
          ],
        ),
      ),
    );
  }
}
