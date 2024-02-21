import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/user/app_bar/app_bar_widget.dart';
import '/user/news_component/news_component_widget.dart';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'news_feed_model.dart';
export 'news_feed_model.dart';

class NewsFeedWidget extends StatefulWidget {
  const NewsFeedWidget({super.key});

  @override
  State<NewsFeedWidget> createState() => _NewsFeedWidgetState();
}

class _NewsFeedWidgetState extends State<NewsFeedWidget> {
  late NewsFeedModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => NewsFeedModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      setState(() {
        FFAppState().clearNewsCacheCache();
        _model.requestCompleted = false;
      });
      await _model.waitForRequestCompleted();
    });
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
        body: SafeArea(
          top: true,
          child: Stack(
            children: [
              wrapWithModel(
                model: _model.appBarModel,
                updateCallback: () => setState(() {}),
                child: AppBarWidget(),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 90.0, 0.0, 60.0),
                child: ListView(
                  padding: EdgeInsets.zero,
                  scrollDirection: Axis.vertical,
                  children: [
                    FutureBuilder<List<NewsRow>>(
                      future: FFAppState()
                          .newsCache(
                        requestFn: () => NewsTable().queryRows(
                          queryFn: (q) => q.order('created_at'),
                        ),
                      )
                          .then((result) {
                        _model.requestCompleted = true;
                        return result;
                      }),
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
                        List<NewsRow> newsListNewsRowList = snapshot.data!;
                        return RefreshIndicator(
                          color: FlutterFlowTheme.of(context).primary,
                          strokeWidth: 3.0,
                          onRefresh: () async {
                            setState(() {
                              FFAppState().clearNewsCacheCache();
                              _model.requestCompleted = false;
                            });
                            await _model.waitForRequestCompleted();
                          },
                          child: ListView.separated(
                            padding: EdgeInsets.zero,
                            primary: false,
                            shrinkWrap: true,
                            scrollDirection: Axis.vertical,
                            itemCount: newsListNewsRowList.length,
                            separatorBuilder: (_, __) => SizedBox(height: 10.0),
                            itemBuilder: (context, newsListIndex) {
                              final newsListNewsRow =
                                  newsListNewsRowList[newsListIndex];
                              return wrapWithModel(
                                model: _model.newsComponentModels.getModel(
                                  newsListNewsRow.id.toString(),
                                  newsListIndex,
                                ),
                                updateCallback: () => setState(() {}),
                                child: NewsComponentWidget(
                                  key: Key(
                                    'Keybjs_${newsListNewsRow.id.toString()}',
                                  ),
                                  title: newsListNewsRow.title,
                                  descripton: newsListNewsRow.description,
                                  imageURL: newsListNewsRow.imageURL,
                                  createAt: newsListNewsRow.createdAt,
                                  author: newsListNewsRow.author!,
                                ),
                              );
                            },
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
