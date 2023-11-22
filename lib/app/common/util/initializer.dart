import 'package:hibiscus_learning/import.dart';

abstract class Initializer {

  static void init(VoidCallback runApp) {

    runZonedGuarded(() async {
      WidgetsFlutterBinding.ensureInitialized();
      FlutterError.onError = (details) {
        FlutterError.dumpErrorToConsole(details);
        Get.printInfo(info: details.stack.toString());
      };

      await _initServices();
      runApp();
    }, (error, stack) {
      Get.printInfo(info: 'runZonedGuarded: ${error.toString()}');
    });
  }

  static Future<void> _initServices() async {
    try {
      await _initStorage();

      _initScreenPreference();

      // await _initCamera();

    } catch (err) {
      rethrow;
    }
  }

  static Future<void> _initStorage() async {
    await GetStorage.init();
  }

  static void _initScreenPreference() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
  }
}

  // Future<void> _initCamera() async{
  //   List<CameraDescription> _cameras = <CameraDescription>[];
  //     try {
  //       _cameras = await availableCameras();
  //     } on CameraException catch (e) {
  //     if (kDebugMode) {
  //       print('Error: ${e.code}${e.description == null ? '' : '\nError Message: ${e.description}'}');
  //     }
  //   }
  // }

  class InitialBindings extends Bindings {
    @override
    void dependencies() {

    }
}
