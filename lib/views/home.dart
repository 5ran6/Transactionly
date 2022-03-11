import 'package:flutter/material.dart';
import 'package:transactionly/imports/imports.dart';

//enum to declare 3 state of button
enum ButtonState { init, requesting, completed }

class Home extends StatefulWidget {
  const Home({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool isAnimating = true;
  
  ButtonState state = ButtonState.init;

  @override
  Widget build(BuildContext context) {
    final buttonWidth = MediaQuery.of(context).size.width;
    // update the UI depending on below variable values
    final isInit = isAnimating || state == ButtonState.init;
    final isDone = state == ButtonState.completed;
    return Scaffold(
      body: Container(
        color: Colors.white,
        alignment: Alignment.center,
        padding: EdgeInsets.all(40),
        child: AnimatedContainer(
            duration: Duration(milliseconds: 300),
            onEnd: () => setState(() {
                  isAnimating = !isAnimating;
                }),
            width: state == ButtonState.init ? buttonWidth : 70,
            height: 60,
            // If Button State is requesting or Completed  show 'buttonCircular' widget as below
            child: isInit ? buildButton() : circularContainer(isDone)),
      ),
    );
  }

// If Button State is init : show Normal submit button
  Widget buildButton() => ElevatedButton(
        style: ElevatedButton.styleFrom(shape: const StadiumBorder()),
        onPressed: () async {
          // here when button is pressed
          // we are changing the state
          // therefore depending on state our button UI changed.
          setState(() {
            state = ButtonState.requesting;
          });
          //await 2 sec // you need to implement your server response here.
          await Future.delayed(Duration(seconds: 2));
          setState(() {
            state = ButtonState.completed;
          });
          await Future.delayed(Duration(seconds: 2));
          setState(() {
            state = ButtonState.init;
          });
        },
        child: const Text('Fetch Transactions'),
      );

// this is custom Widget to show rounded container
// here is state is requesting, we are showing loading indicator on container then.
// if it completed then showing a Icon.
  Widget circularContainer(bool done) {
    final color = done ? Colors.green : Colors.blue;
    return Container(
      decoration: BoxDecoration(shape: BoxShape.circle, color: color),
      child: Center(
        child: done
            ? const Icon(Icons.done, size: 50, color: Colors.white)
            : const CircularProgressIndicator(
                color: Colors.white,
              ),
      ),
    );
  }
}
