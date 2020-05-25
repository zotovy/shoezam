import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:shoezam/core/services/images.dart';
import 'package:shoezam/locator.dart';

class CamaraLivePreviewWidget extends StatefulWidget {
  @override
  _CamaraLivePreviewWidgetState createState() =>
      _CamaraLivePreviewWidgetState();
}

class _CamaraLivePreviewWidgetState extends State<CamaraLivePreviewWidget> {
  CameraController cameraController;

  double getAspectRation() {
    return MediaQuery.of(context).size.width /
        MediaQuery.of(context).size.height;
  }

  @override
  void initState() {
    super.initState();
    cameraController = CameraController(
      locator<ImageServices>().cameras[0],
      ResolutionPreset.medium,
    );

    cameraController.initialize().then((_) {
      if (!mounted) {
        return;
      }
      setState(() {});
    });
  }

  @override
  void dispose() {
    cameraController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (!cameraController.value.isInitialized) {
      return Container();
    }
    return AspectRatio(
      aspectRatio: getAspectRation(),
      child: CameraPreview(cameraController),
    );
  }
}
