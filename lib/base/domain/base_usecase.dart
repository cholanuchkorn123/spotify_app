import 'dart:async';

import 'package:dio/dio.dart';
import 'package:spotify_app/app.dart';
import 'package:spotify_app/base/data/model/app_failure.dart';
import 'package:spotify_app/base/domain/base_observer.dart';

import '../../utils/services/log_service.dart';
import '../presentation/common/loading_indicator.dart';

abstract class UseCaseIO<Input, T> extends _UseCase<Input, T> {
  Future<T> build(Input input);

  Future<void> execute({Observer<T>? observer, required Input input}) async {
    return _execute(observer: observer, input: input);
  }

  @override
  Future<Stream<T>> _buildUseCaseStream(Input? input) async {
    final controller = StreamController<T>();

    try {
      final value = await build(input as Input);

      controller.add(value);

      controller.close();
    } catch (e) {
      controller.addError(e);
    }

    return controller.stream;
  }
}

abstract class _UseCase<Input, T> {
  late CompositeSubscription _disposables;

  _UseCase() {
    _disposables = CompositeSubscription();
  }

  void dispose() {
    if (!_disposables.isDisposed) {
      _disposables.dispose();
    }
  }

  Future<Stream<T>> _buildUseCaseStream(Input? input);

  Future<void> _execute({Observer<T>? observer, Input? input}) async {
    observer?.onSubscribe();
    final StreamSubscription subscription =
        (await _buildUseCaseStream(input)).listen(
      (data) {
        observer?.onSuccess(data);
      },
      onDone: observer?.onCompleted(),
      onError: (e) {
        if (e is DioException) {
          observer?.onError(
              Failure(message: e.toString(), stackTrace: e.stackTrace));
          L.error(e.message);
        } else if (e is Error) {
          observer?.onError(
              Failure(message: e.toString(), stackTrace: e.stackTrace!));
          L.error(e);
        } else {
          observer?.onError(
              Failure(message: e.toString(), stackTrace: e.stackTrace!));
          L.error(e);
        }
      },
    );
    _addSubscription(subscription);
  }

  void _addSubscription(StreamSubscription subscription) {
    if (_disposables.isDisposed) {
      _disposables = CompositeSubscription();
    }
    _disposables.add(subscription);
  }
}

class CompositeSubscription {
  bool _isDisposed = false;

  final List<StreamSubscription<dynamic>> _subscriptionsList = [];

  bool get isDisposed => _isDisposed;

  int get length => _subscriptionsList.length;

  bool get isEmpty => _subscriptionsList.isEmpty;

  bool get isNotEmpty => _subscriptionsList.isNotEmpty;

  bool get allPaused => _subscriptionsList.isNotEmpty
      ? _subscriptionsList.every((it) => it.isPaused)
      : false;

  StreamSubscription<T> add<T>(StreamSubscription<T> subscription) {
    if (isDisposed) {
      throw ('This composite was disposed, try to use new instance instead');
    }
    if (_subscriptionsList.isNotEmpty) {
      remove(_subscriptionsList.last);
    }
    _subscriptionsList.add(subscription);

    return subscription;
  }

  void remove(StreamSubscription<dynamic> subscription) {
    subscription.cancel();
    _subscriptionsList.remove(subscription);
  }

  void clear() {
    _subscriptionsList.forEach((it) => it.cancel());
    _subscriptionsList.clear();
  }

  void dispose() {
    clear();
    _isDisposed = true;
  }

  void pauseAll([Future? resumeSignal]) =>
      _subscriptionsList.forEach((it) => it.pause(resumeSignal));

  void resumeAll() => _subscriptionsList.forEach((it) => it.resume());
}

extension AddToCompositeSubscriptionExtension<T> on StreamSubscription<T> {
  void addTo(CompositeSubscription compositeSubscription) =>
      compositeSubscription.add(this);
}
