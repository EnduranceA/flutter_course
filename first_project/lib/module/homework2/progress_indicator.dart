import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:liquid_progress_indicator/liquid_progress_indicator.dart';

class ProgressIndicatorPage extends StatefulWidget {
  const ProgressIndicatorPage({Key? key}) : super(key: key);

  static String routeName = '/second_homework/animation';

  @override
  State<StatefulWidget> createState() => _ProgressIndicatorPageState();
}

class _ProgressIndicatorPageState extends State<ProgressIndicatorPage>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3),
    );

    _animationController.addListener(() => setState(() {}));
    _animationController.addStatusListener(animationStatusListener);
    _animationController.forward();
  }

  void animationStatusListener(AnimationStatus status) {
    if (status == AnimationStatus.completed) {
      _animationController.stop();
      Modular.to.pushNamed("/second_homework/home");
    } else if (status == AnimationStatus.dismissed) {
      _animationController.forward();
    }
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final percentage = _animationController.value * 100;
    return Center(
      child: SizedBox(
        width: 150.0,
        height: 150.0,
        child: LiquidCircularProgressIndicator(
          value: _animationController.value,
          backgroundColor: Colors.white,
          valueColor: const AlwaysStoppedAnimation(Colors.blue),
          center: Text(
            "${percentage.toStringAsFixed(0)}%",
            style: const TextStyle(
              color: Colors.lightBlueAccent,
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
