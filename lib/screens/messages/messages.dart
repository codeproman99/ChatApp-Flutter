import 'dart:ui';

import 'package:flutter_svg/svg.dart';
import 'package:tymoff/constant/constant.dart';
import 'package:tymoff/constant/shared_color.dart';
import 'package:tymoff/sample_json/json.dart';
import 'package:tymoff/screens/messages/message_list.dart';
import 'package:tymoff/screens/messages/status_list.dart';
import 'package:tymoff/shared_widgets/blurry_background.dart';
import 'package:tymoff/shared_widgets/search_bar.dart';
import 'package:flutter/material.dart';
import 'new_message.dart';
import 'noMessageInstruction.dart';

class Messages extends StatelessWidget {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        key: scaffoldKey,
        // extendBodyBehindAppBar: true,
        // appBar: AppBar(
        //   elevation: 0.0,
        //   leading: InkWell(
        //     onTap: () {
        //       Navigator.pop(context);
        //     },
        //     child: Icon(
        //       Icons.arrow_back,
        //       color: Colors.black,
        //     ),
        //   ),
        //   backgroundColor: Colors.white,
        //   title: Text(StringConstant.messages,
        //       style: TextStyle(
        //           fontSize: 22,
        //           fontWeight: FontWeight.w500,
        //           color: Colors.black)),
        //   centerTitle: true,
        //   actions: <Widget>[
        //     InkWell(
        //       onTap: () {
        //         scaffoldKey.currentState.showBottomSheet(
        //             (context) => BottomSheetModalNewMessage(),
        //             backgroundColor: Colors.black,
        //             elevation: 20.0);
        //       },
        //       child: Padding(
        //         padding: const EdgeInsets.all(8.0),
        //         child: Transform.rotate(
        //           alignment: FractionalOffset.center,
        //           angle: -2.2,
        //           child: Container(
        //               alignment: Alignment.center,
        //               decoration: new BoxDecoration(
        //                 boxShadow: [
        //                   BoxShadow(
        //                       color: Colors.lightBlueAccent, blurRadius: 3.0)
        //                 ],
        //                 shape: BoxShape.circle,
        //                 color: Colors.lightBlueAccent,
        //               ),
        //               child: Padding(
        //                 padding: const EdgeInsets.all(10.0),
        //                 child: SvgPicture.asset(AssetConstant.iconsMessage,
        //                     fit: BoxFit.contain,
        //                     color: Colors.white,
        //                     height: 12),
        //               )),
        //         ),
        //       ),
        //     )
        //   ],
        // ),
        body: Container(
          height: MediaQuery.of(context).size.height,
          color: Colors.white,
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
            child: Column(
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: InkWell(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Icon(
                          Icons.arrow_back,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    Text(StringConstant.messages,
                        style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.w500,
                            color: Colors.black)),
                    InkWell(
                      onTap: () {
                        scaffoldKey.currentState.showBottomSheet(
                          (context) => GestureDetector(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: Stack(
                              alignment: Alignment.bottomCenter,
                              children: [
                                BlurryEffect(
                                    0.5, 5, SharedColor.backgroundColorblur),
                                Container(
                                    decoration: new BoxDecoration(
                                      borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(20.0),
                                          topRight: Radius.circular(20.0)),
                                      color: Colors.transparent,
                                    ),
                                    padding: const EdgeInsets.only(
                                        top: 80.0, left: 2, right: 2),
                                    child: BottomSheetModalNewMessage()),
                              ],
                            ),
                          ),
                          backgroundColor: Colors.transparent,
                        );
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Transform.rotate(
                          alignment: FractionalOffset.center,
                          angle: -2.2,
                          child: Container(
                              alignment: Alignment.center,
                              decoration: new BoxDecoration(
                                boxShadow: [
                                  BoxShadow(
                                      color: Colors.lightBlueAccent,
                                      blurRadius: 3.0)
                                ],
                                shape: BoxShape.circle,
                                color: Colors.lightBlueAccent,
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: SvgPicture.asset(
                                    AssetConstant.iconsMessage,
                                    fit: BoxFit.contain,
                                    color: Colors.white,
                                    height: 12),
                              )),
                        ),
                      ),
                    )
                  ],
                ),
                SearchBar(),
                SampleJSON.messages.length != 0
                    ? StatusList(
                        status: SampleJSON.user,
                      )
                    : Container(),
                SampleJSON.messages.length != 0
                    ? MessageList(messages: SampleJSON.messages)
                    : NoMessage(
                        scaffoldKey: scaffoldKey,
                      )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
