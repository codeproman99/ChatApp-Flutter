import 'package:flutter/material.dart';

class SharedFlatButtons extends StatelessWidget {
  final String btnText;

  const SharedFlatButtons({Key key, this.btnText}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        decoration: new BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(5.0),
        ),
        child: FlatButton(
            splashColor: Color(0xffE6E5FF),
            onPressed: () {
              // Navigator.pushNamed(context, RoutesConstant.messages);
            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                btnText,
                style: TextStyle(
                    fontSize: MediaQuery.of(context).size.width / 28,
                    fontWeight: FontWeight.bold),
                overflow: TextOverflow.clip,
              ),
            )),
      ),
    );
  }
}
