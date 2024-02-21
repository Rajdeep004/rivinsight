import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/user/app_bar/app_bar_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'land_use_page_model.dart';
export 'land_use_page_model.dart';

class LandUsePageWidget extends StatefulWidget {
  const LandUsePageWidget({super.key});

  @override
  State<LandUsePageWidget> createState() => _LandUsePageWidgetState();
}

class _LandUsePageWidgetState extends State<LandUsePageWidget> {
  late LandUsePageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => LandUsePageModel());
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
            SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 90.0, 0.0, 60.0),
                    child: FutureBuilder<List<LandUseCompreshionRow>>(
                      future: LandUseCompreshionTable().queryRows(
                        queryFn: (q) => q.order('id', ascending: true),
                      ),
                      builder: (context, snapshot) {
                        // Customize what your widget looks like when it's loading.
                        if (!snapshot.hasData) {
                          return Center(
                            child: SizedBox(
                              width: 50.0,
                              height: 50.0,
                              child: SpinKitRipple(
                                color: FlutterFlowTheme.of(context).primary,
                                size: 50.0,
                              ),
                            ),
                          );
                        }
                        List<LandUseCompreshionRow>
                            compreLandUseCompreshionRowList = snapshot.data!;
                        return SingleChildScrollView(
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: List.generate(
                                compreLandUseCompreshionRowList.length,
                                (compreIndex) {
                              final compreLandUseCompreshionRow =
                                  compreLandUseCompreshionRowList[compreIndex];
                              return Padding(
                                padding: EdgeInsets.all(15.0),
                                child: Container(
                                  width: double.infinity,
                                  height: 451.0,
                                  decoration: BoxDecoration(
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                  ),
                                  child: SingleChildScrollView(
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Align(
                                          alignment:
                                              AlignmentDirectional(-1.0, 0.0),
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    20.0, 10.0, 10.0, 0.0),
                                            child: Text(
                                              compreLandUseCompreshionRow
                                                  .title!,
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .titleLarge,
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  20.0, 10.0, 10.0, 10.0),
                                          child: Text(
                                            compreLandUseCompreshionRow
                                                .description!,
                                            style: FlutterFlowTheme.of(context)
                                                .bodyLarge,
                                          ),
                                        ),
                                        if (compreLandUseCompreshionRow
                                                .imageURL !=
                                            '\"\"')
                                          ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                            child: Image.network(
                                              compreLandUseCompreshionRow
                                                  .imageURL!,
                                              width: 300.0,
                                              height: 200.0,
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            }),
                          ),
                        );
                      },
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 90.0, 0.0, 60.0),
                    child: FutureBuilder<List<LandUseImpactRow>>(
                      future: LandUseImpactTable().queryRows(
                        queryFn: (q) => q,
                      ),
                      builder: (context, snapshot) {
                        // Customize what your widget looks like when it's loading.
                        if (!snapshot.hasData) {
                          return Center(
                            child: SizedBox(
                              width: 50.0,
                              height: 50.0,
                              child: SpinKitRipple(
                                color: FlutterFlowTheme.of(context).primary,
                                size: 50.0,
                              ),
                            ),
                          );
                        }
                        List<LandUseImpactRow> impactLandUseImpactRowList =
                            snapshot.data!;
                        return SingleChildScrollView(
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children:
                                List.generate(impactLandUseImpactRowList.length,
                                    (impactIndex) {
                              final impactLandUseImpactRow =
                                  impactLandUseImpactRowList[impactIndex];
                              return Padding(
                                padding: EdgeInsets.all(15.0),
                                child: Container(
                                  width: double.infinity,
                                  height: 220.0,
                                  decoration: BoxDecoration(
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                  ),
                                  child: SingleChildScrollView(
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Align(
                                          alignment:
                                              AlignmentDirectional(-1.0, 0.0),
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    20.0, 10.0, 10.0, 0.0),
                                            child: Text(
                                              impactLandUseImpactRow.title!,
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .titleLarge,
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  20.0, 10.0, 10.0, 10.0),
                                          child: Text(
                                            impactLandUseImpactRow.description!,
                                            style: FlutterFlowTheme.of(context)
                                                .bodyLarge,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            }),
                          ),
                        );
                      },
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 90.0, 0.0, 60.0),
                    child: FutureBuilder<List<LandUseDataRow>>(
                      future: LandUseDataTable().queryRows(
                        queryFn: (q) => q.order('id', ascending: true),
                      ),
                      builder: (context, snapshot) {
                        // Customize what your widget looks like when it's loading.
                        if (!snapshot.hasData) {
                          return Center(
                            child: SizedBox(
                              width: 50.0,
                              height: 50.0,
                              child: SpinKitRipple(
                                color: FlutterFlowTheme.of(context).primary,
                                size: 50.0,
                              ),
                            ),
                          );
                        }
                        List<LandUseDataRow> dataLandUseDataRowList =
                            snapshot.data!;
                        return SingleChildScrollView(
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: List.generate(
                                dataLandUseDataRowList.length, (dataIndex) {
                              final dataLandUseDataRow =
                                  dataLandUseDataRowList[dataIndex];
                              return Padding(
                                padding: EdgeInsets.all(15.0),
                                child: Container(
                                  width: double.infinity,
                                  height: 421.0,
                                  decoration: BoxDecoration(
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                  ),
                                  child: SingleChildScrollView(
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Align(
                                          alignment:
                                              AlignmentDirectional(-1.0, 0.0),
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    20.0, 10.0, 10.0, 0.0),
                                            child: Text(
                                              dataLandUseDataRow.title!,
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .titleLarge,
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  20.0, 10.0, 10.0, 10.0),
                                          child: Text(
                                            dataLandUseDataRow.description!,
                                            style: FlutterFlowTheme.of(context)
                                                .bodyLarge,
                                          ),
                                        ),
                                        if (dataLandUseDataRow.imageURL !=
                                            '\"\"')
                                          ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                            child: Image.network(
                                              dataLandUseDataRow.imageURL!,
                                              width: 300.0,
                                              height: 200.0,
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            }),
                          ),
                        );
                      },
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
