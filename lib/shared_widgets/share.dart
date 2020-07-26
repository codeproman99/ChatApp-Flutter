import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tymoff/constant/constant.dart';
import 'package:tymoff/constant/shared_color.dart';
import 'package:tymoff/constant/shared_styles.dart';
import 'package:tymoff/sample_json/json.dart';
import 'package:tymoff/shared_widgets/search_bar.dart';

class ShareBottomSheetModal extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.9,
      decoration: new BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20.0), topRight: Radius.circular(20.0))),
      child: Column(children: <Widget>[
        Container(
          width: MediaQuery.of(context).size.width,
          alignment: Alignment.center,
          decoration: new BoxDecoration(
              color: SharedColor.grey,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20.0),
                  topRight: Radius.circular(20.0))),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(StringConstant.sharePost,
                style: SharedStyles.bottomsheetHeading),
          ),
        ),
        Wrap(
          children: <Widget>[
            SizedBox(
                width: MediaQuery.of(context).size.width / 1.7,
                child: SearchBar()),
            Padding(
              padding: const EdgeInsets.only(top: 5),
              child: SizedBox(
                height: MediaQuery.of(context).size.height / 15.5,
                child: FlatButton(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5)),
                  color: SharedColor.blueAncent,
                  onPressed: () {},
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(StringConstant.copyLink,
                        style: TextStyle(color: Colors.white)),
                  ),
                ),
              ),
            ),
            Icon(FontAwesomeIcons.whatsappSquare,
                size: 50, color: Color(0xff38EC5A)),
          ],
        ),
        Flexible(
          child: Stack(
            alignment: Alignment.bottomCenter,
            children: <Widget>[
              ListView.separated(
                separatorBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15.0),
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
                        backgroundImage:
                            NetworkImage(SampleJSON.user[index]["image"])),
                    title: Text(SampleJSON.user[index]["name"],
                        style: TextStyle(fontSize: 18)),
                    trailing: Icon(FontAwesomeIcons.circle),
                  );
                },
              ),
              Container(
                width: MediaQuery.of(context).size.width * 0.8,
                padding: const EdgeInsets.symmetric(
                    horizontal: 15.0, vertical: 10.0),
                child: FlatButton(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                  color: SharedColor.blueAncent,
                  onPressed: () {},
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text(StringConstant.send,
                        style: TextStyle(color: Colors.white)),
                  ),
                ),
              ),
            ],
          ),
        )
      ]),
    );
  }
}
