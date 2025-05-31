import 'dart:async';

import 'package:flutter/material.dart';
import 'package:gerenciamento_estado/contracts/observable_state.dart';
import 'package:gerenciamento_estado/controllers/change_state.dart';

class StateObservable<T> extends ChangeState implements ObservableState {
  T _state;

  @override
  T get state => _state;

  set state(T newState) {
    if (newState == _state) return;
    _state = newState;
    notifyCallback();
  }

  StateObservable(this._state);
}

extension ObservableStream<T> on StateObservable<T> {
  Stream<T> asStram() {
    StreamController<T> streamController = StreamController<T>();

    streamController.add(state);

    void callback() {
      streamController.add(state);
    }

    addListener(callback);

    return streamController.stream;
  }
}

extension ObservableValueNotifier<T> on ValueNotifier<T> {
  Stream<T> asStream() {
    StreamController<T> streamController = StreamController<T>();

    streamController.add(value);

    void callback() {
      streamController.add(value);
    }

    addListener(callback);

    return streamController.stream;
  }
}
