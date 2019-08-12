import 'dart:async';
import 'package:meta/meta.dart';

abstract class WidgetEvent {}

abstract class WidgetEventHandler<T extends WidgetEvent> {
  void handle({@required T event});
}

class WidgetEventController<T extends WidgetEvent>
    implements WidgetEventHandler<T> {

  @override
  void handle({@required T event}) => _event.add(event);

  void listen(void onData(T event),
      {Function onError, void onDone(), bool cancelOnError}) {
    _streamSubscription.add(event.listen(onData,
        onError: onError, onDone: onDone, cancelOnError: cancelOnError));
  }

  void dispose() {
    for (var listener in _streamSubscription) {
      listener.cancel();
    }
  }

  Stream<T> get event => _event.stream;
  WidgetEventHandler<T> get eventHandler => this;
  final _event = StreamController<T>();
  final List<StreamSubscription<T>> _streamSubscription = [];
}
