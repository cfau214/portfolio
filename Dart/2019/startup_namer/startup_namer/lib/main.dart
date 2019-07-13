
import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp (
      title: 'Random Gen',
      home: RandomWords()
    );
  }
}

class RandomWordsState extends State<RandomWords> {
  final _suggestions = <WordPair>[];
  final _biggerFont = const TextStyle(fontSize: 16.0);

  @override
  Widget build(BuildContext context) {  
    return Scaffold (
      appBar: AppBar (
        title: Text('Infinite Generator'),
      ),
      body: _buildSuggestions()
    );
  }

  Widget _buildSuggestions() {
    return ListView.builder(
        padding: EdgeInsets.all(16.0),
        itemBuilder: (context, i) {
          if (i.isOdd) return Divider();

          final index = i ~/ 2;
          if (index >= _suggestions.length) {
            _suggestions.addAll(generateWordPairs().take(10));
          }

          return _buildRow(_suggestions[index]);
        },
    );
  }

  Widget _buildRow(WordPair pair) {
    bool titleStatus = false;
    final _styleOnClick = TextStyle(color: Colors.blue);

    return ListTile (
      leading: Icon(getIcon(pair.asPascalCase)),
      title: Text(pair.asPascalCase, style: titleStatus == false ? _biggerFont : _styleOnClick),
      onTap: () {
        titleStatus = !titleStatus;
      }
    );
  }

  IconData getIcon(String pair) {
    IconData icon;

    switch (pair.toLowerCase()[0]) {
      case 'a':
        icon = Icons.android;
        break;
      case 'b':
        icon = Icons.battery_alert;
        break;
      case 'c':
        icon = Icons.cake;
        break;
      case 'h':
        icon = Icons.home;
        break;

      default:
        icon = null;
        break;
    }

    return icon;
  }
}

class RandomWords extends StatefulWidget {
  @override
  RandomWordsState createState() => RandomWordsState();
}
