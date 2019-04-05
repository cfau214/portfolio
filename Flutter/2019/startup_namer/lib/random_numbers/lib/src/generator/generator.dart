import 'package:flutter/material.dart';
import 'dart:math';

class RandomNumbers extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new RandomState();
}

class RandomState extends State<RandomNumbers> {
  final _generatedNumbers = new List<int>();
  final _biggerFont = const TextStyle(fontSize: 18.0);
  Random rand = new Random(DateTime.now().hashCode);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Random Number Generator'),
        centerTitle: true,
      ),
      body: _buildNumbers(),
    );
  }

  Widget _buildNumbers() {
    return ListView.builder(
        padding: const EdgeInsets.all(16.0),
        itemBuilder: (context, i) {
          if (i.isOdd) return Divider();

          final index = i ~/ 2;
          if (index >= _generatedNumbers.length) {
            for (int i = 0; i < 10; i++) {
              _generatedNumbers.add(rand.nextInt(100) + 1);
            }
          }
          return _buildRow(_generatedNumbers[index]);
        });
  }

  Widget _buildRow(int num) {
    return ListTile(
      title: Text(
        num.toString(),
        style: _biggerFont,
      ),
    );
  }
}