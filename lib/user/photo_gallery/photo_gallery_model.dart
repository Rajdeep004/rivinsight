import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_expanded_image_view.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/user/app_bar/app_bar_widget.dart';
import 'photo_gallery_widget.dart' show PhotoGalleryWidget;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';

class PhotoGalleryModel extends FlutterFlowModel<PhotoGalleryWidget> {
  ///  Local state fields for this page.

  List<String> galleryList = [];
  void addToGalleryList(String item) => galleryList.add(item);
  void removeFromGalleryList(String item) => galleryList.remove(item);
  void removeAtIndexFromGalleryList(int index) => galleryList.removeAt(index);
  void insertAtIndexInGalleryList(int index, String item) =>
      galleryList.insert(index, item);
  void updateGalleryListAtIndex(int index, Function(String) updateFn) =>
      galleryList[index] = updateFn(galleryList[index]);

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for AppBar component.
  late AppBarModel appBarModel;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {
    appBarModel = createModel(context, () => AppBarModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    appBarModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
