import 'package:hibiscus_learning/import.dart';

typedef CloseDialog = void Function();

abstract class LoadingDialog {
  static CloseDialog ? _loadingDialogue;

  static CloseDialog _showLoadingDialogue() {
    Get.printInfo(info: 'initialized loading');
    Utils.loadingDialog();
    return Utils.closeDialog;
  }

  static void showLoadingDialog() {
    _loadingDialogue = _showLoadingDialogue();
    Get.printInfo(info: 'start loading');
  }

  static void closeLoadingDialog() {
    Get.printInfo(info: 'close loading');
    _loadingDialogue?.call();
  }

  static Widget circularLoader({color = AppColors.kTierColor}) {
    return CircularProgressIndicator(
      valueColor: AlwaysStoppedAnimation<Color>(color),
    );
  }

}
