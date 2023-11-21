import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/user/appbar/appbar_widget.dart';
import '/user/news_component/news_component_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'news_feed_model.dart';
export 'news_feed_model.dart';

class NewsFeedWidget extends StatefulWidget {
  const NewsFeedWidget({Key? key}) : super(key: key);

  @override
  _NewsFeedWidgetState createState() => _NewsFeedWidgetState();
}

class _NewsFeedWidgetState extends State<NewsFeedWidget> {
  late NewsFeedModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => NewsFeedModel());
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
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              wrapWithModel(
                model: _model.appbarModel,
                updateCallback: () => setState(() {}),
                child: AppbarWidget(),
              ),
              Container(
                width: double.infinity,
                height: 630.0,
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).secondaryBackground,
                ),
                child: FutureBuilder<List<NewsRow>>(
                  future: NewsTable().queryRows(
                    queryFn: (q) => q,
                  ),
                  builder: (context, snapshot) {
                    // Customize what your widget looks like when it's loading.
                    if (!snapshot.hasData) {
                      return Center(
                        child: SizedBox(
                          width: 50.0,
                          height: 50.0,
                          child: SpinKitCircle(
                            color: FlutterFlowTheme.of(context).primary,
                            size: 50.0,
                          ),
                        ),
                      );
                    }
                    List<NewsRow> newsListNewsRowList = snapshot.data!;
                    return ListView.separated(
                      padding: EdgeInsets.zero,
                      primary: false,
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
                              'Key11h_${newsListNewsRow.id.toString()}',
                            ),
                            title: newsListNewsRow.title,
                            descripton: newsListNewsRow.description,
                            imageURL: newsListNewsRow.imageURL,
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
      ),
    );
  }
}
