import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:random_words/random_words.dart';

/// word game 6/6/21
void main() => runApp(new WordGame());

class WordGame extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Word Game',
      home: new RandomSentences(),
    );
  }
}

class RandomSentences extends StatefulWidget {
  @override
  createState() => new RandomSentencesState();
}

class RandomSentencesState extends State<RandomSentences> {
  final _sentences = <String>[];
  final _funnies = new Set<String>();
  final _biggerfont = const TextStyle(fontSize: 14.0);
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Word Game"),
        actions: [
          new IconButton(
            icon: new Icon(Icons.list),
            onPressed: _pushfunnies,
          )
        ],
      ),
      body: _buildSentences(),
    );
  }

  void _pushfunnies() {
    Navigator.of(context).push(
      new MaterialPageRoute(builder: (context) {
        final tiles = _funnies.map(
          (sentence) {
            return new ListTile(
              title: new Text(
                sentence,
                style: _biggerfont,
              ),
            );
          },
        );
        final divided = ListTile.divideTiles(
          context: context,
          tiles: tiles,
        ).toList();
        return new Scaffold(
          appBar: new AppBar(
            title: new Text('Svaed Funny Snetences'),
          ),
          body: new ListView(children: divided),
        );
      }),
    );
  }

  String _getSentence() {
    final noun = new WordNoun.random();
    final adjective = new WordAdjective.random();
    return "Word Noun: ${noun.asCapitalized}\n"
        "Sentence: The programmer wrote a ${adjective.asCapitalized} app in Flutter and showed it to his ${noun.asCapitalized}";
  }

  Widget _buildRow(String sentence) {
    final alreadyFoundfunny = _funnies.contains(sentence);

    return new ListTile(
      title: new Text(
        sentence,
        style: _biggerfont,
      ),
      trailing: new Icon(
        alreadyFoundfunny ? Icons.thumb_up : Icons.thumb_down,
        color: alreadyFoundfunny ? Colors.green : null,
      ),
      onTap: () {
        setState(() {
          if (alreadyFoundfunny) {
            _funnies.remove(sentence);
          } else {
            _funnies.add(sentence);
          }
        });
      },
    );
  }

  Widget _buildSentences() {
    return new ListView.builder(
      padding: const EdgeInsets.all(16.0),
      itemBuilder: (context, i) {
        if (i.isOdd) return new Divider();
        final index = i ~/ 2;
        if (index >= _sentences.length) {
          for (int x = 0; x < 1; x++) {
            _sentences.add(_getSentence());
          }
        }
        return _buildRow(_sentences[index]);
      },
    );
  }
}



/// basic icon button appbar navbar
// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return new MaterialApp(
//       title: 'Welcome to Flutter',
//       home: new Scaffold(
//         appBar: new AppBar(
//           title: new Text("Flutter Intro"),
//           leading: new Icon(Icons.alarm_on),
//           actions: [
//             new IconButton(
//               icon: new Icon(Icons.sports_football),
//               tooltip: 'Hello!',
//               onPressed: () => {},
//             ),
//             new IconButton(
//               icon: new Icon(Icons.cake_rounded),
//               onPressed: () => {},
//             ),
//           ],
//         ),
//         bottomNavigationBar: new BottomNavigationBar(items: [
//           new BottomNavigationBarItem(
//             icon: new Icon(Icons.account_balance),
//             label: 'Bank',
//           ),
//           new BottomNavigationBarItem(
//             icon: new Icon(Icons.badge),
//             label: 'Badge',
//           ),
//           new BottomNavigationBarItem(
//             icon: new Icon(Icons.money),
//             label: "BDT",
//           )
//         ]),
//         body: new Container(
//           padding: const EdgeInsets.all(20.0),
//           child: new Column(
//             children: [
//               new Text("Hello World"),
//               new TextField(
//                 decoration: new InputDecoration(
//                   border: InputBorder.none,
//                   hintText: "Please Enter Text!",
//                 ),
//               ),
//               new Checkbox(
//                 value: true,
//                 onChanged: (bool value) {},
//               ),
//               new Radio(
//                 value: 0,
//                 groupValue: 0,
//                 onChanged: (_) {},
//               ),
//               new Switch(
//                 value: false,
//                 onChanged: (_) {},
//               ),
//               new ButtonBar(
//                 mainAxisSize: MainAxisSize.min,
//                 children: [
//                   new ElevatedButton(
//                     onPressed: () => {},
//                     child: const Text("Elevated"),
//                   ),
//                   new ElevatedButton(
//                     onPressed: null,
//                     child: const Text("Disabled"),
//                   ),
//                 ],
//               ),
//               new ButtonBar(
//                 mainAxisSize: MainAxisSize.min,
//                 children: [
//                   new TextButton(
//                     onPressed: () => {},
//                     child: const Text("Text"),
//                   ),
//                   new TextButton(
//                     onPressed: null,
//                     child: const Text("Disabled"),
//                   ),
//                 ],
//               ),
//               new ButtonBar(
//                 mainAxisSize: MainAxisSize.min,
//                 children: [
//                   new OutlinedButton(
//                     onPressed: () => {},
//                     child: const Text("Outlined"),
//                   ),
//                   new OutlinedButton(
//                     onPressed: null,
//                     child: const Text("Disabled"),
//                   ),
//                 ],
//               ),
//               // new Image.network(
//               //   "https://i.gifer.com/138n.gif",
//               // ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }






///default template
// import 'package:flutter/material.dart';

// void main() {
//   runApp(MyApp());
// }

// class MyApp extends StatelessWidget {
//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Demo',
//       theme: ThemeData(
//         // This is the theme of your application.
//         //
//         // Try running your application with "flutter run". You'll see the
//         // application has a blue toolbar. Then, without quitting the app, try
//         // changing the primarySwatch below to Colors.green and then invoke
//         // "hot reload" (press "r" in the console where you ran "flutter run",
//         // or simply save your changes to "hot reload" in a Flutter IDE).
//         // Notice that the counter didn't reset back to zero; the application
//         // is not restarted.
//         primarySwatch: Colors.blue,
//       ),
//       home: MyHomePage(title: 'Flutter Demo Home Page'),
//     );
//   }
// }

// class MyHomePage extends StatefulWidget {
//   MyHomePage({Key key, this.title}) : super(key: key);

//   // This widget is the home page of your application. It is stateful, meaning
//   // that it has a State object (defined below) that contains fields that affect
//   // how it looks.

//   // This class is the configuration for the state. It holds the values (in this
//   // case the title) provided by the parent (in this case the App widget) and
//   // used by the build method of the State. Fields in a Widget subclass are
//   // always marked "final".

//   final String title;

//   @override
//   _MyHomePageState createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {
//   int _counter = 0;

//   void _incrementCounter() {
//     setState(() {
//       // This call to setState tells the Flutter framework that something has
//       // changed in this State, which causes it to rerun the build method below
//       // so that the display can reflect the updated values. If we changed
//       // _counter without calling setState(), then the build method would not be
//       // called again, and so nothing would appear to happen.
//       _counter++;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     // This method is rerun every time setState is called, for instance as done
//     // by the _incrementCounter method above.
//     //
//     // The Flutter framework has been optimized to make rerunning build methods
//     // fast, so that you can just rebuild anything that needs updating rather
//     // than having to individually change instances of widgets.
//     return Scaffold(
//       appBar: AppBar(
//         // Here we take the value from the MyHomePage object that was created by
//         // the App.build method, and use it to set our appbar title.
//         title: Text(widget.title),
//       ),
//       body: Center(
//         // Center is a layout widget. It takes a single child and positions it
//         // in the middle of the parent.
//         child: Column(
//           // Column is also a layout widget. It takes a list of children and
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
//               style: Theme.of(context).textTheme.headline4,
//             ),
//           ],
//         ),
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: _incrementCounter,
//         tooltip: 'Increment',
//         child: Icon(Icons.add),
//       ), // This trailing comma makes auto-formatting nicer for build methods.
//     );
//   }
// }
