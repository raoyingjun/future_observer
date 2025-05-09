abstract class BaseFutureObserver {
  // 所有待处理的任务，由子类实现
  abstract final Map<String, List<Future>> _storage;

  // 注册eventName
  void register(String event, [Future callback]);

  // 获取指定已注册的事件
  List<Future> registerOf(String event);

  // 获取全部已注册的事件
  Map<String, List<Future>> registers();

  // 注销已注册的eventName事件
  void unregister(String event, Future callback);

  // 注销已注册事件
  int unregister0f(String event);

  // 取消全部已注册事件
  void unregisters();

  // 判断单个是否被注册
  bool registered(String event);

  // 运行单个/多个/全部事件
  run([String event]);

  // 等待单个/多个/全部事件执行完毕
  wait([String event]);
}
