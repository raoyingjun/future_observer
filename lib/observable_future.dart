/// 函数返回值必须是 future 对象
typedef ReturnFutureCallback = Function;

abstract class ObservableFuture {
  /// @param {callback} 忽略指定事件
  Future? ignore(ReturnFutureCallback callback);

  /// @param {callback} 判断指定 callback 关联的 future 是否被观察
  bool observed(ReturnFutureCallback callback);

  /// @param {callback} 要观察的 callback
  /// @param {wrappedCallback} 用于接受 Future，与要观察的函数观察
  Future observe(
    ReturnFutureCallback callback,
    Future Function(ReturnFutureCallback callback) wrappedCallback,
  );

  // // 判断事件是否正在运行
  // bool? running(ReturnFutureCallback callback);
  //
  // // 判断事件是否已运行
  // bool? done(ReturnFutureCallback callback);

  /// @param {callback} 等待 callback 关联的 future 执行完毕
  Future? wait(ReturnFutureCallback callback);

  /// @param {callback} 清除指定/全部 callback 关联的 future
  void clear();
}
