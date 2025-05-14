import 'package:flutter_test/flutter_test.dart';
import 'package:future_observer/future_observer.dart';

void main() {
  Future task(int delay, dynamic result) {
    return Future.delayed(Duration(seconds: delay), () => result);
  }

  test('观察及等待异步任务', () async {
    final observer = FutureObserver();
    observer.observe(task, (getAsyncUserId) => getAsyncUserId(3, 24167));
    print('模拟异步请求用户 ID，等待 3 秒');
    expect(await observer.wait(task), 24167);
    print('成功获取用户 ID，异步任务完成');
  });
}
