import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:tymoff/constant/constant.dart';
import 'package:tymoff/constant/shared_color.dart';

import 'new_message.dart';

class NoMessage extends StatelessWidget {
  final GlobalKey<ScaffoldState> scaffoldKey;

  const NoMessage({Key key, this.scaffoldKey}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Lottie.asset(
            AssetConstant.noMessage,
            height: MediaQuery.of(context).size.height / 2.5,
            frameBuilder: (context, child, composition) {
              return AnimatedOpacity(
                child: child,
                opacity: composition == null ? 0 : 1,
                duration: const Duration(seconds: 1),
                curve: Curves.easeOut,
              );
            },
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(WarningMessages.noMessages,
                style: TextStyle(fontSize: 20, color: Colors.grey)),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              WarningMessages.noMessageInstruction,
              style: TextStyle(fontSize: 15, color: Colors.grey),
              textAlign: TextAlign.center,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              width: MediaQuery.of(context).size.width * 0.8,
              child: FlatButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
                color: SharedColor.blueAncent,
                onPressed: () {
                  scaffoldKey.currentState.showBottomSheet(
                      (context) => BottomSheetModalNewMessage());
                },
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(StringConstant.sendMessages,
                      style: TextStyle(fontSize: 20, color: Colors.white)),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
