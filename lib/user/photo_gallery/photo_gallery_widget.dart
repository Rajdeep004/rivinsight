import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_expanded_image_view.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/user/app_bar/app_bar_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';
import 'photo_gallery_model.dart';
export 'photo_gallery_model.dart';

class PhotoGalleryWidget extends StatefulWidget {
  const PhotoGalleryWidget({super.key});

  @override
  State<PhotoGalleryWidget> createState() => _PhotoGalleryWidgetState();
}

class _PhotoGalleryWidgetState extends State<PhotoGalleryWidget> {
  late PhotoGalleryModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PhotoGalleryModel());
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
              padding: EdgeInsetsDirectional.fromSTEB(0.0, 90.0, 0.0, 0.0),
              child: ListView(
                padding: EdgeInsets.zero,
                scrollDirection: Axis.vertical,
                children: [
                  Align(
                    alignment: AlignmentDirectional(-1.0, 0.0),
                    child: Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(20.0, 15.0, 0.0, 0.0),
                      child: Text(
                        FFLocalizations.of(context).getText(
                          '8iho4kf1' /* Gallery */,
                        ),
                        style: FlutterFlowTheme.of(context).headlineSmall,
                      ),
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    height: MediaQuery.sizeOf(context).height * 1.0,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).secondaryBackground,
                    ),
                    child: Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(10.0, 10.0, 10.0, 0.0),
                      child: FutureBuilder<List<GalleryRow>>(
                        future: GalleryTable().queryRows(
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
                          List<GalleryRow> gridViewGalleryRowList =
                              snapshot.data!;
                          return GridView.builder(
                            padding: EdgeInsets.zero,
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              crossAxisSpacing: 10.0,
                              mainAxisSpacing: 10.0,
                              childAspectRatio: 1.0,
                            ),
                            scrollDirection: Axis.vertical,
                            itemCount: gridViewGalleryRowList.length,
                            itemBuilder: (context, gridViewIndex) {
                              final gridViewGalleryRow =
                                  gridViewGalleryRowList[gridViewIndex];
                              return InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  await Navigator.push(
                                    context,
                                    PageTransition(
                                      type: PageTransitionType.fade,
                                      child: FlutterFlowExpandedImageView(
                                        image: Image.network(
                                          gridViewGalleryRow.imageURL!,
                                          fit: BoxFit.contain,
                                        ),
                                        allowRotation: false,
                                        tag: gridViewGalleryRow.imageURL!,
                                        useHeroAnimation: true,
                                      ),
                                    ),
                                  );
                                },
                                child: Hero(
                                  tag: gridViewGalleryRow.imageURL!,
                                  transitionOnUserGestures: true,
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(8.0),
                                    child: Image.network(
                                      gridViewGalleryRow.imageURL!,
                                      width: 300.0,
                                      height: 200.0,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              );
                            },
                          );
                        },
                      ),
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
