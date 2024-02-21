import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/user/app_bar/app_bar_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'history_details_model.dart';
export 'history_details_model.dart';

class HistoryDetailsWidget extends StatefulWidget {
  const HistoryDetailsWidget({super.key});

  @override
  State<HistoryDetailsWidget> createState() => _HistoryDetailsWidgetState();
}

class _HistoryDetailsWidgetState extends State<HistoryDetailsWidget> {
  late HistoryDetailsModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => HistoryDetailsModel());
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (isiOS) {
      SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(
          statusBarBrightness: Theme.of(context).brightness,
          systemStatusBarContrastEnforced: true,
        ),
      );
    }

    return GestureDetector(
      onTap: () => _model.unfocusNode.canRequestFocus
          ? FocusScope.of(context).requestFocus(_model.unfocusNode)
          : FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        body: Stack(
          children: [
            wrapWithModel(
              model: _model.appBarModel,
              updateCallback: () => setState(() {}),
              child: AppBarWidget(),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(5.0, 90.0, 5.0, 60.0),
              child: ListView(
                padding: EdgeInsets.zero,
                scrollDirection: Axis.vertical,
                children: [
                  Align(
                    alignment: AlignmentDirectional(-1.0, 0.0),
                    child: Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(15.0, 20.0, 0.0, 0.0),
                      child: Text(
                        FFLocalizations.of(context).getText(
                          'nchnm27c' /* History Of River */,
                        ),
                        style: FlutterFlowTheme.of(context).titleLarge,
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(15.0, 15.0, 15.0, 0.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8.0),
                      child: Image.asset(
                        'assets/images/Lithograph_by_Dutchman_Philip_Baldeus_depicting_Ahmedabad_and_Sabarmati_river_circa_1752.jpg',
                        width: 300.0,
                        height: 200.0,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(20.0, 15.0, 25.0, 0.0),
                    child: Text(
                      FFLocalizations.of(context).getText(
                        '88hwn89q' /* Rajashekhara's Kavya-mimamsa (... */,
                      ),
                      style: FlutterFlowTheme.of(context).bodyMedium,
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(15.0, 10.0, 15.0, 0.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8.0),
                      child: Image.asset(
                        'assets/images/Sabarmati_River_Ahmedabad_India_1890.jpg',
                        width: 300.0,
                        height: 200.0,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(20.0, 15.0, 25.0, 0.0),
                    child: Text(
                      FFLocalizations.of(context).getText(
                        '78upjfhd' /* Significance in Hinduism
In Ra... */
                        ,
                      ),
                      style: FlutterFlowTheme.of(context).bodyMedium,
                    ),
                  ),
                  InkWell(
                    splashColor: Colors.transparent,
                    focusColor: Colors.transparent,
                    hoverColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onTap: () async {
                      context.pushNamed('HomePage');
                    },
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Icon(
                          Icons.chevron_left_rounded,
                          color: FlutterFlowTheme.of(context).secondaryText,
                          size: 18.0,
                        ),
                        Text(
                          FFLocalizations.of(context).getText(
                            '1a9hgp7l' /* Back to home page */,
                          ),
                          style: FlutterFlowTheme.of(context).bodySmall,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
