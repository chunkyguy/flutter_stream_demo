import 'package:flutter/material.dart';
import 'home_page/home_page_controller.dart';
import 'home_page/home_page_main_widget.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // This method is rerun every time setState is called, for instance as done
  // by the _incrementCounter method above.
  //
  // The Flutter framework has been optimized to make rerunning build methods
  // fast, so that you can just rebuild anything that needs updating rather
  // than having to individually change instances of widgets.
  @override
  Widget build(BuildContext context) => HomePageMainWidget(
      title: widget.title,
      viewModelStream: _controller.viewModelStream,
      eventHandler: _controller.eventHandler);

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  final _controller = MyHomePageController();
}
