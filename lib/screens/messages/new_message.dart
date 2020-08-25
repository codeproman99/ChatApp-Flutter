import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:tymoff/constant/constant.dart';
import 'package:tymoff/constant/shared_color.dart';
import 'package:tymoff/constant/shared_styles.dart';
import 'package:tymoff/provider/search_provider.dart';
import 'package:tymoff/sample_json/json.dart';
import 'package:tymoff/shared_widgets/search_bar.dart';

class BottomSheetModalNewMessage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    dynamic user = SampleJSON.user;
    return Container(
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
            child: Text(StringConstant.newMessages,
                style: SharedStyles.bottomsheetHeading),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 14.0, vertical: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Expanded(
                child: FlatButton(
                  color: SharedColor.blueAncent,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5)),
                  onPressed: () {},
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(StringConstant.broadcast,
                        style: TextStyle(color: Colors.white)),
                  ),
                ),
              ),
              SizedBox(
                width: 10,
              ),
              Expanded(
                child: FlatButton(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5)),
                  color: SharedColor.blueAncent,
                  onPressed: () {},
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(StringConstant.newGroup,
                        style: TextStyle(color: Colors.white)),
                  ),
                ),
              ),
            ],
          ),
        ),
        SearchBar(),
        Flexible(
          child: Stack(
            alignment: Alignment.bottomCenter,
            children: <Widget>[
              Container(
                height: MediaQuery.of(context).size.height,
                child: SingleChildScrollView(
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        for (int index = 0; index < 5; index++)
                          ListTile(
                            leading: CircleAvatar(
                                backgroundImage: NetworkImage(
                                    SampleJSON.user[index]["image"])),
                            title: Text(SampleJSON.user[index]["name"],
                                style: TextStyle(fontSize: 18)),
                            trailing: Icon(FontAwesomeIcons.circle,
                                color: SharedColor.grey),
                          ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 15.0, vertical: 10.0),
                          child: Text("ALL CONTACTS",
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.w500)),
                        ),
                        Container(
                          height: MediaQuery.of(context).size.height,
                          child: ListView.builder(
                            itemCount: user.length,
                            shrinkWrap: true,
                            primary: true,
                            physics: BouncingScrollPhysics(),
                            itemBuilder: (context, index) {
                              return Consumer<SearchProvider>(
                                  builder: (context, searching, child) {
                                return searching.searchingFilter == null ||
                                        searching.searchingFilter == ""
                                    ? listTileAllContacts(index)
                                    : user[index]["name"]
                                            .toLowerCase()
                                            .contains(searching.searchingFilter
                                                .toLowerCase())
                                        ? listTileAllContacts(index)
                                        : Container();
                              });
                            },
                          ),
                        ),
                      ]),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 15.0, vertical: 10.0),
                child: Container(
                  height: 50,
                  width: MediaQuery.of(context).size.width * 0.8,
                  decoration: new BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    boxShadow: <BoxShadow>[
                      BoxShadow(
                        color: SharedColor.blueAncent,
                        offset: Offset(1.0, 3.0),
                        blurRadius: 10.0,
                      ),
                    ],
                  ),
                  child: FlatButton(
                    color: SharedColor.blueAncent,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50),
                    ),
                    onPressed: () {},
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Text(StringConstant.send,
                          style: TextStyle(color: Colors.white, fontSize: 18)),
                    ),
                  ),
                ),
              ),
            ],
          ),
        )
      ]),
    );
  }

  Widget listTileAllContacts(index) {
    return ListTile(
      leading: CircleAvatar(
          backgroundImage: NetworkImage(SampleJSON.user[index]["image"])),
      title:
          Text(SampleJSON.user[index]["name"], style: TextStyle(fontSize: 18)),
      trailing: Icon(FontAwesomeIcons.circle, color: SharedColor.grey),
    );
  }
}
