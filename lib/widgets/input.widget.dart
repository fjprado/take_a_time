import 'package:flutter/material.dart';

class Input extends StatelessWidget {
  var label = "";
  var ctrl = new TextEditingController();

  Input({@required this.label, @required this.ctrl});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Container(
          width: 130,
          alignment: Alignment.centerRight,
          child: Text(
            this.label,
            style: TextStyle(
              color: Color(0xffEEEEEE),
              fontSize: 20,
            ),
          ),
        ),
        SizedBox(
          width: 20,
        ),
        Expanded(
          child: TextFormField(
            controller: this.ctrl,
            keyboardType: TextInputType.number,
            style: TextStyle(
              fontSize: 32,
              color: Color(0xff9D9D9D),
            ),
            validator: _validador,
            decoration: InputDecoration(
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                  color: Color(0xff5C5C5C),
                ),
              ),
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                  color: Theme.of(context).accentColor,
                ),
              ),
            ),
          ),
        ),
        SizedBox(
          width: 10,
        ),
        Container(
          width: 50,
          alignment: Alignment.centerRight,
          child: Text(
            'seconds',
            style: TextStyle(
              color: Color(0xff5C5C5C),
              fontSize: 12,
            ),
          ),
        ),
      ],
    );
  }

  String _validador(String value) {
    String patttern = r'(^[0-9]*$)';
    RegExp regExp = new RegExp(patttern);
    if (value.length == 0) {
      return "This is expected!";
    } else if (value.length >= 6) {
      return "Must have at most 5 digits!";
    } else if (!regExp.hasMatch(value)) {
      return "Must have only numbers!";
    }
    return null;
  }
}
