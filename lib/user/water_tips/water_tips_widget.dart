import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/user/appbar/appbar_widget.dart';
import '/user/water_conserv/water_conserv_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'water_tips_model.dart';
export 'water_tips_model.dart';

class WaterTipsWidget extends StatefulWidget {
  const WaterTipsWidget({Key? key}) : super(key: key);

  @override
  _WaterTipsWidgetState createState() => _WaterTipsWidgetState();
}

class _WaterTipsWidgetState extends State<WaterTipsWidget>
    with TickerProviderStateMixin {
  late WaterTipsModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = {
    'textOnPageLoadAnimation': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: Offset(-100.0, 0.0),
          end: Offset(0.0, 0.0),
        ),
      ],
    ),
  };

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => WaterTipsModel());
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
        body: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            wrapWithModel(
              model: _model.appbarModel,
              updateCallback: () => setState(() {}),
              child: AppbarWidget(),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 0.0, 0.0),
              child: Text(
                FFLocalizations.of(context).getText(
                  'y0x5ytnr' /* Water Conservation Tips */,
                ),
                style: FlutterFlowTheme.of(context).headlineMedium.override(
                      fontFamily: 'Outfit',
                      fontWeight: FontWeight.bold,
                    ),
              ).animateOnPageLoad(animationsMap['textOnPageLoadAnimation']!),
            ),
            Container(
              width: double.infinity,
              height: 598.0,
              decoration: BoxDecoration(
                color: FlutterFlowTheme.of(context).secondaryBackground,
              ),
              child: FutureBuilder<List<WCtipsRow>>(
                future: WCtipsTable().queryRows(
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
                  List<WCtipsRow> listViewWCtipsRowList = snapshot.data!;
                  return ListView.builder(
                    padding: EdgeInsets.zero,
                    scrollDirection: Axis.vertical,
                    itemCount: listViewWCtipsRowList.length,
                    itemBuilder: (context, listViewIndex) {
                      final listViewWCtipsRow =
                          listViewWCtipsRowList[listViewIndex];
                      return Container(
                        height: 378.0,
                        decoration: BoxDecoration(),
                        child: wrapWithModel(
                          model: _model.waterConservModels.getModel(
                            listViewWCtipsRow.id.toString(),
                            listViewIndex,
                          ),
                          updateCallback: () => setState(() {}),
                          child: WaterConservWidget(
                            key: Key(
                              'Keyy3o_${listViewWCtipsRow.id.toString()}',
                            ),
                            content: listViewWCtipsRow.content!,
                            image: listViewWCtipsRow.image!,
                            id: listViewWCtipsRow.id,
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
