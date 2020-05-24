import 'package:camera/camera.dart';
import 'package:flutter/material.dart';

class ImageServices {
  List<CameraDescription> cameras;

  /// Call one time before runApp() method
  Future initilializeCameras() async {
    try {
      WidgetsFlutterBinding.ensureInitialized();
      cameras = await availableCameras();
      print('find ${cameras.length} available cameras');
    } on CameraException catch (e) {
      print('${e.code}, ${e.description}');
      // todo: show error
    }
  }
}
