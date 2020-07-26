import 'package:flutter/material.dart';
import 'package:tymoff/constant/shared_styles.dart';

class SharedWidget {
  static Widget simpleAppBar(title, context, leadingIcon, appBarColor,
      {actionIcon}) {
    return AppBar(
      elevation: 0.0,
      backgroundColor: appBarColor,
      leading: InkWell(
        onTap: () {
          Navigator.pop(context);
        },
        child: Icon(
          leadingIcon,
          color: Colors.black,
        ),
      ),
      title: Text(title, style: SharedStyles.heading),
      centerTitle: true,
      actions: <Widget>[actionIcon != null ? Icon(actionIcon) : Container()],
    );
  }
}
