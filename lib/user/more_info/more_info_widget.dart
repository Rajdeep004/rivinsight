import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/user/app_bar/app_bar_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'more_info_model.dart';
export 'more_info_model.dart';

class MoreInfoWidget extends StatefulWidget {
  const MoreInfoWidget({super.key});

  @override
  State<MoreInfoWidget> createState() => _MoreInfoWidgetState();
}

class _MoreInfoWidgetState extends State<MoreInfoWidget> {
  late MoreInfoModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => MoreInfoModel());
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
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0.0, 90.0, 0.0, 60.0),
              child: ListView(
                padding: EdgeInsets.zero,
                scrollDirection: Axis.vertical,
                children: [
                  SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Align(
                          alignment: AlignmentDirectional(0.0, 0.0),
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                10.0, 10.0, 10.0, 0.0),
                            child: Container(
                              width: MediaQuery.sizeOf(context).width * 0.9,
                              height: 142.0,
                              decoration: BoxDecoration(
                                color:
                                    FlutterFlowTheme.of(context).primaryBtnText,
                                borderRadius: BorderRadius.circular(10.0),
                                border: Border.all(
                                  color: Color(0xA6000000),
                                  width: 1.0,
                                ),
                              ),
                              child: Stack(
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(8.0),
                                    child: Image.network(
                                      'https://images.unsplash.com/photo-1615529328331-f8917597711f?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3w0NTYyMDF8MHwxfHNlYXJjaHw0fHx3YXRlcnxlbnwwfHx8fDE3MDA1NDU1ODB8MA&ixlib=rb-4.0.3&q=80&w=1080',
                                      width: double.infinity,
                                      height: 200.0,
                                      fit: BoxFit.fitWidth,
                                      alignment: Alignment(0.0, -1.0),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        10.0, 0.0, 10.0, 0.0),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Align(
                                          alignment:
                                              AlignmentDirectional(-1.0, 0.0),
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 5.0, 0.0, 0.0),
                                            child: Text(
                                              FFLocalizations.of(context)
                                                  .getText(
                                                'ymgrpmok' /* Water Management */,
                                              ),
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .titleLarge
                                                      .override(
                                                        fontFamily: 'Outfit',
                                                        fontSize: 18.0,
                                                      ),
                                            ),
                                          ),
                                        ),
                                        Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Align(
                                              alignment: AlignmentDirectional(
                                                  0.0, 0.0),
                                              child: Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 5.0, 0.0, 0.0),
                                                child: Container(
                                                  width:
                                                      MediaQuery.sizeOf(context)
                                                              .width *
                                                          0.45,
                                                  height: 20.0,
                                                  decoration: BoxDecoration(
                                                    gradient: LinearGradient(
                                                      colors: [
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .primary,
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .primaryText
                                                      ],
                                                      stops: [0.0, 1.0],
                                                      begin:
                                                          AlignmentDirectional(
                                                              0.0, -1.0),
                                                      end: AlignmentDirectional(
                                                          0, 1.0),
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.only(
                                                      bottomLeft:
                                                          Radius.circular(15.0),
                                                      bottomRight:
                                                          Radius.circular(55.0),
                                                      topLeft:
                                                          Radius.circular(15.0),
                                                      topRight:
                                                          Radius.circular(55.0),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Align(
                                              alignment: AlignmentDirectional(
                                                  -1.0, 0.0),
                                              child: Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        10.0, 0.0, 0.0, 0.0),
                                                child: Text(
                                                  FFLocalizations.of(context)
                                                      .getText(
                                                    'zqzw5umq' /* 45%  Irrigation */,
                                                  ),
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                        Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 5.0, 0.0, 0.0),
                                              child: Container(
                                                width:
                                                    MediaQuery.sizeOf(context)
                                                            .width *
                                                        0.25,
                                                height: 20.0,
                                                decoration: BoxDecoration(
                                                  gradient: LinearGradient(
                                                    colors: [
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .primary,
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .primaryText
                                                    ],
                                                    stops: [0.0, 1.0],
                                                    begin: AlignmentDirectional(
                                                        0.0, -1.0),
                                                    end: AlignmentDirectional(
                                                        0, 1.0),
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.only(
                                                    bottomLeft:
                                                        Radius.circular(15.0),
                                                    bottomRight:
                                                        Radius.circular(55.0),
                                                    topLeft:
                                                        Radius.circular(15.0),
                                                    topRight:
                                                        Radius.circular(55.0),
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Align(
                                              alignment: AlignmentDirectional(
                                                  -1.0, 0.0),
                                              child: Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        10.0, 0.0, 0.0, 0.0),
                                                child: Text(
                                                  FFLocalizations.of(context)
                                                      .getText(
                                                    'qyqcrldr' /* 25% Industrial Use */,
                                                  ),
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                        Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 5.0, 0.0, 0.0),
                                              child: Container(
                                                width:
                                                    MediaQuery.sizeOf(context)
                                                            .width *
                                                        0.2,
                                                height: 20.0,
                                                decoration: BoxDecoration(
                                                  gradient: LinearGradient(
                                                    colors: [
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .primary,
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .primaryText
                                                    ],
                                                    stops: [0.0, 1.0],
                                                    begin: AlignmentDirectional(
                                                        0.0, -1.0),
                                                    end: AlignmentDirectional(
                                                        0, 1.0),
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.only(
                                                    bottomLeft:
                                                        Radius.circular(15.0),
                                                    bottomRight:
                                                        Radius.circular(55.0),
                                                    topLeft:
                                                        Radius.circular(15.0),
                                                    topRight:
                                                        Radius.circular(55.0),
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Align(
                                              alignment: AlignmentDirectional(
                                                  -1.0, 0.0),
                                              child: Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        10.0, 0.0, 0.0, 0.0),
                                                child: Text(
                                                  FFLocalizations.of(context)
                                                      .getText(
                                                    'zxfb8jpu' /* 20% Drinking  */,
                                                  ),
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                        Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 5.0, 0.0, 0.0),
                                              child: Container(
                                                width:
                                                    MediaQuery.sizeOf(context)
                                                            .width *
                                                        0.1,
                                                height: 20.0,
                                                decoration: BoxDecoration(
                                                  gradient: LinearGradient(
                                                    colors: [
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .primary,
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .primaryText
                                                    ],
                                                    stops: [0.0, 1.0],
                                                    begin: AlignmentDirectional(
                                                        0.0, -1.0),
                                                    end: AlignmentDirectional(
                                                        0, 1.0),
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.only(
                                                    bottomLeft:
                                                        Radius.circular(15.0),
                                                    bottomRight:
                                                        Radius.circular(55.0),
                                                    topLeft:
                                                        Radius.circular(15.0),
                                                    topRight:
                                                        Radius.circular(55.0),
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Align(
                                              alignment: AlignmentDirectional(
                                                  -1.0, 0.0),
                                              child: Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        10.0, 0.0, 0.0, 0.0),
                                                child: Text(
                                                  FFLocalizations.of(context)
                                                      .getText(
                                                    'jf40ytzp' /* 10% Others */,
                                                  ),
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                  Align(
                                    alignment: AlignmentDirectional(1.0, 0.0),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 0.0, 10.0, 0.0),
                                      child: Container(
                                        width: 24.0,
                                        height: 24.0,
                                        decoration: BoxDecoration(
                                          color: Color(0x00FFFFFF),
                                          boxShadow: [
                                            BoxShadow(
                                              blurRadius: 4.0,
                                              color: Color(0x33404040),
                                              offset: Offset(0.0, 2.0),
                                            )
                                          ],
                                          borderRadius:
                                              BorderRadius.circular(100.0),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Align(
                                    alignment: AlignmentDirectional(1.0, 0.0),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 0.0, 10.0, 0.0),
                                      child: Icon(
                                        Icons.arrow_circle_right,
                                        color: Color(0xFF747474),
                                        size: 24.0,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 10.0, 0.0, 0.0),
                          child: InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              context.pushNamed('ClimateChangePage');
                            },
                            child: Container(
                              width: MediaQuery.sizeOf(context).width * 0.9,
                              height: 100.0,
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                                borderRadius: BorderRadius.circular(10.0),
                                border: Border.all(
                                  width: 0.5,
                                ),
                              ),
                              child: Stack(
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(10.0),
                                    child: Image.network(
                                      'https://images.unsplash.com/photo-1492056128351-09fb7a99969e?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3w0NTYyMDF8MHwxfHNlYXJjaHwxMXx8cml2ZXJ8ZW58MHx8fHwxNzAwNDgxNDY1fDA&ixlib=rb-4.0.3&q=80&w=1080',
                                      width: double.infinity,
                                      height: 200.0,
                                      fit: BoxFit.cover,
                                      alignment: Alignment(50.0, 0.1),
                                    ),
                                  ),
                                  Align(
                                    alignment: AlignmentDirectional(1.0, 0.0),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 0.0, 10.0, 0.0),
                                      child: Container(
                                        width: 24.0,
                                        height: 24.0,
                                        decoration: BoxDecoration(
                                          color: Color(0x00FFFFFF),
                                          boxShadow: [
                                            BoxShadow(
                                              blurRadius: 4.0,
                                              color: Color(0x33FFFFFF),
                                              offset: Offset(0.0, 2.0),
                                            )
                                          ],
                                          borderRadius:
                                              BorderRadius.circular(100.0),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Align(
                                    alignment: AlignmentDirectional(-1.0, 1.0),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          10.0, 5.0, 0.0, 10.0),
                                      child: Text(
                                        FFLocalizations.of(context).getText(
                                          'c3mfp6xe' /* Climate Chnage Impact */,
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .titleLarge
                                            .override(
                                              fontFamily: 'Outfit',
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryBtnText,
                                              fontSize: 18.0,
                                            ),
                                      ),
                                    ),
                                  ),
                                  Align(
                                    alignment: AlignmentDirectional(1.0, 0.0),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 0.0, 10.0, 0.0),
                                      child: Icon(
                                        Icons.arrow_circle_right,
                                        color: Color(0xFFFAFAFA),
                                        size: 24.0,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 10.0, 0.0, 0.0),
                          child: InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              context.pushNamed('BiodiversityPage');
                            },
                            child: Container(
                              width: MediaQuery.sizeOf(context).width * 0.9,
                              height: 100.0,
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                                borderRadius: BorderRadius.circular(10.0),
                                border: Border.all(
                                  width: 0.5,
                                ),
                              ),
                              child: Stack(
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(10.0),
                                    child: Image.network(
                                      'https://images.unsplash.com/photo-1609595439618-7bd40aea6d1e?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3w0NTYyMDF8MHwxfHNlYXJjaHw3fHxiaW9kaXZlcnNpdHl8ZW58MHx8fHwxNzAwNDg4NzYxfDA&ixlib=rb-4.0.3&q=80&w=1080',
                                      width: double.infinity,
                                      height: 200.0,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  Align(
                                    alignment: AlignmentDirectional(1.0, 0.0),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 0.0, 10.0, 0.0),
                                      child: Container(
                                        width: 24.0,
                                        height: 24.0,
                                        decoration: BoxDecoration(
                                          color: Color(0x00FFFFFF),
                                          boxShadow: [
                                            BoxShadow(
                                              blurRadius: 4.0,
                                              color: Color(0x33FFFFFF),
                                              offset: Offset(0.0, 2.0),
                                            )
                                          ],
                                          borderRadius:
                                              BorderRadius.circular(100.0),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Align(
                                    alignment: AlignmentDirectional(-1.0, 1.0),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          10.0, 5.0, 0.0, 10.0),
                                      child: Text(
                                        FFLocalizations.of(context).getText(
                                          '8mwxp7su' /* Biodiversity Conservation */,
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .titleLarge
                                            .override(
                                              fontFamily: 'Outfit',
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryBtnText,
                                              fontSize: 18.0,
                                            ),
                                      ),
                                    ),
                                  ),
                                  Align(
                                    alignment: AlignmentDirectional(1.0, 0.0),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 0.0, 10.0, 0.0),
                                      child: Icon(
                                        Icons.arrow_circle_right,
                                        color: Color(0xFFFAFAFA),
                                        size: 24.0,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 10.0, 0.0, 0.0),
                          child: Container(
                            width: MediaQuery.sizeOf(context).width * 0.9,
                            height: 100.0,
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                              borderRadius: BorderRadius.circular(10.0),
                              border: Border.all(
                                width: 0.5,
                              ),
                            ),
                            child: Stack(
                              children: [
                                Align(
                                  alignment: AlignmentDirectional(1.0, 0.0),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(10.0),
                                    child: Image.network(
                                      'https://images.unsplash.com/photo-1445250079920-77131cc79ec5?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3w0NTYyMDF8MHwxfHNlYXJjaHw4fHxuYXZpZ2F0aW9ufGVufDB8fHx8MTcwMDQ5OTg0NHww&ixlib=rb-4.0.3&q=80&w=1080',
                                      width: double.infinity,
                                      height: 200.0,
                                      fit: BoxFit.cover,
                                      alignment: Alignment(0.0, -1.0),
                                    ),
                                  ),
                                ),
                                Align(
                                  alignment: AlignmentDirectional(-1.0, 1.0),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        10.0, 5.0, 0.0, 10.0),
                                    child: Text(
                                      FFLocalizations.of(context).getText(
                                        'bxvncu0x' /* Navigation & Transportation */,
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .titleLarge
                                          .override(
                                            fontFamily: 'Outfit',
                                            color: FlutterFlowTheme.of(context)
                                                .primaryBtnText,
                                            fontSize: 18.0,
                                          ),
                                    ),
                                  ),
                                ),
                                Align(
                                  alignment: AlignmentDirectional(1.0, 0.0),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 10.0, 0.0),
                                    child: Icon(
                                      Icons.arrow_circle_right,
                                      color: Color(0xFFDEDEDE),
                                      size: 24.0,
                                    ),
                                  ),
                                ),
                                Align(
                                  alignment: AlignmentDirectional(1.0, 0.0),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 10.0, 0.0),
                                    child: Container(
                                      width: 24.0,
                                      height: 24.0,
                                      decoration: BoxDecoration(
                                        color: Color(0x00FFFFFF),
                                        boxShadow: [
                                          BoxShadow(
                                            blurRadius: 4.0,
                                            color: Color(0x33FFFFFF),
                                            offset: Offset(0.0, 2.0),
                                          )
                                        ],
                                        borderRadius:
                                            BorderRadius.circular(100.0),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 10.0, 0.0, 0.0),
                          child: InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              context.pushNamed('LandUsePage');
                            },
                            child: Container(
                              width: MediaQuery.sizeOf(context).width * 0.9,
                              height: 100.0,
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                                borderRadius: BorderRadius.circular(10.0),
                                border: Border.all(
                                  width: 0.5,
                                ),
                              ),
                              child: Stack(
                                children: [
                                  Align(
                                    alignment: AlignmentDirectional(1.0, 0.0),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(10.0),
                                      child: Image.network(
                                        'https://images.unsplash.com/photo-1591389703635-e15a07b842d7?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3w0NTYyMDF8MHwxfHNlYXJjaHw1fHxsYW5kJTIwfGVufDB8fHx8MTcwMDUwMDI0OHww&ixlib=rb-4.0.3&q=80&w=1080',
                                        width: double.infinity,
                                        height: 200.0,
                                        fit: BoxFit.cover,
                                        alignment: Alignment(0.0, -1.0),
                                      ),
                                    ),
                                  ),
                                  Align(
                                    alignment: AlignmentDirectional(-1.0, 1.0),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          10.0, 5.0, 0.0, 10.0),
                                      child: Text(
                                        FFLocalizations.of(context).getText(
                                          't1m7abdp' /* Land Use Guidance */,
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .titleLarge
                                            .override(
                                              fontFamily: 'Outfit',
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryBtnText,
                                              fontSize: 18.0,
                                            ),
                                      ),
                                    ),
                                  ),
                                  Align(
                                    alignment: AlignmentDirectional(1.0, 0.0),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 0.0, 10.0, 0.0),
                                      child: Icon(
                                        Icons.arrow_circle_right,
                                        color: Color(0xFFDEDEDE),
                                        size: 24.0,
                                      ),
                                    ),
                                  ),
                                  Align(
                                    alignment: AlignmentDirectional(1.0, 0.0),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 0.0, 10.0, 0.0),
                                      child: Container(
                                        width: 24.0,
                                        height: 24.0,
                                        decoration: BoxDecoration(
                                          color: Color(0x00FFFFFF),
                                          boxShadow: [
                                            BoxShadow(
                                              blurRadius: 4.0,
                                              color: Color(0x33FFFFFF),
                                              offset: Offset(0.0, 2.0),
                                            )
                                          ],
                                          borderRadius:
                                              BorderRadius.circular(100.0),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 10.0, 0.0, 10.0),
                          child: Container(
                            width: MediaQuery.sizeOf(context).width * 0.9,
                            height: 100.0,
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                              borderRadius: BorderRadius.circular(10.0),
                              border: Border.all(
                                width: 0.5,
                              ),
                            ),
                            child: Stack(
                              children: [
                                Align(
                                  alignment: AlignmentDirectional(1.0, 0.0),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(10.0),
                                    child: Image.network(
                                      'https://images.unsplash.com/photo-1628595351029-c2bf17511435?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3w0NTYyMDF8MHwxfHNlYXJjaHwxMHx8c2NpZW5jZXxlbnwwfHx8fDE3MDA1NDYwNjh8MA&ixlib=rb-4.0.3&q=80&w=1080',
                                      width: double.infinity,
                                      height: 200.0,
                                      fit: BoxFit.cover,
                                      alignment: Alignment(-1.0, -1.0),
                                    ),
                                  ),
                                ),
                                Align(
                                  alignment: AlignmentDirectional(-1.0, 1.0),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        10.0, 5.0, 0.0, 10.0),
                                    child: Text(
                                      FFLocalizations.of(context).getText(
                                        '3eitic8a' /* Scientific Research */,
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .titleLarge
                                          .override(
                                            fontFamily: 'Outfit',
                                            color: FlutterFlowTheme.of(context)
                                                .primaryBtnText,
                                            fontSize: 18.0,
                                          ),
                                    ),
                                  ),
                                ),
                                Align(
                                  alignment: AlignmentDirectional(1.0, 0.0),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 10.0, 0.0),
                                    child: Icon(
                                      Icons.arrow_circle_right,
                                      color: Color(0xFFDEDEDE),
                                      size: 24.0,
                                    ),
                                  ),
                                ),
                                Align(
                                  alignment: AlignmentDirectional(1.0, 0.0),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 10.0, 0.0),
                                    child: Container(
                                      width: 24.0,
                                      height: 24.0,
                                      decoration: BoxDecoration(
                                        color: Color(0x00FFFFFF),
                                        boxShadow: [
                                          BoxShadow(
                                            blurRadius: 4.0,
                                            color: Color(0x33FFFFFF),
                                            offset: Offset(0.0, 2.0),
                                          )
                                        ],
                                        borderRadius:
                                            BorderRadius.circular(100.0),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            wrapWithModel(
              model: _model.appBarModel,
              updateCallback: () => setState(() {}),
              child: AppBarWidget(),
            ),
          ],
        ),
      ),
    );
  }
}
