import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'bottom_nav_bar_model.dart';
export 'bottom_nav_bar_model.dart';

class BottomNavBarWidget extends StatefulWidget {
  const BottomNavBarWidget({Key? key}) : super(key: key);

  @override
  _BottomNavBarWidgetState createState() => _BottomNavBarWidgetState();
}

class _BottomNavBarWidgetState extends State<BottomNavBarWidget> {
  late BottomNavBarModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => BottomNavBarModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        FlutterFlowIconButton(
          borderRadius: 30.0,
          buttonSize: 50.0,
          fillColor: Color(0x00023A62),
          icon: FaIcon(
            FontAwesomeIcons.home,
            color: FlutterFlowTheme.of(context).primary,
            size: 24.0,
          ),
          onPressed: () {
            print('IconButton pressed ...');
          },
        ),
        FlutterFlowIconButton(
          borderRadius: 30.0,
          buttonSize: 50.0,
          fillColor: Color(0x00023A62),
          icon: Icon(
            Icons.explore_outlined,
            color: FlutterFlowTheme.of(context).primary,
            size: 27.0,
          ),
          onPressed: () {
            print('IconButton pressed ...');
          },
        ),
        FlutterFlowIconButton(
          borderRadius: 30.0,
          buttonSize: 50.0,
          fillColor: Color(0x00023A62),
          icon: Icon(
            Icons.people_outline_rounded,
            color: FlutterFlowTheme.of(context).primary,
            size: 27.0,
          ),
          onPressed: () {
            print('IconButton pressed ...');
          },
        ),
        FlutterFlowIconButton(
          borderRadius: 30.0,
          buttonSize: 50.0,
          fillColor: Color(0x00023A62),
          icon: Icon(
            Icons.account_circle_outlined,
            color: FlutterFlowTheme.of(context).primary,
            size: 27.0,
          ),
          onPressed: () {
            print('IconButton pressed ...');
          },
        ),
      ],
    );
  }
}
