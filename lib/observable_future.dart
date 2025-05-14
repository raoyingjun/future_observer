typedef ReturnFutureCallback = Future Function();

abstract class ObservableFuture {
  // 忽略事件
  Future? ignore(ReturnFutureCallback callback);

  /// @param {callback} 检测关联的 callback
  bool observed(ReturnFutureCallback callback);

  /// @param {callback} 要关联的 callback
  /// @param {wrappedCallback} 用于接受 Future，与要关联的函数关联
  Future observe(
    ReturnFutureCallback callback,
    Future Function(ReturnFutureCallback callback) wrappedCallback,
  );

  // 判断事件是否正在运行
  bool running(ReturnFutureCallback callback);

  // 判断事件是否已运行
  bool done(ReturnFutureCallback callback);

  // 等待事件执行完毕
  Future? wait(ReturnFutureCallback callback);

  // 清除所有事件
  void clear(ReturnFutureCallback callback);
}
