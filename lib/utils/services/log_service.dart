import 'package:get/get.dart';
import 'package:jiffy/jiffy.dart';
import 'package:logger/logger.dart';

class L {
  static final LogServiceImpl _logService = Get.find();

  static void verbose(dynamic message) {
    _logService.logger.v(message);
  }

  static void debug(dynamic message) {
    _logService.logger.d(message);
  }

  static void info(dynamic message) {
    _logService.logger.i(message);
  }

  static void warning(dynamic message) {
    _logService.logger.w(message);
  }

  static void error(dynamic message) {
    _logService.logger.e(message);
  }

  static void wtf(dynamic message) {
    _logService.logger.wtf(message);
  }
}

class LogServiceImpl extends GetxService {
  final logger = Logger(
    printer: MyPrinter(),
  );
}

class MyPrinter extends LogPrinter {
  @override
  List<String> log(LogEvent event) {
    final msg = event.message;
    final time =
        Jiffy.parseFromDateTime(DateTime.now()).format(pattern: 'h:mm:ss a');

    return ['[$time]  $msg'];
  }
}
