import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:octo_image/octo_image.dart';
import 'package:provider/provider.dart';
import 'news_component_model.dart';
export 'news_component_model.dart';

class NewsComponentWidget extends StatefulWidget {
  const NewsComponentWidget({
    super.key,
    this.title,
    this.descripton,
    this.imageURL,
    required this.createAt,
    required this.author,
  });

  final String? title;
  final String? descripton;
  final String? imageURL;
  final DateTime? createAt;
  final String? author;

  @override
  State<NewsComponentWidget> createState() => _NewsComponentWidgetState();
}

class _NewsComponentWidgetState extends State<NewsComponentWidget>
    with TickerProviderStateMixin {
  late NewsComponentModel _model;

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
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => NewsComponentModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      children: [
        Padding(
          padding: EdgeInsets.all(10.0),
          child: Container(
            width: double.infinity,
            height: 510.0,
            decoration: BoxDecoration(
              color: FlutterFlowTheme.of(context).secondaryBackground,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 5.0),
                  child: Container(
                    width: double.infinity,
                    height: 250.0,
                    constraints: BoxConstraints(
                      maxWidth: double.infinity,
                      maxHeight: double.infinity,
                    ),
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).secondaryBackground,
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 4.0,
                          color: Color(0x33000000),
                          offset: Offset(0.0, 2.0),
                        )
                      ],
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8.0),
                      child: Image.network(
                        widget.imageURL!,
                        width: 300.0,
                        height: 200.0,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                Container(
                  width: double.infinity,
                  height: 255.0,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [Color(0x00FFFFFF), Color(0x10000000)],
                      stops: [0.0, 1.0],
                      begin: AlignmentDirectional(0.0, -1.0),
                      end: AlignmentDirectional(0, 1.0),
                    ),
                  ),
                  child: Align(
                    alignment: AlignmentDirectional(-1.0, -1.0),
                    child: Padding(
                      padding: EdgeInsets.all(10.0),
                      child: SingleChildScrollView(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              widget.title!,
                              style: FlutterFlowTheme.of(context).headlineLarge,
                            ).animateOnPageLoad(
                                animationsMap['textOnPageLoadAnimation']!),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  5.0, 0.0, 0.0, 0.0),
                              child: Text(
                                widget.descripton!,
                                textAlign: TextAlign.start,
                                style: FlutterFlowTheme.of(context).bodyLarge,
                              ),
                            ),
                            Align(
                              alignment: AlignmentDirectional(1.0, 1.0),
                              child: Text(
                                widget.author!,
                                style: FlutterFlowTheme.of(context)
                                    .bodySmall
                                    .override(
                                      fontFamily: 'Readex Pro',
                                      fontSize: 10.0,
                                      fontWeight: FontWeight.w500,
                                    ),
                              ),
                            ),
                            Align(
                              alignment: AlignmentDirectional(1.0, 1.0),
                              child: Text(
                                valueOrDefault<String>(
                                  dateTimeFormat(
                                    'd/M h:mm a',
                                    widget.createAt,
                                    locale: FFLocalizations.of(context)
                                        .languageCode,
                                  ),
                                  'DateTime',
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .bodySmall
                                    .override(
                                      fontFamily: 'Readex Pro',
                                      fontSize: 10.0,
                                    ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
