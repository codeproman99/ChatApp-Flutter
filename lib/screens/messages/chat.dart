import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:tymoff/constant/constant.dart';
import 'package:tymoff/provider/search_provider.dart';
import 'package:tymoff/shared_widgets/blurry_background.dart';
import '../../constant/shared_color.dart';
import '../../sample_json/json.dart';
import '../../shared_widgets/search_bar.dart';

class Chat extends StatefulWidget {
  final userChat;

  const Chat({Key key, this.userChat}) : super(key: key);

  @override
  _ChatState createState() => _ChatState();
}

class _ChatState extends State<Chat> {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  dynamic chat = SampleJSON.chat;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
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
      //   title: Text(
      //       widget.userChat["unknown"] == false
      //           ? widget.userChat["name"]
      //           : widget.userChat["contact"],
      //       style: TextStyle(
      //           fontSize: 20,
      //           fontWeight: FontWeight.w500,
      //           color: Colors.black)),
      //   actions: <Widget>[
      //     Flexible(
      //       child: InkWell(
      //         onTap: () {
      //           print(widget.userChat["channel"]);
      //           if (widget.userChat["channel"] == "group") {
      //             Navigator.pushNamed(context, RoutesConstant.groupSetting);
      //           } else if (widget.userChat["channel"] == "broadcast") {
      //             Navigator.pushNamed(context, RoutesConstant.broadcastSetting);
      //           } else if (widget.userChat["channel"] == "single") {
      //             Navigator.pushNamed(context, RoutesConstant.chatSetting);
      //           }
      //         },
      //         child: Padding(
      //           padding: const EdgeInsets.all(10.0),
      //           child: SvgPicture.asset(
      //             AssetConstant.setting,
      //             fit: BoxFit.contain,
      //             height: 14,
      //           ),
      //         ),
      //       ),
      //     )
      //   ],
      // ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        padding: const EdgeInsets.only(top: 30),
        color: Colors.white,
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(4.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 10.0),
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
                  Text(
                      widget.userChat["unknown"] == false
                          ? widget.userChat["name"]
                          : widget.userChat["contact"],
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                          color: Colors.black)),
                  Spacer(),
                  Flexible(
                    child: InkWell(
                      onTap: () {
                        print(widget.userChat["channel"]);
                        if (widget.userChat["channel"] == "group") {
                          Navigator.pushNamed(
                              context, RoutesConstant.groupSetting);
                        } else if (widget.userChat["channel"] == "broadcast") {
                          Navigator.pushNamed(
                              context, RoutesConstant.broadcastSetting);
                        } else if (widget.userChat["channel"] == "single") {
                          Navigator.pushNamed(
                              context, RoutesConstant.chatSetting);
                        }
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: SvgPicture.asset(
                          AssetConstant.setting,
                          fit: BoxFit.contain,
                          height: 14,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
            SearchBar(),
            Expanded(
                child: ListView.builder(
                    itemCount:
                        widget.userChat["unknown"] == false ? chat.length : 1,
                    physics: BouncingScrollPhysics(),
                    itemBuilder: (context, index) {
                      return Consumer<SearchProvider>(
                          builder: (context, searching, child) {
                        return searching.searchingFilter == null ||
                                searching.searchingFilter == ""
                            ? chatSection(context, index)
                            : chat[index]["message"].toLowerCase().contains(
                                    searching.searchingFilter.toLowerCase())
                                ? chatSection(context, index)
                                : Container();
                      });
                    })),
            inputTextFieldChat(context),
          ],
        ),
      ),
    );
  }

  Widget chatSection(context, index) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 4.0),
      child: Column(
        children: <Widget>[
          SampleJSON.chat[index]["sent"] == "from" &&
                  widget.userChat["unknown"] == false
              ? Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: <Widget>[
                        chatContainer(
                            context,
                            SampleJSON.chat[index]["message"],
                            SampleJSON.chat[index]["media"],
                            SharedColor.blueAncent.withOpacity(0.3)),
                        Padding(
                          padding: const EdgeInsets.only(right: 10.0),
                          child: Row(
                            children: <Widget>[
                              Icon(Icons.check,
                                  size: 12, color: SharedColor.blueAncent),
                              Text(SampleJSON.chat[index]["last_time"],
                                  style: TextStyle(
                                      color: Colors.black87, fontSize: 10)),
                            ],
                          ),
                        ),
                      ],
                    ),
                    CircleAvatar(
                      backgroundImage:
                          NetworkImage(SampleJSON.chat[index]["image"]),
                    ),
                  ],
                )
              : Row(
                  children: <Widget>[
                    CircleAvatar(
                      backgroundImage:
                          NetworkImage(SampleJSON.chat[index]["image"]),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        chatContainer(
                            context,
                            SampleJSON.chat[index]["message"],
                            SampleJSON.chat[index]["media"],
                            SharedColor.grey),
                        Padding(
                          padding: const EdgeInsets.only(left: 10.0),
                          child: Row(
                            children: <Widget>[
                              Text(SampleJSON.chat[index]["last_time"],
                                  style: TextStyle(
                                      color: Colors.black87, fontSize: 10)),
                              Icon(Icons.check,
                                  size: 12, color: SharedColor.blueAncent),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
          widget.userChat["unknown"] == true ? warningButtons() : Container()
        ],
      ),
    );
  }

  Widget chatContainer(context, String text, String media, Color color) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
      child: Container(
        width: MediaQuery.of(context).size.width / 2,
        decoration: new BoxDecoration(
            color: color, borderRadius: BorderRadius.circular(5)),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: media == "" ? Text('$text') : chatWithMedia(media, text),
        ),
      ),
    );
  }

  Widget chatWithMedia(String media, String text) {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image(
              image: NetworkImage(media),
            ),
          ),
          Text('$text', style: TextStyle(color: Colors.black87)),
        ]);
  }

  Widget inputTextFieldChat(context) {
    return Container(
      decoration: new BoxDecoration(
          border: Border(top: BorderSide(width: 0.5, color: SharedColor.grey))),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: <Widget>[
          InkWell(
            onTap: () {
              scaffoldKey.currentState.showBottomSheet(
                (context) => Stack(
                  alignment: Alignment.bottomCenter,
                  children: [
                    GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: BlurryEffect(
                            0.5, 5, SharedColor.backgroundColorblur)),
                    Container(
                        decoration: new BoxDecoration(
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(20.0),
                              topRight: Radius.circular(20.0)),
                          color: Colors.transparent,
                        ),
                        padding: const EdgeInsets.only(top: 80.0),
                        child: BottomSheetAttachment()),
                  ],
                ),
                backgroundColor: Colors.transparent,
              );
            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                  decoration: new BoxDecoration(
                      shape: BoxShape.circle, color: Colors.black),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child:
                        Icon(Icons.attach_file, color: Colors.white, size: 18),
                  )),
            ),
          ),
          Flexible(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: TextFormField(
                decoration: new InputDecoration(
                    hintText: "Type a new message.",
                    hintStyle: TextStyle(
                      fontSize: 15,
                    ),
                    border: InputBorder.none),
              ),
            ),
          ),
          InkWell(
            onTap: () {},
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                  alignment: Alignment.center,
                  height: MediaQuery.of(context).size.height / 20,
                  decoration: new BoxDecoration(
                    boxShadow: [
                      BoxShadow(color: SharedColor.grey, blurRadius: 3.0)
                    ],
                    color: SharedColor.blueAncent,
                    shape: BoxShape.circle,
                    // borderRadius: BorderRadius.circular(50)
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: SvgPicture.asset(AssetConstant.iconsMessage,
                        fit: BoxFit.contain, color: Colors.white, height: 14),
                  )),
            ),
          ),
        ],
      ),
    );
  }

  Widget warningButtons() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 2),
            child: Container(
              width: MediaQuery.of(context).size.width * 0.45,
              height: 50,
              child: FlatButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30)),
                color: SharedColor.redBtnColor,
                onPressed: () {},
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(StringConstant.reportSpam,
                      style: TextStyle(fontSize: 14, color: Colors.white)),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 2),
            child: Container(
              width: MediaQuery.of(context).size.width * 0.45,
              height: 50,
              child: FlatButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30)),
                color: SharedColor.redBtnColor,
                onPressed: () {},
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(StringConstant.blockUser,
                      style: TextStyle(fontSize: 14, color: Colors.white)),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class BottomSheetAttachment extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: new BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20.0), topRight: Radius.circular(20.0))),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              alignment: Alignment.center,
              child: Text(
                StringConstant.sendaFile,
                style: TextStyle(
                    fontSize: 18,
                    color: SharedColor.fontColorGrey,
                    fontWeight: FontWeight.w600),
              ),
              padding: EdgeInsets.all(15.0),
            ),
            Divider(),
            Container(
              child: Text(
                StringConstant.clickaPhoto,
                style: TextStyle(
                    fontSize: 16,
                    color: SharedColor.fontColorGrey,
                    fontWeight: FontWeight.w600),
              ),
              padding: EdgeInsets.all(10.0),
            ),
            Divider(),
            Container(
              child: Text(
                StringConstant.uploadFromGallery,
                style: TextStyle(
                    fontSize: 16,
                    color: SharedColor.fontColorGrey,
                    fontWeight: FontWeight.w600),
              ),
              padding: EdgeInsets.all(10.0),
            ),
            Divider(),
            Container(
              child: Text(
                StringConstant.document,
                style: TextStyle(
                    fontSize: 16,
                    color: SharedColor.fontColorGrey,
                    fontWeight: FontWeight.w600),
              ),
              padding: EdgeInsets.all(10.0),
            ),
            Divider(),
            Container(
              child: Text(
                StringConstant.location,
                style: TextStyle(
                    fontSize: 16,
                    color: SharedColor.fontColorGrey,
                    fontWeight: FontWeight.w600),
              ),
              padding: EdgeInsets.all(10.0),
            ),
            Divider(),
            Container(
              child: Text(
                StringConstant.contact,
                style: TextStyle(
                    fontSize: 16,
                    color: SharedColor.fontColorGrey,
                    fontWeight: FontWeight.w600),
              ),
              padding: EdgeInsets.all(10.0),
            ),
          ],
        ),
      ),
    );
  }
}
