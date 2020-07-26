import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tymoff/constant/constant.dart';
import 'package:tymoff/screens/messages/new_message.dart';
import 'package:tymoff/shared_widgets/report.dart';
import 'package:tymoff/shared_widgets/share.dart';

class Post extends StatefulWidget {
  final user;
  const Post({Key key, this.user}) : super(key: key);

  @override
  _PostState createState() => _PostState();
}

class _PostState extends State<Post> {
  GlobalKey actionOnStatusIcon = GlobalKey();
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
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
                      "https://images.unsplash.com/photo-1529626455594-4ff0802cfb7e?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&w=1000&q=80"))),
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
                              "https://www.rap-up.com/app/uploads/2020/04/eminem-hoodie-feat.jpg"),
                        ),
                        title: Text(
                          "Hitman",
                          style: TextStyle(color: Colors.white),
                        ),
                        trailing: Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: DropdownButtonHideUnderline(
                              child: DropdownButton(
                                icon: Icon(
                                  FontAwesomeIcons.ellipsisH,
                                  color: Colors.white,
                                  size: 30,
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
                                        Text(StringConstant.reportPost,
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
                                      ReportBottomModals.reportOptions(context);
                                    }
                                  });
                                },
                              ),
                            ))),
                  ],
                ),
                Center(
                  child: InkWell(
                    enableFeedback: true,
                    onTap: () {
                      scaffoldKey.currentState.showBottomSheet(
                          (context) => ShareBottomSheetModal(),
                          backgroundColor: Colors.transparent);
                    },
                    child: Icon(
                      FontAwesomeIcons.share,
                      color: Colors.white,
                    ),
                  ),
                )
              ],
            ),
          )),
    );
  }
}
