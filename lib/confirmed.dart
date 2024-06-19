import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'dart:math' as math;

class OrderConfirmationAnimationWithTickMark extends StatefulWidget {
  const OrderConfirmationAnimationWithTickMark({super.key});

  @override
  _OrderConfirmationAnimationWithTickMarkState createState() =>
      _OrderConfirmationAnimationWithTickMarkState();
}

class _OrderConfirmationAnimationWithTickMarkState
    extends State<OrderConfirmationAnimationWithTickMark>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _borderRadiusAnimation;
  late Animation<double> _tickMarkRotationAnimation;
  late Animation<double> _opacityAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );

    _borderRadiusAnimation = Tween<double>(begin: 0, end: 20).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeInOut,
      ),
    );

    _tickMarkRotationAnimation = Tween<double>(begin: 0, end: math.pi * 2)
        .animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.linear,
      ),
    );

    _opacityAnimation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeIn,
      ),
    );

    _controller.forward();

    // Reverse the animation after 2 seconds
    // SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
    //   Timer(const Duration(seconds: 10), () {
    //     _controller.reverse();
    //   });
    // });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: AnimatedBuilder(
          animation: _controller,
          builder: (context, child) {
            return Stack(
              fit: StackFit.expand,
              children: [
                Container(
                  alignment: Alignment.center,
                  width: 250,
                  height: 100,
                  decoration: BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.circular(_borderRadiusAnimation.value),
                  ),
                  padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                  child: AnimatedOpacity(
                    opacity: _opacityAnimation.value,
                    duration: Duration(seconds: 2),
                    child: const Text(
                      'Your slot is confirmed!',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: 10,
                  right: 20,
                  child: Container(
                    child: Transform.rotate(
                      angle: _tickMarkRotationAnimation.value,
                      child: const Icon(
                        Icons.check,
                        color: Colors.white,
                        size: 32,
                      ),
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}