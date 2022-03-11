import 'package:weight_tracker/imports/imports.dart';
import 'dart:math' as math;

class Animations {
  Widget rotatingLogo(
      _controller, color
      ) {
    return Center(
      child: AnimatedBuilder(
        animation: _controller,
        builder: (_, child) {
          return Transform.rotate(
            angle: _controller.value * 2 * math.pi,
            child: child,
          );
        },
        child: Container(
          width: 50,
          height: 50,
          child: Image.asset(
            'assets/blue_logo.png',
            width: 50.0,
            fit: BoxFit.fitWidth,
            color: color,
          ),
        ),
      ),
    );
  }



}