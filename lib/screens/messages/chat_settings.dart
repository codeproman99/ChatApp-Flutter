import 'package:flutter/cupertino.dart';
import 'package:tymoff/constant/constant.dart';
import 'package:tymoff/constant/shared_color.dart';
import 'package:tymoff/sample_json/json.dart';
import 'package:tymoff/shared_widgets/flat_buttons.dart';
import 'package:tymoff/shared_widgets/simple_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:custom_switch/custom_switch.dart';

class ChatSettings extends StatefulWidget {
  @override
  _ChatSettingsState createState() => _ChatSettingsState();
}

class _ChatSettingsState extends State<ChatSettings> {
  bool isSwitched = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: PreferredSize(
            preferredSize:
                Size(MediaQuery.of(context).size.width, kToolbarHeight),
            child: Container(
              decoration: new BoxDecoration(
                // color: Color(0xffe4e8f5).withOpacity(0.8),
                gradient: LinearGradient(
                    colors: [Color(0xffe4e8f5), Color(0xffF5F4FF)],
                    stops: [0.0, 1.0],
                    begin: FractionalOffset.topCenter,
                    end: FractionalOffset.bottomCenter,
                    tileMode: TileMode.repeated),
              ),
              child: SharedWidget.simpleAppBar("Hitman", context,
                  Icons.arrow_back, Color(0xffe4e8f5).withOpacity(0.5)),
            ),
          ),
          body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                SizedBox(
                  height: MediaQuery.of(context).size.height / 4,
                  width: MediaQuery.of(context).size.width,
                  child: Image(
                    fit: BoxFit.fitWidth,
                    image: NetworkImage(
                        "https://www.rd.com/wp-content/uploads/2017/09/01-shutterstock_476340928-Irina-Bg-1024x683.jpg"),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 15.0, vertical: 15),
                  child: Text(StringConstant.chatSettings,
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: SharedColor.fontColorDarkBlue)),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15.0),
                  child: Container(
                      color: Colors.white,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text(
                              StringConstant.notifications,
                              style:
                                  TextStyle(fontSize: 16, color: Colors.grey),
                            ),
                            CustomSwitch(
                              value: isSwitched,
                              onChanged: (value) {
                                setState(() {
                                  isSwitched = value;
                                  print(isSwitched);
                                });
                              },
                              activeColor: SharedColor.blueAncent,
                            )
                          ],
                        ),
                      )),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: Container(
                    height: MediaQuery.of(context).size.height,
                    color: Colors.grey[50],
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 8.0, vertical: 4),
                          child: Text(StringConstant.media,
                              style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: SharedColor.fontColorDarkBlue)),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: <Widget>[
                              SharedFlatButtons(
                                btnText: StringConstant.photos,
                                textColor: Color(0xffA1A5D3),
                                backgroundColor:
                                    Color(0xffE6E5FF).withOpacity(0.9),
                              ),
                              SizedBox(width: 8),
                              SharedFlatButtons(
                                btnText: StringConstant.links,
                                textColor: Colors.grey[800],
                                backgroundColor: Colors.white,
                              ),
                              SizedBox(width: 8),
                              SharedFlatButtons(
                                btnText: StringConstant.videos,
                                textColor: Colors.grey[800],
                                backgroundColor: Colors.white,
                              ),
                            ],
                          ),
                        ),
                        Column(
                          children: <Widget>[
                            Container(
                              height: MediaQuery.of(context).size.height / 2,
                              color: Colors.white,
                              padding: const EdgeInsets.symmetric(vertical: 5),
                              child: GridView.builder(
                                itemCount: SampleJSON.photos.length,
                                gridDelegate:
                                    new SliverGridDelegateWithFixedCrossAxisCount(
                                        crossAxisCount: 3),
                                physics: BouncingScrollPhysics(),
                                itemBuilder: (context, index) {
                                  return Card(
                                    child: ClipRRect(
                                        child: Image(
                                      image: NetworkImage(
                                          SampleJSON.photos[index]["image"]),
                                      fit: BoxFit.cover,
                                    )),
                                  );
                                },
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                Navigator.pushNamed(
                                    context, RoutesConstant.media);
                              },
                              child: Container(
                                color: Colors.white,
                                alignment: Alignment.bottomRight,
                                padding: const EdgeInsets.symmetric(
                                    vertical: 10, horizontal: 5.0),
                                child: Text(
                                  "View all",
                                  style: TextStyle(
                                      fontSize: 16,
                                      color: Colors.blue[800],
                                      fontWeight: FontWeight.w500),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Container(
                          height: 50,
                          width: MediaQuery.of(context).size.width,
                          child: FlatButton(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30)),
                            color: SharedColor.redBtnColor,
                            onPressed: () {},
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(StringConstant.report + " Hitman",
                                  style: TextStyle(
                                      fontSize: 14, color: Colors.white)),
                            ),
                          ),
                        ),
                        SizedBox(height: 15),
                        Container(
                          height: 50,
                          width: MediaQuery.of(context).size.width,
                          child: FlatButton(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30)),
                            color: SharedColor.redBtnColor,
                            onPressed: () {},
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text("Block Hitman",
                                  style: TextStyle(
                                      fontSize: 14, color: Colors.white)),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          )),
    );
  }

  Widget warningButtons() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              width: MediaQuery.of(context).size.width * 0.4,
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
            padding: const EdgeInsets.all(8.0),
            child: Container(
              width: MediaQuery.of(context).size.width * 0.4,
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
