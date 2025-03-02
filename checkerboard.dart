import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Checkerboard',
      home: Scaffold(
        //appBar, backgroundColor, Body
        appBar: AppBar(
          //title, backgroundColor
          title: Text("Checkerboard"),
          backgroundColor: Colors.deepOrange,
        ),
        backgroundColor: Colors.blue,
        body: Padding(
          //padding, child
          padding: const EdgeInsets.all(10.0),
          child: Checkerboard(),
        ),
      ),
    );
  }
}

class Checkerboard extends StatelessWidget {
  //create individiual square widget
  @override
  Widget build(BuildContext context) {
    return Container(
      //container has one child
      child: Column(
        //column has 8 children, row has 8
        children: [
          for (int row = 0; row < 8; row++)
            Row(
              children: [
                for (int col = 0; col < 8; col++) Square(row: row, col: col),
              ],
            ),
        ],
      ),
    );
  }
}

/*
Row
Square(row: 0, col: 0)
Square(row: 0, col: 1)
Square(row: 0, col: 2)
Square(row: 0, col: 3)
Square(row: 0, col: 4)
Square(row: 0, col: 5)
Square(row: 0, col: 6)
Square(row: 0, col: 7)

*/
class Square extends StatelessWidget {
  int row;
  int col;

  Square({required this.row, required this.col});

  @override
  Widget build(BuildContext context) {
    bool isBlackSquare = (row + col) % 2 != 0;
    bool initialPosPlayerOne = (row + col) % 2 == 0 && row < 3;
    bool initialPosPlayerTwo = (row + col) % 2 == 0 && row > 4;

    return Container(
      width: 48.5,
      height: 48.5,
      decoration: BoxDecoration(
        color: isBlackSquare ? Colors.black : Colors.white,
      ),
      child: Container(
        //single child meaning one widget inside the container
        child: initialPosPlayerOne
            ? InitialPosPlayerOne()
            : initialPosPlayerTwo
                ? InitialPosPlayerTwo()
                : null,
      ),
    );
  }
}

class InitialPosPlayerOne extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 40,
        height: 40,
        decoration: BoxDecoration(
          color: Colors.red,
          shape: BoxShape.circle,
        ),
      ),
    );
  }
}

class InitialPosPlayerTwo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 40,
        height: 40,
        decoration: BoxDecoration(
          color: Colors.blue,
          shape: BoxShape.circle,
        ),
      ),
    );
  }
}


//layout widget: scaffold, appbar, container, padding, column, row, center
//container: width, height, decoration, color, shape
//ui element: text, image, button
//layout widget can have children
