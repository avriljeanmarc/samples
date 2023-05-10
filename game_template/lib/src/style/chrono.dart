import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../style/chrono_model.dart';

class Chrono extends StatefulWidget {
  final int? laps;

  const Chrono({super.key, this.laps});
  @override
  State<Chrono> createState() => _ChronoState();
}

class _ChronoState extends State<Chrono> {
  late Timer _timer;

  @override
  void initState() {
    super.initState();
    context.read<ChronoModel>().laps = widget.laps!;
    _timer = Timer.periodic(const Duration(milliseconds: 20), (timer) {
      context.read<ChronoModel>().updateModel();
    });
  }

  @override
  void dispose() {
    super.dispose();
    _timer.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Row(
          children: [
            Image.asset(
              'assets/images/futureui1.png',
              width: 140.0,
              height: 40.0,
            ),
          ],
        ),
        Positioned(
          top: 8.0,
          left: 30.0,
          child: Text(
            context.watch<ChronoModel>().timeLap,
            style: TextStyle(
              fontSize: 20.0,
              color: Colors.red,
            ),
          ),
        ),
      ],
    );
  }
}
