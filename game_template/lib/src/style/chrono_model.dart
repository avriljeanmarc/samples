import 'package:flutter/material.dart';

class ChronoModel extends ChangeNotifier {
  String _result = '00:00:00';
  int _laps = 0;
  final Stopwatch _stopwatch = Stopwatch();

  String get timeLap => _result;
  int get laps => _laps;

  set laps(int laps) {
    _laps = laps;
  }

  void startStopWatch() {
    _stopwatch.start();
  }

  void updateModel() {
    _result =
        '${_stopwatch.elapsed.inMinutes.toString().padLeft(2, '0')}:${(_stopwatch.elapsed.inSeconds % 60).toString().padLeft(2, '0')}:${(_stopwatch.elapsed.inMilliseconds % 100).toString().padLeft(2, '0')}';
    if (_stopwatch.elapsed.inSeconds >= _laps) {
      _stopwatch.stop();
      _stopwatch.reset();
    }
    notifyListeners();
  }
}
