import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'event_compo_model.dart';
export 'event_compo_model.dart';

class EventCompoWidget extends StatefulWidget {
  const EventCompoWidget({super.key});

  @override
  State<EventCompoWidget> createState() => _EventCompoWidgetState();
}

class _EventCompoWidgetState extends State<EventCompoWidget> {
  late EventCompoModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => EventCompoModel());
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
        height: 432.0,
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).primaryBackground,
        ),
      ),
    );
  }
}
