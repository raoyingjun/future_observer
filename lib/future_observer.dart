import 'basic_future_observer.dart';

/// A Future State Observer.
class FutureObserver implements BaseFutureObserver {
  @override
  Map<String, List<Future>> _storage = {};

  @override
  void register(String event, [Future? callback]) {
    // TODO: implement register
    _storage.putIfAbsent(event, () => []);
    if (callback != null) {
      _storage[event]!.add(callback);
    }
  }

  @override
  List<Future> registerOf(String event) {
    // TODO: implement registerOf
    throw UnimplementedError();
  }

  @override
  bool registered(String event) {
    // TODO: implement registered
    return _storage.containsKey(event);
    throw UnimplementedError();
  }

  @override
  Map<String, List<Future>> registers() {
    // TODO: implement registers
    throw UnimplementedError();
  }

  @override
  run([String? event]) {
    // TODO: implement run
    throw UnimplementedError();
  }

  @override
  void unregister(String event, Future callback) {
    // TODO: implement unregister
    if (event != null) {
      if (callback != null) {
        _storage[event]?.remove(callback);
        if (_storage[event]?.isEmpty ?? false) {
          _storage.remove(event);
        }
      } else {
        _storage.remove(event);
      }
    } else {
      _storage.clear();
    }
  }

  @override
  int unregister0f(String event) {
    // TODO: implement unregister0f
    throw UnimplementedError();
  }

  @override
  void unregisters() {
    // TODO: implement unregisters
  }

  @override
  wait([String? event]) {
    // TODO: implement wait
    throw UnimplementedError();
  }
}
