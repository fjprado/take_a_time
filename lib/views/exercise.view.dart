import 'dart:async';
import 'package:audioplayer/audioplayer.dart';
import 'package:flutter/material.dart';
import 'package:take_a_time/views/home.view.dart';
import 'package:take_a_time/widgets/animated-flip-counter.widget.dart';
import 'package:take_a_time/widgets/button.widget.dart';

class ExercisePage extends StatefulWidget {
  final ctrlDelay;
  final ctrlTime;
  final ctrlTurns;
  final ctrlRest;

  ExercisePage(
      {@required this.ctrlDelay,
      @required this.ctrlTime,
      @required this.ctrlTurns,
      @required this.ctrlRest});

  @override
  _ExercisePageState createState() => _ExercisePageState(int.parse(ctrlDelay),
      int.parse(ctrlTime), int.parse(ctrlTurns), int.parse(ctrlRest));
}

class _ExercisePageState extends State<ExercisePage> {
  int ctrlDelay;
  int ctrlTime;
  int ctrlTurns;
  int ctrlRest;
  int countTurns = 1;
  int _counter;
  Timer _timer;
  bool paused = false;
  bool finished = false;
  String typeCounter = "Be ready!";

  _ExercisePageState(
      this.ctrlDelay, this.ctrlTime, this.ctrlTurns, this.ctrlRest);

  @override
  void initState() {
    super.initState();
    this.start();
  }

  void cancel() {
    Navigator.pop(
      context,
      MaterialPageRoute(builder: (context) => HomePage()),
    );
  }

  void pause() {
    setState(() {
      this._timer.cancel();
      this.paused = true;
    });
  }

  void restart() {
    start();
    this.paused = false;
  }

  void start() {
    int timeFixed = ctrlTime;
    int restFixed = ctrlRest;
    this._counter = ctrlDelay;
    this.finished = false;

    if (_timer != null) {
      _timer.cancel();
    }
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        if (ctrlDelay >= 0) {
          this._counter = ctrlDelay;
          this.typeCounter = "Be ready!";
          ctrlDelay--;
        } else if (ctrlDelay == -1 && ctrlTime >= 0) {
          this._counter = ctrlTime;
          this.typeCounter = "Exercise Time!!!";
          ctrlTime--;
        } else if (ctrlTime == -1 && ctrlRest >= 0) {
          this._counter = ctrlRest;
          this.typeCounter = "Take a breath...";
          ctrlRest--;
        } else if (ctrlRest == -1 && ctrlTurns > 1) {
          countTurns++;
          ctrlTurns--;
          ctrlTime = timeFixed;
          ctrlRest = restFixed;
        } else {
          _timer.cancel();
          this.finished = true;
          this.typeCounter = "Well done!";
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: Padding(
        padding: EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Column(
              children: [
                Container(
                  child: Text(
                    this.typeCounter,
                    style: TextStyle(
                      fontSize: 45,
                      color: Color(0xff5D5D5D),
                    ),
                  ),
                ),
                SizedBox(
                  height: 50,
                ),
                Container(
                  child: AnimatedFlipCounter(
                    duration: Duration(milliseconds: 500),
                    value: _counter,
                    /* pass in a number like 2014 */
                    color: Color(0xffeeeeee),
                    size: 100,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  child: Text(
                    'Turn:  ' + countTurns.toString(),
                    style: TextStyle(
                      fontSize: 45,
                      color: Color(0xff5D5D5D),
                    ),
                  ),
                ),
                SizedBox(
                  height: 50,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Container(
                      width: 170,
                      alignment: Alignment.centerRight,
                      child: Button(
                        text: (finished ? 'Back' : 'Stop'),
                        invert: true,
                        func: cancel,
                      ),
                    ),
                    Container(
                      width: 160,
                      alignment: Alignment.centerLeft,
                      child: paused
                          ? Button(
                              text: 'Continue',
                              invert: false,
                              func: restart,
                            )
                          : Button(
                              text: 'Pause',
                              invert: false,
                              func: pause,
                            ),
                    )
                  ],
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
