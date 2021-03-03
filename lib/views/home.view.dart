import 'package:flutter/material.dart';
import 'package:take_a_time/views/exercise.view.dart';
import 'package:take_a_time/widgets/button.widget.dart';
import 'package:take_a_time/widgets/input.widget.dart';
import 'package:take_a_time/widgets/logo.widget.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var _ctrlDelay = new TextEditingController();
  var _ctrlTime = new TextEditingController();
  var _ctrlTurns = new TextEditingController();
  var _ctrlRest = new TextEditingController();
  bool _validate = false;

  final _key = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(40),
          child: Form(
            key: _key,
            autovalidateMode:
                _validate ? AutovalidateMode.always : AutovalidateMode.disabled,
            child: Column(
              children: <Widget>[
                SizedBox(
                  height: 10,
                ),
                Logo(),
                SizedBox(
                  height: 5,
                ),
                Input(
                  label: "Start Delay:",
                  ctrl: _ctrlDelay,
                ),
                SizedBox(
                  height: 20,
                ),
                Input(
                  label: "Exercise Time:",
                  ctrl: _ctrlTime,
                ),
                SizedBox(
                  height: 20,
                ),
                Input(
                  label: "Turns:",
                  ctrl: _ctrlTurns,
                ),
                SizedBox(
                  height: 20,
                ),
                Input(
                  label: "Rest Time:",
                  ctrl: _ctrlRest,
                ),
                SizedBox(
                  height: 20,
                ),
                Button(
                  text: "Let's Go",
                  invert: false,
                  func: _start,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  _start() {
    if (_key.currentState.validate()) {
      _key.currentState.save();
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => ExercisePage(
            ctrlDelay: _ctrlDelay.text,
            ctrlTime: _ctrlTime.text,
            ctrlTurns: _ctrlTurns.text,
            ctrlRest: _ctrlRest.text,
          ),
        ),
      );
    } else {
      setState(() {
        _validate = true;
      });
    }
  }
}
