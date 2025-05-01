import 'package:gerenciamento_estado/contracts/observable.dart';

class ChangeState implements Observable {
  final List<void Function()> _callback = [];
  @override
  void addListener(void Function() callback) {
    if (!_callback.contains(callback)) _callback.add(callback);
  }

  @override
  void removeListener(void Function() callback) {
    if (_callback.contains(callback)) _callback.remove(callback);
  }

  void notifyCallback() {
    for (int i = 0; i < _callback.length; i++) {
      _callback[i].call();
    }
  }
}
