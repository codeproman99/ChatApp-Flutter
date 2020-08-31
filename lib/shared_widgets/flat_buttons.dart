import 'package:flutter/material.dart';

class SharedFlatButtons extends StatelessWidget {
  final String btnText;
  final bool selected;
  final Color textColor;
  final Color backgroundColor;
  const SharedFlatButtons(
      {Key key,
      this.btnText,
      this.selected,
      this.textColor,
      this.backgroundColor})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SizedBox(
        height: 50,
        child: FlatButton(
            splashColor: Colors.transparent,
            hoverColor: Colors.transparent,
            highlightColor: Colors.transparent,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            color: backgroundColor, // Color(0xffE6E5FF).withOpacity(0.9),
            onPressed: () {
              // Navigator.pushNamed(context, RoutesConstant.messages);
            },
            child: Text(
              btnText,
              style: TextStyle(
                fontSize: MediaQuery.of(context).size.width / 28,
                fontWeight: FontWeight.bold,
                color: textColor,
                // Color(0xffA1A5D3)
                // Colors.grey[800]
              ),
              overflow: TextOverflow.clip,
            )),
      ),
    );
  }
}
