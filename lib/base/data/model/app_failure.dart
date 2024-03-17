import 'package:freezed_annotation/freezed_annotation.dart';

part 'app_failure.freezed.dart';

@freezed
class Failure with _$Failure {
  const factory Failure({
    required String message,
    required StackTrace stackTrace,
  }) = _Failure;
}
