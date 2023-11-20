import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'appbarnew_model.dart';
export 'appbarnew_model.dart';

class AppbarnewWidget extends StatefulWidget {
  const AppbarnewWidget({Key? key}) : super(key: key);

  @override
  _AppbarnewWidgetState createState() => _AppbarnewWidgetState();
}

class _AppbarnewWidgetState extends State<AppbarnewWidget> {
  late AppbarnewModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AppbarnewModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      elevation: 2.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(50.0),
          bottomRight: Radius.circular(50.0),
          topLeft: Radius.circular(0.0),
          topRight: Radius.circular(0.0),
        ),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(50.0),
          bottomRight: Radius.circular(50.0),
          topLeft: Radius.circular(0.0),
          topRight: Radius.circular(0.0),
        ),
        child: Container(
          width: double.infinity,
          height: 62.0,
          constraints: BoxConstraints(
            minWidth: double.infinity,
            maxWidth: double.infinity,
          ),
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                blurRadius: 4.0,
                color: Color(0x33000000),
                offset: Offset(0.0, 2.0),
              )
            ],
            gradient: LinearGradient(
              colors: [Color(0xFFC5E7FF), Colors.white],
              stops: [0.0, 1.0],
              begin: AlignmentDirectional(0.0, -1.0),
              end: AlignmentDirectional(0, 1.0),
            ),
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(50.0),
              bottomRight: Radius.circular(50.0),
              topLeft: Radius.circular(0.0),
              topRight: Radius.circular(0.0),
            ),
            border: Border.all(
              color: FlutterFlowTheme.of(context).primary,
            ),
          ),
          child: Image.asset(
            'assets/images/New_Project_(9).png',
            width: 50.0,
            height: 20.0,
            fit: BoxFit.contain,
          ),
        ),
      ),
    );
  }
}
