typedef ReturnFutureCallback = Future Function();

abstract class ObservableFuture {
  // 忽略事件
  void ignore(ReturnFutureCallback callback);

  // 判断事件是否被观察
  bool observed(ReturnFutureCallback callback);

  // 观察事件
  Future observe(
    ReturnFutureCallback callback,
    Future Function(ReturnFutureCallback callback) wrappedCallback,
  );

  // 判断事件是否正在运行
  bool running(ReturnFutureCallback callback);

  // 释放事件
  void revoke(ReturnFutureCallback callback);

  // 判断事件是否已运行
  bool done(ReturnFutureCallback callback);

  // 等待事件执行完毕
  Future wait(ReturnFutureCallback callback);
}
