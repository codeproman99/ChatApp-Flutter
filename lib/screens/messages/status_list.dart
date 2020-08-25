import 'dart:ui';

import 'package:fdottedline/fdottedline.dart';
import 'package:flutter/material.dart';
import 'package:tymoff/constant/constant.dart';
import 'package:tymoff/constant/shared_color.dart';
import 'package:tymoff/screens/messages/new_message.dart';
import 'package:tymoff/shared_widgets/blurry_background.dart';

class StatusList extends StatelessWidget {
  final status;

  const StatusList({Key key, this.status}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10.0, top: 15),
      child: SizedBox(
        height: MediaQuery.of(context).size.height / 6,
        child: ListView.builder(
            itemCount: status.length,
            scrollDirection: Axis.horizontal,
            physics: BouncingScrollPhysics(),
            itemBuilder: (context, index) {
              return Row(
                children: <Widget>[
                  index == 0
                      ? InkWell(
                          enableFeedback: true,
                          onTap: () {
                            showBottomSheet(
                                backgroundColor: Colors.transparent,
                                context: context,
                                builder: (context) => GestureDetector(
                                      onTap: () {
                                        Navigator.pop(context);
                                      },
                                      child: Stack(
                                        alignment: Alignment.bottomCenter,
                                        children: [
                                          BlurryEffect(0.5, 5,
                                              SharedColor.backgroundColorblur),
                                          Container(
                                              decoration: new BoxDecoration(
                                                borderRadius: BorderRadius.only(
                                                    topLeft:
                                                        Radius.circular(20.0),
                                                    topRight:
                                                        Radius.circular(20.0)),
                                                color: Colors.white,
                                              ),
                                              height: 200,
                                              child:
                                                  BottomSheetModalAddStatus()),
                                        ],
                                      ),
                                    ));
                          },
                          child: Column(
                            children: <Widget>[
                              Padding(
                                padding: const EdgeInsets.all(2.0),
                                child: FDottedLine(
                                  color: SharedColor.blueAncent,
                                  corner: FDottedLineCorner(
                                    leftTopCorner: 80,
                                    rightTopCorner: 80,
                                    rightBottomCorner: 80,
                                    leftBottomCorner: 80,
                                  ),
                                  child: Container(
                                    height: 77,
                                    width: 77,
                                    decoration: new BoxDecoration(
                                      color: SharedColor.blueAncent
                                          .withOpacity(0.2),
                                      shape: BoxShape.circle,

                                      // borderRadius:
                                      //     BorderRadius.circular(80)
                                    ),
                                    child: Icon(Icons.add,
                                        color: SharedColor.blueAncent),
                                  ),
                                ),
                              ),
                              SizedBox(
                                  width: 80,
                                  child: Center(
                                    child: Text(
                                      status[index]["name"],
                                      maxLines: 1,
                                      style: TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.w600),
                                    ),
                                  ))
                            ],
                          ),
                        )
                      : InkWell(
                          onTap: () {
                            Navigator.pushNamed(context, RoutesConstant.status,
                                arguments: status[index]);
                          },
                          child: Column(
                            children: <Widget>[
                              Padding(
                                padding: const EdgeInsets.all(2.0),
                                child: CircleAvatar(
                                  radius: 38,
                                  backgroundColor: SharedColor.blueAncent,
                                  child: CircleAvatar(
                                    radius: status[index]["view"] == false
                                        ? 35
                                        : 38,
                                    backgroundImage:
                                        NetworkImage(status[index]["image"]),
                                  ),
                                ),
                              ),
                              SizedBox(
                                  width: 50,
                                  child: Center(
                                    child: Text(
                                      status[index]["name"],
                                      maxLines: 1,
                                      style: TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.w600),
                                    ),
                                  ))
                            ],
                          ),
                        ),
                ],
              );
            }),
      ),
    );
  }
}

class BottomSheetModalAddStatus extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            alignment: Alignment.center,
            child: Text(
              StringConstant.createAstatus,
              style: TextStyle(fontSize: 18, color: SharedColor.fontColorGrey),
            ),
            padding: EdgeInsets.all(15.0),
          ),
          Divider(),
          Container(
            child: Text(
              StringConstant.clickaPhoto,
              style: TextStyle(fontSize: 16, color: SharedColor.fontColorGrey),
            ),
            padding: EdgeInsets.all(10.0),
          ),
          Divider(),
          Container(
            child: Text(
              StringConstant.uploadFromGallery,
              style: TextStyle(fontSize: 16, color: SharedColor.fontColorGrey),
            ),
            padding: EdgeInsets.all(10.0),
          ),
          Divider(),
          InkWell(
            onTap: () {
              Navigator.pushNamed(context, RoutesConstant.status, arguments: 1);
            },
            child: Container(
              child: Text(
                "temporary button",
                style:
                    TextStyle(fontSize: 16, color: SharedColor.fontColorGrey),
              ),
              padding: EdgeInsets.all(10.0),
            ),
          ),
        ],
      ),
    );
  }
}
