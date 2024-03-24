import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';
import 'package:spotify_app/app.dart';
import 'package:spotify_app/base/presentation/common/loading_indicator.dart';
import '/base/presentation/base_controller.dart';

export 'package:flutter/material.dart';

export 'package:get/get_navigation/get_navigation.dart';
export 'package:get/get_state_manager/get_state_manager.dart';
export 'package:get/get_utils/src/extensions/context_extensions.dart';

abstract class BaseGetView<W extends BaseController> extends GetView<W> {
  const BaseGetView({super.key});

  @protected
  Widget myBuild(BuildContext context);

  @override
  Widget build(BuildContext context) {
    return myBuild(context);
  }
}
