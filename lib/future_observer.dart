import 'package:flutter/cupertino.dart';

import 'observable_future.dart';

/// A Future State Observer.
class FutureObserver implements ObservableFuture {
  // 所有待处理的任务，由子类实现
  final Map<ReturnFutureCallback, Future> _storage = {};

  @override
  Future observe(
    ReturnFutureCallback callback,
    Future Function(ReturnFutureCallback callback) wrappedCallback,
  ) {
    // 拿到 future 关联 callback
    final future = wrappedCallback(callback);

    return _storage[callback] = future;
  }

  @override
  bool done(ReturnFutureCallback callback) {
    // TODO: implement done
    throw UnimplementedError();
  }

  @override
  Future? ignore(ReturnFutureCallback callback) {
    return _storage.remove(callback);
  }

  @override
  bool observed(ReturnFutureCallback callback) {
    return _storage.containsKey(callback);
  }

  @override
  bool running(ReturnFutureCallback callback) {
    // TODO: implement running
    throw UnimplementedError();
  }

  @override
  Future? wait(ReturnFutureCallback callback) {
    return _storage[callback];
  }

  @override
  void clear(ReturnFutureCallback callback) {
    return _storage.clear();
  }
}

// final class FutureRecord {
//   Future future;
//   bool done;
//   bool running;
//
//   FutureRecord({required this.future, this.done = false, this.running = true});
//
//   FutureRecord.of(this.future) : done = false, running = false;
//
//   complete() {
//     done = true;
//     running = false;
//   }
// }
