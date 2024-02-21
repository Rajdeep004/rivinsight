import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'dart:ui';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'weatherinfo_copy_model.dart';
export 'weatherinfo_copy_model.dart';

class WeatherinfoCopyWidget extends StatefulWidget {
  const WeatherinfoCopyWidget({super.key});

  @override
  State<WeatherinfoCopyWidget> createState() => _WeatherinfoCopyWidgetState();
}

class _WeatherinfoCopyWidgetState extends State<WeatherinfoCopyWidget> {
  late WeatherinfoCopyModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => WeatherinfoCopyModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300.0,
      height: 200.0,
      decoration: BoxDecoration(
        color: Color(0x8E023A62),
        borderRadius: BorderRadius.circular(5.0),
        shape: BoxShape.rectangle,
      ),
      child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(),
            child: ClipRect(
              child: ImageFiltered(
                imageFilter: ImageFilter.blur(
                  sigmaX: 2.0,
                  sigmaY: 2.0,
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8.0),
                  child: Image.network(
                    'https://images.unsplash.com/photo-1571745544682-143ea663cf2c?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3w0NTYyMDF8MHwxfHNlYXJjaHwxN3x8d2luZHxlbnwwfHx8fDE3MDA3MjY4NDl8MA&ixlib=rb-4.0.3&q=80&w=1080',
                    width: 300.0,
                    height: 200.0,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ),
          Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 5.0),
                child: FaIcon(
                  FontAwesomeIcons.wind,
                  color: FlutterFlowTheme.of(context).primary,
                  size: 30.0,
                ),
              ),
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 5.0),
                    child: RichText(
                      textScaleFactor: MediaQuery.of(context).textScaleFactor,
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: FFLocalizations.of(context).getText(
                              '7lth9hrt' /* 147 */,
                            ),
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Readex Pro',
                                  color: FlutterFlowTheme.of(context)
                                      .primaryBtnText,
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.bold,
                                ),
                          ),
                          TextSpan(
                            text: FFLocalizations.of(context).getText(
                              'wv4ux6ga' /*  kmph */,
                            ),
                            style: TextStyle(
                              color: Color(0xFFEFEFEF),
                              fontWeight: FontWeight.normal,
                              fontSize: 12.0,
                            ),
                          )
                        ],
                        style: FlutterFlowTheme.of(context).bodyMedium,
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 3.0, 0.0),
                child: Text(
                  FFLocalizations.of(context).getText(
                    'x01t8b9z' /* Wind */,
                  ),
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                        fontFamily: 'Readex Pro',
                        color: FlutterFlowTheme.of(context).primaryBtnText,
                        fontSize: 18.0,
                      ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
