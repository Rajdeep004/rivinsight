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
import 'tn_s_page_model.dart';
export 'tn_s_page_model.dart';

class TnSPageWidget extends StatefulWidget {
  const TnSPageWidget({super.key});

  @override
  State<TnSPageWidget> createState() => _TnSPageWidgetState();
}

class _TnSPageWidgetState extends State<TnSPageWidget> {
  late TnSPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => TnSPageModel());
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
              padding: EdgeInsetsDirectional.fromSTEB(0.0, 90.0, 0.0, 60.0),
              child: FutureBuilder<List<TnCRow>>(
                future: TnCTable().queryRows(
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
                  List<TnCRow> listViewTnCRowList = snapshot.data!;
                  return ListView.builder(
                    padding: EdgeInsets.zero,
                    scrollDirection: Axis.vertical,
                    itemCount: listViewTnCRowList.length,
                    itemBuilder: (context, listViewIndex) {
                      final listViewTnCRow = listViewTnCRowList[listViewIndex];
                      return Padding(
                        padding: EdgeInsets.all(15.0),
                        child: Container(
                          width: double.infinity,
                          height: 220.0,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Align(
                                alignment: AlignmentDirectional(-1.0, 0.0),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      20.0, 10.0, 10.0, 0.0),
                                  child: Text(
                                    listViewTnCRow.title!,
                                    style:
                                        FlutterFlowTheme.of(context).titleLarge,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    20.0, 10.0, 10.0, 10.0),
                                child: Text(
                                  listViewTnCRow.description!,
                                  style: FlutterFlowTheme.of(context).bodyLarge,
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
