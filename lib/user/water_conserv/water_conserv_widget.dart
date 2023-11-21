import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'water_conserv_model.dart';
export 'water_conserv_model.dart';

class WaterConservWidget extends StatefulWidget {
  const WaterConservWidget({
    Key? key,
    required this.content,
    required this.image,
    required this.id,
  }) : super(key: key);

  final String? content;
  final String? image;
  final int? id;

  @override
  _WaterConservWidgetState createState() => _WaterConservWidgetState();
}

class _WaterConservWidgetState extends State<WaterConservWidget> {
  late WaterConservModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => WaterConservModel());
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
          padding: EdgeInsetsDirectional.fromSTEB(10.0, 10.0, 10.0, 10.0),
          child: Container(
            width: double.infinity,
            height: 364.0,
            decoration: BoxDecoration(
              color: FlutterFlowTheme.of(context).newsColor,
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(20.0, 20.0, 0.0, 0.0),
                  child: Text(
                    'Tip ${widget.id?.toString()}',
                    style: FlutterFlowTheme.of(context).headlineSmall,
                  ),
                ),
                Padding(
                  padding:
                      EdgeInsetsDirectional.fromSTEB(20.0, 10.0, 20.0, 0.0),
                  child: Container(
                    width: double.infinity,
                    height: 168.0,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).secondaryBackground,
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8.0),
                      child: Image.network(
                        widget.image!,
                        width: 300.0,
                        height: 200.0,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding:
                      EdgeInsetsDirectional.fromSTEB(20.0, 10.0, 10.0, 10.0),
                  child: Text(
                    widget.content!,
                    style: FlutterFlowTheme.of(context).bodyMedium,
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
