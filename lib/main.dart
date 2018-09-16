import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
//    final wordPair = WordPair.random();
    return MaterialApp(
      title: 'Programmer Semarang',
      home: RandomWords(),
//      home: Scaffold(
//        appBar: AppBar(
//          title: Text('Welcoming Here !!'),
//        ),
//        body: Center(
//          child: RandomWords(),
//        ),
//      ),
    );
  }
}

class RandomWordsState extends State<RandomWords>{
  final _suggestions = <WordPair>[];
  final _biggerfont = const TextStyle(fontSize: 20.0);

  Widget _buildSuggestions(){
    return ListView.builder(
        padding: const EdgeInsets.all(16.0),
        itemBuilder: (context, i){
          if (i.isOdd) return Divider();
          final index = i ~/2;

          if (index >= _suggestions.length){
            _suggestions.addAll(generateWordPairs().take(10));
          }
          return _buildRow(_suggestions[index]);
        }
    );
  }
  @override
  Widget build(BuildContext context){
//    final wordPair = WordPair.random();
//    return Text(wordPair.asUpperCase);
  return Scaffold(
    appBar: AppBar(
      title: Text('Programmer Semarang'),
    ),
    body: _buildSuggestions(),
  );
  }

  Widget _buildRow(WordPair pair) {
    return ListTile(
      title: Text(
        pair.asUpperCase,
        style: _biggerfont,
      ),
    );
  }
}

class RandomWords extends StatefulWidget{
  @override
  RandomWordsState createState() => RandomWordsState();

}
