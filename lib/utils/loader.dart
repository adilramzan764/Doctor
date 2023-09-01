import 'package:flutter_easyloading/flutter_easyloading.dart';

class LoaderManager {
  static Future<void> startLoading({required String loadingStatus}) async {
    await EasyLoading.show(
      status: loadingStatus,
      maskType: EasyLoadingMaskType.black,
    );

    await Future.delayed(Duration(seconds: 2));

    await EasyLoading.dismiss();
  }
}
