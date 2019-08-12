import 'package:stream_demo/widget_event.dart' show WidgetEvent;

class MyHomePageEvent extends WidgetEvent {
  MyHomePageEvent._(this.value);
  static final increment = MyHomePageEvent._(0);
  final int value;
}
