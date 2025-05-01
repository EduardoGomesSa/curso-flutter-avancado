import 'package:flutter_test/flutter_test.dart';
import 'package:gerenciamento_estado/controllers/change_state.dart';

void main() {
  group("Should test ChangeState", () {
    test("Should increment counter", () {
      //arrange
      final _CounterChangeState changeState = _CounterChangeState();

      //act
      changeState.increment();

      //assert
      expect(changeState.counter, 1);
    });

    test("Should execute callback", () {
      //arrange
      bool callbackChanged = false;
      final _CounterChangeState changeState = _CounterChangeState();
      void callback() {
        callbackChanged = true;
      }

      //act
      changeState.addListener(callback);
      changeState.increment();

      //assert
      expect(changeState.counter, 1);
      expect(callbackChanged, true);
    });
  });
}

class _CounterChangeState extends ChangeState {
  int counter = 0;

  void increment() {
    counter++;
    notifyCallback();
  }
}
