import 'package:flutter/material.dart';

class SharedFlatButtons extends StatelessWidget {
  final String btnText;

  const SharedFlatButtons({Key key, this.btnText}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Card(
        color: Colors.white,
        elevation: 1.0,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 4.0),
          child: FlatButton(
              onPressed: () {
                // Navigator.pushNamed(context, RoutesConstant.messages);
              },
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  btnText,
                  style: TextStyle(fontSize: MediaQuery.of(context).size.width / 28, fontWeight: FontWeight.bold),
                  overflow: TextOverflow.clip,
                ),
              )),
        ),
      ),
    );
  }
}
