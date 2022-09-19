import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Startup Name Generator',
      home: RandomWords(),
    );
  }
}
//@override
// Widget build(BuildContext context) {
//   // final wordPair = WordPair.random();
//   return MaterialApp(
//     title: 'Welcome to Flutter',
//     home: Scaffold(
//       appBar: AppBar(
//         title: const Text('Welcome to Flutter'),
//       ),
//       // body: const Center(
//       //   child: Text('Hello World'),
//       // ),
//       // body: Center(
//       //   child: Text(wordPair.asPascalCase),
//       // )),
//       // body: const Center(
//       //   child: RandomWords(),
//       // ),
//       body: ListView.builder(
//         padding: const EdgeInsets.all(16.0),
//         itemBuilder: /*1*/ (context, i) {
//           if (i.isOdd) return const Divider(); /*2*/

//           final index = i ~/ 2; /*3*/
//           if (index >= _suggestions.length) {
//             _suggestions.addAll(generateWordPairs().take(10)); /*4*/
//           }
//           return ListTile(
//             title: Text(
//               _suggestions[index].asPascalCase,
//               style: _biggerFont,
//             ),
//           ); // End of ListTile
//         }, //End of itemBuilder
//       ), //End of body:ListView.builder
//     ),//End of Scaffold
//   );//End of Material app
// } //End of build Widget

class RandomWords extends StatefulWidget {
  const RandomWords({Key? key}) : super(key: key);

  @override
  _RandomWordsState createState() => _RandomWordsState();
}

class _RandomWordsState extends State<RandomWords> {
  final _suggestions = <WordPair>[];
  final _biggerFont = const TextStyle(fontSize: 18.0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Startup Name Generator'),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16.0),
        itemBuilder: /*1*/ (context, i) {
          // The itemBuilder callback is called once per suggested word pairing, and places each suggestion
          // into a ListTile row. For even rows, the function adds a ListTile row for the word pairing.
          // For odd rows, the function adds a Divider widget to visually separate the entries.
          // Note that the divider might be difficult to see on smaller devices.

          if (i.isOdd) return const Divider(); /*2*/
          // Add a one-pixel-high divider widget before each row in the ListView.

          final index = i ~/ 2; /*3*/
          // The expression i ~/ 2 divides i by 2 and returns an integer result.
          // For example: 1, 2, 3, 4, 5 becomes 0, 1, 1, 2, 2.
          // This calculates the actual number of word pairings in the ListView, minus the divider widgets.

          if (index >= _suggestions.length) {
            _suggestions.addAll(generateWordPairs().take(10)); /*4*/

            // If you’ve reached the end of the available word pairings,
            // then generate 10 more and add them to the suggestions list.

          }
          return ListTile(
            title: Text(
              _suggestions[index].asPascalCase,
              style: _biggerFont,
            ),
          );
        },
      ),
    );
  }
}
