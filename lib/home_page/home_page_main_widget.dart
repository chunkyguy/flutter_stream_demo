import 'package:flutter/material.dart';
import 'package:stream_demo/widget_event.dart' show WidgetEventHandler;
import 'home_page_event.dart';
import 'home_page_viewmodel.dart';

class HomePageMainWidget extends StatelessWidget {
  HomePageMainWidget(
      {@required this.title,
        @required this.viewModelStream,
        @required this.eventHandler});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          // Column is also layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Invoke "debug painting" (press "p" in the console, choose the
          // "Toggle Debug Paint" action from the Flutter Inspector in Android
          // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
          // to see the wireframe for each widget.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            StreamBuilder(
                stream: viewModelStream,
                builder: (BuildContext context,
                    AsyncSnapshot<MyHomePageViewModel> snapshot) {
                  String data = '';
                  if (snapshot.hasError) {
                    data = 'Error: ${snapshot.error.toString()}';
                  }

                  switch (snapshot.connectionState) {
                    case ConnectionState.none:
                    case ConnectionState.waiting:
                      data = '0';
                      break;
                    case ConnectionState.active:
                    case ConnectionState.done:
                      data = '${snapshot.data.counter}';
                      break;
                  }

                  return Text(
                    data,
                    style: Theme.of(context).textTheme.display1,
                  );
                })
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => eventHandler.handle(event: MyHomePageEvent.increment),
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  final String title;
  final Stream<MyHomePageViewModel> viewModelStream;
  final WidgetEventHandler<MyHomePageEvent> eventHandler;
}
