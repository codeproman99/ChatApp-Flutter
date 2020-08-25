import 'package:flutter/cupertino.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tymoff/constant/constant.dart';
import 'package:tymoff/constant/shared_color.dart';
import 'package:tymoff/sample_json/json.dart';
import 'package:tymoff/shared_widgets/flat_buttons.dart';
import 'package:flutter/material.dart';

class GroupSetting extends StatefulWidget {
  @override
  _GroupSettingState createState() => _GroupSettingState();
}

class _GroupSettingState extends State<GroupSetting> {
  bool postByAdminSwitch = false;
  bool shareLinkSwitch = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Stack(
              children: <Widget>[
                Container(
                  decoration: new BoxDecoration(
                    // color: Color(0xffe4e8f5).withOpacity(0.8),
                    gradient: LinearGradient(
                        colors: [Color(0xffe4e8f5), Color(0xffF5F4FF)],
                        begin: Alignment.topCenter,
                        tileMode: TileMode.clamp),
                  ),
                  height: 100,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 40.0),
                  child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        InkWell(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Icon(
                              Icons.arrow_back,
                            ),
                          ),
                        ),
                        Stack(
                          alignment: Alignment.center,
                          children: <Widget>[
                            CircleAvatar(
                              radius: 60,
                              backgroundImage: NetworkImage(
                                  "https://www.rd.com/wp-content/uploads/2017/09/01-shutterstock_476340928-Irina-Bg-1024x683.jpg"),
                              child: Container(
                                decoration: new BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Colors.black.withOpacity(0.5)),
                              ),
                            ),
                            Icon(Icons.camera_alt, color: Colors.white),
                          ],
                        ),
                        Container()
                      ]),
                ),
              ],
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 15.0, vertical: 15),
              child: Text(StringConstant.groupSettings,
                  style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: SharedColor.fontColorDarkBlue)),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Container(
                  color: Colors.white,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Text(
                                StringConstant.groupName,
                                style:
                                    TextStyle(fontSize: 18, color: Colors.grey),
                              ),
                              Text(
                                "College gang",
                                style: TextStyle(
                                    fontSize: 18,
                                    color: SharedColor.fontColorDarkBlue, fontWeight: FontWeight.w600),
                              ),
                            ],
                          ),
                        ),
                        Divider(),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Text(
                                  StringConstant.openToPublic,
                                  style: TextStyle(
                                      fontSize: 18, color: Colors.grey),
                                ),
                                CupertinoSwitch(
                                  value: shareLinkSwitch,
                                  onChanged: (value) {
                                    setState(() {
                                      shareLinkSwitch = value;
                                      print(shareLinkSwitch);
                                    });
                                  },
                                  activeColor: SharedColor.blueAncent,
                                )
                              ],
                            ),
                            shareLinkSwitch == true
                                ? Padding(
                                    padding: const EdgeInsets.only(bottom: 8.0),
                                    child: Container(
                                        color: SharedColor.grey,
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: <Widget>[
                                              SizedBox(
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    0.6,
                                                child: Text(
                                                  "your share able link will be generated here.. ",
                                                  style: TextStyle(
                                                      color: Colors.grey),
                                                ),
                                              ),
                                              Text(
                                                "Share",
                                                style: TextStyle(
                                                    color: Colors.blue[800]),
                                              ),
                                            ],
                                          ),
                                        )),
                                  )
                                : SizedBox(),
                            Text(
                              "This is the public link for the group. Anyone with this link can join the group and view/post content.",
                              style:
                                  TextStyle(fontSize: 14, color: Colors.grey),
                            ),
                          ],
                        ),
                        Divider(),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Text(
                                  StringConstant.postByAdminOnly,
                                  style: TextStyle(
                                      fontSize: 18, color: Colors.grey),
                                ),
                                CupertinoSwitch(
                                  value: postByAdminSwitch,
                                  onChanged: (value) {
                                    setState(() {
                                      postByAdminSwitch = value;
                                      print(postByAdminSwitch);
                                    });
                                  },
                                  activeColor: SharedColor.blueAncent,
                                )
                              ],
                            ),
                            Text(
                              "Only admins can post in this group.",
                              style:
                                  TextStyle(fontSize: 14, color: Colors.grey),
                            ),
                          ],
                        ),
                      ],
                    ),
                  )),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Container(
                // height: MediaQuery.of(context).size.height,
                color: Colors.grey[50],
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 5.0, vertical: 10),
                      child: Text(StringConstant.media,
                          style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                              color: SharedColor.fontColorDarkBlue)),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[
                          SharedFlatButtons(btnText: StringConstant.photos),
                          SizedBox(width: 2),
                          SharedFlatButtons(btnText: StringConstant.links),
                          SizedBox(width: 2),
                          SharedFlatButtons(btnText: StringConstant.videos),
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
                            primary: false,
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
                            Navigator.pushNamed(context, RoutesConstant.media);
                          },
                          child: Container(
                            color: Colors.white,
                            alignment: Alignment.bottomRight,
                            padding: const EdgeInsets.symmetric(
                                vertical: 10, horizontal: 5.0),
                            child: Text(
                              "View all",
                              style: TextStyle(
                                  fontSize: 16, color: Colors.blue[800], fontWeight: FontWeight.w500),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 4.0, vertical: 15),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text(
                            StringConstant.members,
                            style: TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.bold,
                                color: SharedColor.fontColorDarkBlue),
                          ),
                          Text(
                            StringConstant.addNewMembers,
                            style: TextStyle(
                                fontSize: 15, color: Colors.blue[800], fontWeight: FontWeight.w500),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      height: MediaQuery.of(context).size.height / 2,
                      child: ListView.separated(
                        primary: false,
                        separatorBuilder: (context, index) {
                          return Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 15.0),
                            child: Divider(
                              color: Colors.grey.withOpacity(0.5),
                            ),
                          );
                        },
                        itemCount: SampleJSON.user.length,
                        physics: BouncingScrollPhysics(),
                        itemBuilder: (context, index) {
                          return ListTile(
                            leading: CircleAvatar(
                                backgroundImage: NetworkImage(
                                    SampleJSON.user[index]["image"])),
                            title: Text(SampleJSON.user[index]["name"],
                                style: TextStyle(fontSize: 18)),
                            trailing: Icon(
                              FontAwesomeIcons.ellipsisH,
                              color: Colors.grey[300],
                            ),
                          );
                        },
                      ),
                    ),
                    Center(
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.8,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 15.0, vertical: 10.0),
                        child: FlatButton(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20)),
                          color: SharedColor.redBtnColor,
                          onPressed: () {},
                          child: Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: Text("Leave group",
                                style: TextStyle(color: Colors.white)),
                          ),
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
}
