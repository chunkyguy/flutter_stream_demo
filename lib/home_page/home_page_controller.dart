import 'dart:async';
import 'package:stream_demo/widget_event.dart';
import 'home_page_event.dart';
import 'home_page_viewmodel.dart';

class MyHomePageController {
  MyHomePageController() {
    _eventController.listen(
            (e) => _viewModelStream.add(MyHomePageViewModel(counter: ++_counter)));
  }
  void dispose() {
    _eventController.dispose();
  }
  Stream<MyHomePageViewModel> get viewModelStream => _viewModelStream.stream;
  WidgetEventHandler<MyHomePageEvent> get eventHandler =>
      _eventController.eventHandler;
  int _counter = 0;
  final _eventController = WidgetEventController<MyHomePageEvent>();
  final _viewModelStream = StreamController<MyHomePageViewModel>();
}
