import 'package:flutter/material.dart';
import 'package:tymoff/constant/constant.dart';
import 'package:tymoff/constant/shared_color.dart';

import 'blurry_background.dart';

class ReportBottomModals {
  static reportOptions(context) {
    showModalBottomSheet(
        context: context,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20.0), topRight: Radius.circular(20.0)),
        ),
        builder: (builder) {
          return SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  alignment: Alignment.center,
                  child: Text(
                    StringConstant.reportPost,
                    style: TextStyle(
                        fontSize: 18, color: SharedColor.fontColorGrey),
                  ),
                  padding: EdgeInsets.all(15.0),
                ),
                Divider(),
                Container(
                  width: MediaQuery.of(context).size.width,
                  child: Text(
                    StringConstant.nudityOrIllegalSubstances,
                    style: TextStyle(
                        fontSize: 16, color: SharedColor.fontColorGrey),
                  ),
                  padding: EdgeInsets.all(10.0),
                ),
                Divider(),
                Container(
                  width: MediaQuery.of(context).size.width,
                  child: Text(
                    StringConstant.threatOrViolence,
                    style: TextStyle(
                        fontSize: 16, color: SharedColor.fontColorGrey),
                  ),
                  padding: EdgeInsets.all(10.0),
                ),
                Divider(),
                InkWell(
                  onTap: () {
                    reportOthers(context);
                  },
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    child: Text(
                      StringConstant.other,
                      style: TextStyle(
                          fontSize: 16, color: SharedColor.fontColorGrey),
                    ),
                    padding: EdgeInsets.all(10.0),
                  ),
                ),
                Divider(),
              ],
            ),
          );
        });
  }

  static reportOthers(context) {
    showModalBottomSheet(
        context: context,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20.0), topRight: Radius.circular(20.0)),
        ),
        builder: (builder) {
          return SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    InkWell(
                      enableFeedback: true,
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Padding(
                        padding:
                            const EdgeInsets.only(left: 5, top: 10, bottom: 10),
                        child: Icon(Icons.arrow_back, color: Colors.black),
                      ),
                    ),
                    Container(
                      alignment: Alignment.center,
                      child: Text(
                        StringConstant.reportPost,
                        style: TextStyle(
                            fontSize: 18, color: SharedColor.fontColorGrey),
                      ),
                      padding: EdgeInsets.all(15.0),
                    ),
                    Container()
                  ],
                ),
                Divider(),
                Container(
                  child: Text(
                    StringConstant.whyReportStatus,
                    style: TextStyle(
                        fontSize: 16, color: SharedColor.fontColorGrey),
                  ),
                  padding: EdgeInsets.all(10.0),
                ),
                Divider(),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Card(
                    color: Colors.grey[200],
                    elevation: 0.0,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5.0)),
                    child: Container(
                      height: MediaQuery.of(context).size.height / 6,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: TextFormField(
                          decoration: new InputDecoration(
                              hintStyle: TextStyle(
                                fontSize: 15,
                              ),
                              border: InputBorder.none),
                        ),
                      ),
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.center,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.8,
                      child: FlatButton(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)),
                        color: SharedColor.blueAncent,
                        onPressed: () {
                          reportMessage(context);
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(StringConstant.report,
                              style:
                                  TextStyle(fontSize: 20, color: Colors.white)),
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          );
        });
  }

  static reportMessage(context) {
    showModalBottomSheet(
        context: context,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20.0), topRight: Radius.circular(20.0)),
        ),
        builder: (builder) {
          return SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  alignment: Alignment.center,
                  child: Text(
                    StringConstant.postHasBeenReported,
                    style: TextStyle(
                        fontSize: 18, color: SharedColor.fontColorGrey),
                  ),
                  padding: EdgeInsets.all(15.0),
                ),
                Divider(),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                  child: Container(
                    alignment: Alignment.center,
                    width: MediaQuery.of(context).size.width * 0.8,
                    child: Text(
                      "We have recieved your report and will look into it shortly. Meanwhile let us know if you also want to block the user from seeing your posts and showing up on your feed.",
                      style: TextStyle(fontSize: 15),
                    ),
                    padding: EdgeInsets.all(15.0),
                  ),
                ),
                Align(
                  alignment: Alignment.center,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.8,
                      child: FlatButton(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)),
                        color: SharedColor.blueAncent,
                        onPressed: () {},
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(StringConstant.blockedUser,
                              style:
                                  TextStyle(fontSize: 20, color: Colors.white)),
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          );
        });
  }
}

class ReportOptions extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            alignment: Alignment.center,
            child: Text(
              StringConstant.reportStatus,
              style: TextStyle(fontSize: 20, color: SharedColor.fontColorGrey),
            ),
            padding: EdgeInsets.all(15.0),
          ),
          Divider(),
          Container(
            width: MediaQuery.of(context).size.width,
            child: Text(
              StringConstant.nudityOrIllegalSubstances,
              style: TextStyle(fontSize: 16, color: SharedColor.fontColorGrey),
            ),
            padding: EdgeInsets.all(10.0),
          ),
          Divider(),
          Container(
            width: MediaQuery.of(context).size.width,
            child: Text(
              StringConstant.threatOrViolence,
              style: TextStyle(fontSize: 16, color: SharedColor.fontColorGrey),
            ),
            padding: EdgeInsets.all(10.0),
          ),
          Divider(),
          InkWell(
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
                            BlurryEffect(
                                0.5, 5, SharedColor.backgroundColorblur),
                            Container(
                                decoration: new BoxDecoration(
                                  borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(20.0),
                                      topRight: Radius.circular(20.0)),
                                  color: Colors.white,
                                ),
                                height: 300,
                                child: ReportOthers()),
                          ],
                        ),
                      ));
            },
            child: Container(
              width: MediaQuery.of(context).size.width,
              child: Text(
                StringConstant.other,
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

class ReportOthers extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              InkWell(
                enableFeedback: true,
                onTap: () {
                  Navigator.pop(context);
                },
                child: Padding(
                  padding: const EdgeInsets.only(left: 5, top: 10, bottom: 10),
                  child: Icon(Icons.arrow_back, color: Colors.black),
                ),
              ),
              Container(
                alignment: Alignment.center,
                child: Text(
                  StringConstant.reportPost,
                  style:
                      TextStyle(fontSize: 18, color: SharedColor.fontColorGrey),
                ),
                padding: EdgeInsets.all(15.0),
              ),
              Container()
            ],
          ),
          Divider(),
          Container(
            child: Text(
              StringConstant.whyReportStatus,
              style: TextStyle(fontSize: 16, color: SharedColor.fontColorGrey),
            ),
            padding: EdgeInsets.all(10.0),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(
              color: Colors.grey[200],
              elevation: 0.0,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5.0)),
              child: Container(
                height: MediaQuery.of(context).size.height / 8,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: TextFormField(
                    decoration: new InputDecoration(
                        hintStyle: TextStyle(
                          fontSize: 15,
                        ),
                        border: InputBorder.none),
                  ),
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                width: MediaQuery.of(context).size.width * 0.8,
                child: FlatButton(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                  color: SharedColor.blueAncent,
                  onPressed: () {
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
                                  BlurryEffect(
                                      0.5, 5, SharedColor.backgroundColorblur),
                                  Container(
                                      decoration: new BoxDecoration(
                                        borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(20.0),
                                            topRight: Radius.circular(20.0)),
                                        color: Colors.white,
                                      ),
                                      height: 250,
                                      child: ReportMessage()),
                                ],
                              ),
                            ));
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(StringConstant.report,
                        style: TextStyle(fontSize: 20, color: Colors.white)),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class ReportMessage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            alignment: Alignment.center,
            child: Text(
              StringConstant.postHasBeenReported,
              style: TextStyle(fontSize: 18, color: SharedColor.fontColorGrey),
            ),
            padding: EdgeInsets.all(15.0),
          ),
          Divider(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
            child: Container(
              alignment: Alignment.center,
              width: MediaQuery.of(context).size.width * 0.8,
              child: Text(
                "We have recieved your report and will look into it shortly. Meanwhile let us know if you also want to block the user from seeing your posts and showing up on your feed.",
                style: TextStyle(fontSize: 15),
              ),
              padding: EdgeInsets.all(15.0),
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                width: MediaQuery.of(context).size.width * 0.8,
                child: FlatButton(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                  color: SharedColor.blueAncent,
                  onPressed: () {},
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(StringConstant.blockedUser,
                        style: TextStyle(fontSize: 20, color: Colors.white)),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
