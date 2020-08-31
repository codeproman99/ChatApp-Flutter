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
                                          IntrinsicHeight(
                                            child: Container(
                                                decoration: new BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.only(
                                                          topLeft:
                                                              Radius.circular(
                                                                  8.0),
                                                          topRight:
                                                              Radius.circular(
                                                                  8.0)),
                                                  color: Colors.white,
                                                ),
                                                child:
                                                    BottomSheetModalAddStatus()),
                                          ),
                                        ],
                                      ),
                                    ));
                            // showModalBottomSheet(
                            //     context: context,
                            //     backgroundColor: Colors.transparent,
                            //     isScrollControlled: true,
                            //     builder: (context) => Stack(
                            //           alignment: Alignment.bottomCenter,
                            //           children: [
                            //             BlurryEffect(0.5, 5,
                            //                 SharedColor.backgroundColorblur),
                            //             DraggableScrollableSheet(
                            //                 expand: false,
                            //                 initialChildSize: 0.3,
                            //                 maxChildSize: 0.34,
                            //                 minChildSize: 0.3,
                            //                 builder: (BuildContext context,
                            //                     ScrollController
                            //                         scrollController) {
                            //                   return BottomSheetModalAddStatus(
                            //                     controller: scrollController,
                            //                   );
                            //                 }),
                            //             // ),
                            //           ],
                            //         ));
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
  final ScrollController controller;

  const BottomSheetModalAddStatus({Key key, this.controller}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;
    return SingleChildScrollView(
      controller: controller,
      child: Container(
        decoration: new BoxDecoration(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(8.0), topRight: Radius.circular(8.0)),
          color: Colors.white,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              alignment: Alignment.center,
              child: Text(
                StringConstant.createAstatus,
                style: textTheme.headline6.copyWith(
                    color: SharedColor.fontColorGrey,
                    fontSize: 20,
                    fontWeight: FontWeight.w400),
              ),
              padding: EdgeInsets.all(15.0),
            ),
            Divider(),
            Container(
              child: Text(
                StringConstant.clickaPhoto,
                style:
                    TextStyle(fontSize: 16, color: SharedColor.fontColorGrey),
              ),
              padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20),
            ),
            Divider(),
            Container(
              child: Text(
                StringConstant.uploadFromGallery,
                style:
                    TextStyle(fontSize: 16, color: SharedColor.fontColorGrey),
              ),
              padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20),
            ),
            Divider(),
            InkWell(
              onTap: () {
                Navigator.pushNamed(context, RoutesConstant.status,
                    arguments: 1);
              },
              child: Container(
                child: Text(
                  "temporary button",
                  style:
                      TextStyle(fontSize: 16, color: SharedColor.fontColorGrey),
                ),
                padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
