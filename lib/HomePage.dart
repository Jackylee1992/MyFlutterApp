import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'TopMoviePage.dart';

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

  void checkUserIfLogIn() {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(content: Text('请先登录'));
        });
  }

  // tabBarItem index
  int _currentTabIndex = 0;

  void tabBarItemDidSelected(int index) {
    if (index != _currentTabIndex) {
      checkUserIfLogIn();
      return;
    }
    setState(() {
      _currentTabIndex = index;
    });
  }

  Widget getBody() {
    List<Widget> widgets = [];
    for (var i = 0; i < 15; i++) {
      widgets.add(Text(
        'row-$i',
        style: TextStyle(
          fontSize: 16,
          color: Colors.grey,
          height: 2,
        ),
        textAlign: TextAlign.center,
      ));
      widgets.add(GestureDetector(
        child: Image.asset('images/google_logo.png'),
        onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) => MyHomePage(title: 'Number:$i',)));
        },
      ));
    }
    return ListView(children: widgets);
  }

  @override
  Widget build(BuildContext context) {
    
    final BottomNavigationBar bottomNaviBar = BottomNavigationBar(
      items: [
        BottomNavigationBarItem(
            icon: Icon(Icons.account_balance), title: Text('热映')),
        BottomNavigationBarItem(
            icon: Icon(Icons.account_balance_wallet), title: Text('找片')),
        BottomNavigationBarItem(icon: Icon(Icons.info), title: Text('我的'))
      ],
      onTap: tabBarItemDidSelected,
      currentIndex: _currentTabIndex,
    );

    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      body: TopMoviePage(),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: openLoginPage,
      //   tooltip: 'Increment',
      //   child: Icon(Icons.add),
      // ), // This trailing comma makes auto-formatting nicer for build methods.
      bottomNavigationBar: bottomNaviBar,
    );
  }
}

// Center(
//         // Center is a layout widget. It takes a single child and positions it
//         // in the middle of the parent.
//         child: Column(
//           // Column is also layout widget. It takes a list of children and
//           // arranges them vertically. By default, it sizes itself to fit its
//           // children horizontally, and tries to be as tall as its parent.
//           //
//           // Invoke "debug painting" (press "p" in the console, choose the
//           // "Toggle Debug Paint" action from the Flutter Inspector in Android
//           // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
//           // to see the wireframe for each widget.
//           //
//           // Column has various properties to control how it sizes itself and
//           // how it positions its children. Here we use mainAxisAlignment to
//           // center the children vertically; the main axis here is the vertical
//           // axis because Columns are vertical (the cross axis would be
//           // horizontal).
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             Text(
//               'You have pushed the button this many times:',
//             ),
//             Text(
//               '$_counter',
//               style: Theme.of(context).textTheme.display1,
//             ),
//           ],
//         ),
//       ),
