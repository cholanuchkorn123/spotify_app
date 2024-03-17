import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:adaptive_dialog/adaptive_dialog.dart';

import '../domain/dispose_bag.dart';

export 'package:get/get_rx/get_rx.dart';
export 'package:get/instance_manager.dart';

export '../domain/base_observer.dart';
export '../domain/base_state.dart';
export '../domain/dispose_bag.dart';

class BaseController<T> extends SuperController {
  late Future<OkCancelResult> Function() showRetryError;

  final disposeBag = DisposeBag();

  T get input => Get.arguments;

  @override
  void onClose() {
    disposeBag.dispose();
    super.onClose();
  }

  @override
  void onDetached() {}

  @override
  void onInactive() {}

  @override
  void onPaused() {}

  @override
  void onResumed() {}

  void back() {
    Get.back();
  }

  void hideKeyboard() {
    FocusManager.instance.primaryFocus?.unfocus();
  }

  void onInitFocus(BuildContext context, FocusNode focusNode) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      FocusScope.of(context).requestFocus(focusNode);
    });

    super.onInit();
  }

  @override
  void onHidden() {}
}
