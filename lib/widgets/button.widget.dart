import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  var text = '';
  var invert = false;
  Function func;

  Button({
    @required this.text,
    @required this.invert,
    @required this.func,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 55,
      margin: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: invert
            ? Theme.of(context).primaryColor
            : Theme.of(context).accentColor,
        borderRadius: BorderRadius.circular(60),
        border: Border.all(
          color: Theme.of(context).accentColor,
        ),
      ),
      child: FlatButton(
        child: Text(text,
            style: TextStyle(
              color: invert
                  ? Theme.of(context).accentColor
                  : Theme.of(context).primaryColor,
              fontSize: 25,
            )),
        onPressed: func,
      ),
    );
  }
}
