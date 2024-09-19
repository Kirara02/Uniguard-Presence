import 'package:get_it/get_it.dart';
import 'package:unipres/services/camera_service.dart';
import 'package:unipres/services/face_detector_service.dart';
import 'package:unipres/services/ml_service.dart';

final locator = GetIt.instance;

void setupServices() {
  locator.registerLazySingleton<CameraService>(() => CameraService());
  locator
      .registerLazySingleton<FaceDetectorService>(() => FaceDetectorService());
  locator.registerLazySingleton<MlService>(() => MlService());
}
