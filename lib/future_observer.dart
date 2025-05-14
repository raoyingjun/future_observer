import 'observable_future.dart';

/// A Future State Observer.
class FutureObserver implements ObservableFuture {
  // 所有待处理的任务，由子类实现
  final Map<ReturnFutureCallback, Future> _storage = {};

  /// @param {callback} 要观察的函数
  /// @param {wrappedCallback} 用于接受 Future，与要观察的函数关联
  @override
  Future observe(
    ReturnFutureCallback callback,
    Future Function(ReturnFutureCallback callback) wrappedCallback,
  ) {
    final future = wrappedCallback(callback);

    return _storage[callback] = future;
  }

  @override
  bool done(ReturnFutureCallback callback) {
    // TODO: implement done
    throw UnimplementedError();
  }

  @override
  void ignore(ReturnFutureCallback callback) {
    // TODO: implement ignore
  }

  @override
  bool observed(ReturnFutureCallback callback) {
    // TODO: implement observed
    throw UnimplementedError();
  }

  @override
  bool revoke(ReturnFutureCallback callback) {
    // TODO: implement revoke
    throw UnimplementedError();
  }

  @override
  bool running(ReturnFutureCallback callback) {
    // TODO: implement running
    throw UnimplementedError();
  }

  @override
  Future wait(ReturnFutureCallback callback) {
    // TODO: implement wait
    throw UnimplementedError();
  }

  // @override
  // void run(String event, [Future? callback]) {
  //   _storage.putIfAbsent(event);
  //   if (callback != null) {
  //     _storage[event]!.add(callback);
  //   }
  // }
  //
  //
  // @override
  // void unregister(String event, Future callback) {
  //   // TODO: implement unregister
  //   if (event != null) {
  //     if (callback != null) {
  //       _storage[event]?.remove(callback);
  //       if (_storage[event]?.isEmpty ?? false) {
  //         _storage.remove(event);
  //       }
  //     } else {
  //       _storage.remove(event);
  //     }
  //   } else {
  //     _storage.clear();
  //   }
  // }
}
