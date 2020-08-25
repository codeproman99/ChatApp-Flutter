import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tymoff/constant/constant.dart';
import 'package:tymoff/constant/shared_color.dart';
import 'package:tymoff/sample_json/json.dart';
import 'package:tymoff/shared_widgets/blurry_background.dart';
import 'package:tymoff/shared_widgets/report.dart';

class Status extends StatefulWidget {
  final user;
  const Status({Key key, this.user}) : super(key: key);

  @override
  _StatusState createState() => _StatusState();
}

class _StatusState extends State<Status> {
  GlobalKey actionOnStatusIcon = GlobalKey();
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    // PopupMenu.context = context;
    // PopupMenu menu = PopupMenu(
    //     backgroundColor: Colors.white,
    //     lineColor: Colors.white,
    //     maxColumn: 2,
    //     items: [
    //       MenuItem(
    //           image: Icon(
    //         Icons.warning,
    //         color: Colors.grey,
    //       )),
    //       MenuItem(
    //         title: StringConstant.reportStatus,
    //         textStyle: TextStyle(fontSize: 15.0, color: Colors.redAccent),
    //       ),
    //     ],
    //     onClickMenu: (MenuItemProvider item) {
    //       if (item.menuTitle == StringConstant.reportStatus) {
    //         bottomSheetReportStatus(context);
    //       }
    //     });

    return Scaffold(
      key: scaffoldKey,
      extendBody: true,
      extendBodyBehindAppBar: true,
      body: Container(
          height: MediaQuery.of(context).size.height,
          decoration: new BoxDecoration(
              color: Colors.black,
              image: DecorationImage(
                  image: NetworkImage(
                      "https://images.unsplash.com/photo-1457449940276-e8deed18bfff?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&w=1000&q=80"))),
          child: Padding(
            padding: const EdgeInsets.only(top: 30.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    InkWell(
                      enableFeedback: true,
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 10),
                        child: Icon(Icons.arrow_back, color: Colors.white),
                      ),
                    ),
                    ListTile(
                        leading: CircleAvatar(
                          backgroundImage: NetworkImage(
                              "https://images.pexels.com/photos/220453/pexels-photo-220453.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500"),
                        ),
                        title: Text(
                          "Osama",
                          style: TextStyle(color: Colors.white),
                        ),
                        trailing: Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: DropdownButtonHideUnderline(
                              child: DropdownButton(
                                icon: Icon(
                                  FontAwesomeIcons.ellipsisH,
                                  color: Colors.white,
                                  size: 16,
                                ),
                                items: [
                                  DropdownMenuItem<String>(
                                    value: "1",
                                    child: Row(
                                      children: <Widget>[
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Icon(
                                            Icons.warning,
                                            color: Colors.grey,
                                            size: 30,
                                          ),
                                        ),
                                        Text(StringConstant.reportStatus,
                                            style: TextStyle(
                                                fontSize: 15.0,
                                                fontWeight: FontWeight.w500,
                                                color: Colors.redAccent)),
                                      ],
                                    ),
                                  ),
                                ],
                                onChanged: (value) {
                                  setState(() {
                                    if (value == '1') {
                                      scaffoldKey.currentState.showBottomSheet(
                                        (context) => GestureDetector(
                                          onTap: () {
                                            Navigator.pop(context);
                                          },
                                          child: Stack(
                                            alignment: Alignment.bottomCenter,
                                            children: [
                                              BlurryEffect(
                                                  0.5,
                                                  5,
                                                  SharedColor
                                                      .backgroundColorblur),
                                              Padding(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 2.0),
                                                child: Container(
                                                    decoration:
                                                        new BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.only(
                                                              topLeft: Radius
                                                                  .circular(
                                                                      20.0),
                                                              topRight: Radius
                                                                  .circular(
                                                                      20.0)),
                                                      color: Colors.white,
                                                    ),
                                                    height: 250,
                                                    padding:
                                                        const EdgeInsets.only(
                                                            left: 2, right: 2),
                                                    child: ReportOptions()),
                                              ),
                                            ],
                                          ),
                                        ),
                                        backgroundColor: Colors.transparent,
                                      );
                                    }
                                  });
                                },
                              ),
                            ))),
                  ],
                ),
                widget.user == 1
                    ? Center(
                        child: InkWell(
                          enableFeedback: true,
                          onTap: () {
                            scaffoldKey.currentState.showBottomSheet(
                              (context) => GestureDetector(
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
                                              topLeft: Radius.circular(20.0),
                                              topRight: Radius.circular(20.0)),
                                          color: Colors.transparent,
                                        ),
                                        padding: const EdgeInsets.only(
                                            top: 30.0, left: 2, right: 2),
                                        child:
                                            BottomSheetStatusViewedByUsers()),
                                  ],
                                ),
                              ),
                              backgroundColor: Colors.transparent,
                            );
                          },
                          child: Icon(
                            FontAwesomeIcons.eye,
                            color: Colors.white,
                          ),
                        ),
                      )
                    : Container(),
              ],
            ),
          )),
    );
  }
}

class BottomSheetStatusViewedByUsers extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            InkWell(
              enableFeedback: true,
              onTap: () {
                Navigator.pop(context);
              },
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Icon(Icons.arrow_back, color: Colors.white),
              ),
            ),
            ListTile(
                leading: CircleAvatar(
                  backgroundImage: NetworkImage(
                      "https://images.pexels.com/photos/220453/pexels-photo-220453.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500"),
                ),
                title: Text(
                  "Osama",
                  style: TextStyle(color: Colors.white),
                ),
                trailing: Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton(
                        icon: Icon(
                          FontAwesomeIcons.ellipsisH,
                          color: Colors.white,
                          size: 16,
                        ),
                        items: [
                          DropdownMenuItem<String>(
                            value: "1",
                            child: Row(
                              children: <Widget>[
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Icon(
                                    Icons.warning,
                                    color: Colors.grey,
                                    size: 30,
                                  ),
                                ),
                                Text(StringConstant.reportStatus,
                                    style: TextStyle(
                                        fontSize: 15.0,
                                        fontWeight: FontWeight.w500,
                                        color: Colors.redAccent)),
                              ],
                            ),
                          ),
                        ],
                        onChanged: (value) {
                          // setState(() {
                          //   if (value == '1') {
                          //     bottomSheetReportStatus(context);
                          //   }
                          // });
                        },
                      ),
                    ))),
          ],
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: Container(
            height: 300,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10.0),
              child: Image(
                image: NetworkImage(
                    "https://images.unsplash.com/photo-1457449940276-e8deed18bfff?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&w=1000&q=80"),
                fit: BoxFit.fill,
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Container(
            height: MediaQuery.of(context).size.height / 3.5,
            decoration: new BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20.0),
                  topRight: Radius.circular(20.0)),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15.0),
                  child: Container(
                    child: Text(
                      "35 story views",
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                          color: Colors.blueGrey[900]),
                    ),
                    padding: EdgeInsets.all(15.0),
                  ),
                ),
                Divider(),
                Expanded(
                  child: ListView.builder(
                    itemCount: SampleJSON.user.length,
                    physics: BouncingScrollPhysics(),
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: InkWell(
                          enableFeedback: true,
                          onTap: () {
                            Navigator.pushNamed(context, RoutesConstant.chat);
                          },
                          child: ListTile(
                            leading: CircleAvatar(
                                backgroundImage: NetworkImage(
                                    SampleJSON.user[index]["image"])),
                            title: Text(SampleJSON.user[index]["name"],
                                style: TextStyle(fontSize: 18)),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
