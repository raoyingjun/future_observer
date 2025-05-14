import 'dart:ui';

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
    // 将行为抛给用户自行处理，等待用户返回 future
    final future = wrappedCallback(callback);
    // future 观察 callback
    return _storage[callback] = future;
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
  Future? wait(ReturnFutureCallback callback) {
    return _storage[callback];
  }

  @override
  void clear() {
    _storage.clear();
  }
}

// 暂不需要
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
