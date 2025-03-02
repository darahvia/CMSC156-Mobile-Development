import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      // title and background color
      appBar: AppBar(
        title: Text("Laboratory 2 - Stateful"),
        backgroundColor: const Color.fromARGB(255, 189, 189, 189),
      ),
      body: BarHeightController(),
    ));
  }
}

// stateful widget managing the state
class BarHeightController extends StatefulWidget {
  @override
  _BarHeightController createState() => _BarHeightController();
} // creates new instance of state class
// to hold state

// state class that holds states of three height values, changing when sliders are moved
class _BarHeightController extends State<BarHeightController> {
  double height1 = 0; // state variables
  double height2 = 0;
  double height3 = 0;

  @override
  // stateless widgets which are modified depending on _BarHeightController state
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: Column(
        children: [
          Expanded(
            child: Row(
              //arrange the bars side by side
              mainAxisAlignment:
                  MainAxisAlignment.spaceEvenly, //spaces between bars
              crossAxisAlignment:
                  CrossAxisAlignment.end, //start adjusting from the bottom
              children: [
                BarWidget(height: height1, color: Colors.red),
                BarWidget(height: height2, color: Colors.blue),
                BarWidget(height: height3, color: Colors.green),
              ],
            ),
          ),

          // sliders
          Column(
            //stack the sliders vertically
            children: [
              AdjustableSlider(
                label: 'Box 1',
                value: height1,
                color: Colors.red,
                onChanged: (newValue) {
                  setState(() => height1 = newValue);
                }, //height 1 is updated with the new value
                //tells Flutter to rebuild _BarHeightController state to rebuild UI
              ),
              AdjustableSlider(
                label: 'Box 2',
                value: height2,
                color: Colors.blue,
                onChanged: (newValue) {
                  setState(() => height2 = newValue);
                },
              ),
              AdjustableSlider(
                label: 'Box 3',
                value: height3,
                color: Colors.green,
                onChanged: (newValue) {
                  setState(() => height3 = newValue);
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}

// custom widget for each bar
// displays a colored bar
class BarWidget extends StatelessWidget {
  final double height;
  final Color color;

  const BarWidget({required this.height, required this.color}); // constructor

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 80,
      height: height,
      color: color,
    );
  }
}

// custom widget for each slider
// controls height using slider
class AdjustableSlider extends StatelessWidget {
  final String label;
  final double value;
  final Color color;
  final ValueChanged<double>
      onChanged; // slider value changes, passes new value to parent widget

  const AdjustableSlider({
    required this.label,
    required this.value,
    required this.color,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(label),
        Slider(
          value: value,
          min: 0,
          max: 600,
          activeColor: color,
          onChanged:
              onChanged, // when the slider is moved, onchanged is triggered
          //calls setstate in parent when moved
        ),
      ],
    );
  }
}


/*

1. user moves the slider, onchanged triggered, setstate is called and passes the newValue to _BarHeightController
2. inside _BarHeightController, setState updates the height (height1, height2, height3)
3. Flutter rebuilds the build method of _BarHeightController
4. new height value is passed to BarWidget 

parents manages the widgets state
adjustable slider calls onchanged and to update parents state and barwidget gets height from parents state
pd ko lng mn idiritso para easily understood for me

*/

