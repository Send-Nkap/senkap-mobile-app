import 'package:flutter/material.dart';

import '../ressources/constants.dart';

class AnimatedProgressWidget extends StatefulWidget {
  final int totalDuration;
  final int delay;

  AnimatedProgressWidget({required this.totalDuration, required this.delay});

  @override
  _AnimatedProgressWidgetState createState() => _AnimatedProgressWidgetState();
}

class _AnimatedProgressWidgetState extends State<AnimatedProgressWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _progressAnimation;

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      vsync: this,
      duration: Duration(seconds: widget.totalDuration),
    );

    _progressAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(_animationController)
      ..addListener(() {
        setState(() {});
      });

    Future.delayed(Duration(seconds: widget.delay), () {
      _animationController.forward();
    });

    _animationController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        // L'animation est terminée, vous pouvez réinitialiser ou effectuer d'autres actions ici
      }
    });
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Constants.screenWidth(context) / 4.7,
      height: 5.0,
      decoration: BoxDecoration(
        color: Colors.grey[300],
        borderRadius: BorderRadius.circular(5.0),
      ),
      child: Stack(
        children: <Widget>[
          Container(
            width: MediaQuery.of(context).size.width * _progressAnimation.value,
            height: 5.0,
            decoration: BoxDecoration(
              color: Colors.blue,
              borderRadius: BorderRadius.circular(5.0),
            ),
          ),
        ],
      ),
    );
  }
}
