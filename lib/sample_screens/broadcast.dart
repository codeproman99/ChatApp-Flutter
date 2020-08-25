import 'package:provider/provider.dart';
import 'package:tymoff/constant/constant.dart';
import 'package:tymoff/constant/shared_color.dart';
import 'package:tymoff/constant/shared_styles.dart';
import 'package:tymoff/provider/search_provider.dart';
import 'package:tymoff/sample_json/json.dart';
import 'package:tymoff/shared_widgets/blurry_background.dart';
import 'package:tymoff/shared_widgets/search_bar.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class BroadcastSettings extends StatefulWidget {
  @override
  _BroadcastSettingsState createState() => _BroadcastSettingsState();
}

class _BroadcastSettingsState extends State<BroadcastSettings> {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  TextEditingController _searchController = new TextEditingController();
  String searchingFilter;

  @override
  Widget build(BuildContext context) {
    dynamic broadcastUser = SampleJSON.broadcastUser;
    return SafeArea(
      child: Scaffold(
          key: scaffoldKey,
          body: Container(
            height: MediaQuery.of(context).size.height,
            color: Color(0xffF5F4FF).withOpacity(0.5),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  height: kToolbarHeight,
                  decoration: new BoxDecoration(
                    // color: Color(0xffe4e8f5).withOpacity(0.8),
                    gradient: LinearGradient(
                        colors: [Color(0xffe4e8f5), Color(0xffF5F4FF)],
                        begin: Alignment.topCenter,
                        tileMode: TileMode.clamp),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(3.0),
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
                      Text(StringConstant.officeFriends,
                          style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.w500,
                              color: Colors.black)),
                      Container()
                    ],
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(left: 15.0, top: 20, bottom: 10),
                  child: Text(StringConstant.broadcastSettings,
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: SharedColor.fontColorDarkBlue)),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: Card(
                    color: Colors.white,
                    elevation: 0.0,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5.0)),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: TextFormField(
                          controller: _searchController,
                          decoration: new InputDecoration(
                              hintText: StringConstant.broadcastListName,
                              hintStyle: TextStyle(
                                fontSize: 15,
                              ),
                              suffixStyle: TextStyle(
                                  color: SharedColor.fontColorDarkBlue,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500),
                              suffixText: StringConstant.motivationTips,
                              border: InputBorder.none),
                          onTap: () {
                            setState(() {
                              _searchController.addListener(() {
                                setState(() {
                                  searchingFilter = _searchController.text;
                                });
                              });
                            });
                          }),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 16.0, vertical: 15.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        '${SampleJSON.broadcastUser.length} ${StringConstant.members}',
                        maxLines: 1,
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: SharedColor.fontColorDarkBlue),
                      ),
                      InkWell(
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
                                  BlurryEffect(
                                      0.5, 5, SharedColor.backgroundColorblur),
                                  Container(
                                      decoration: new BoxDecoration(
                                        borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(20.0),
                                            topRight: Radius.circular(20.0)),
                                        color: Colors.transparent,
                                      ),
                                      padding: const EdgeInsets.only(
                                          top: 10.0, left: 2, right: 2),
                                      child: BottomSheetModalAddNew()),
                                ],
                              ),
                            ),
                            backgroundColor: Colors.transparent,
                          );
                        },
                        child: Text(
                          StringConstant.addNewMembers,
                          maxLines: 1,
                          style: TextStyle(
                              fontSize: 16,
                              color: Colors.blue[600],
                              fontWeight: FontWeight.w500),
                        ),
                      )
                    ],
                  ),
                ),
                Flexible(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Container(
                      color: Colors.white,
                      child: ListView.builder(
                        itemCount: broadcastUser.length,
                        physics: BouncingScrollPhysics(),
                        itemBuilder: (context, index) {
                          return searchingFilter == null ||
                                  searchingFilter == ""
                              ? broadcastList(index)
                              : broadcastUser[index]["name"]
                                      .toLowerCase()
                                      .contains(searchingFilter.toLowerCase())
                                  ? broadcastList(index)
                                  : Container();
                        },
                      ),
                    ),
                  ),
                ),
              ],
            ),
          )),
    );
  }

  Widget broadcastList(index) {
    return Column(
      children: [
        ListTile(
          leading: CircleAvatar(
              radius: 20,
              backgroundImage:
                  NetworkImage(SampleJSON.broadcastUser[index]["image"])),
          title: Text(SampleJSON.broadcastUser[index]["name"],
              style: TextStyle(fontSize: 15)),
          trailing: Icon(
            FontAwesomeIcons.ellipsisH,
            size: 15,
            color: Colors.grey.withOpacity(0.5),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          child: Divider(
            color: Colors.grey.withOpacity(0.5),
          ),
        )
      ],
    );
  }
}

class BottomSheetModalAddNew extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    dynamic user = SampleJSON.user;
    return Container(
      padding: const EdgeInsets.only(top: 50),
      child: Container(
        decoration: new BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20.0),
                topRight: Radius.circular(20.0))),
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
              child: Text(StringConstant.addMembers,
                  style: SharedStyles.bottomsheetHeading),
            ),
          ),
          SearchBar(),
          Flexible(
            child: Stack(
              alignment: Alignment.bottomCenter,
              children: <Widget>[
                ListView.builder(
                  itemCount: user.length,
                  physics: BouncingScrollPhysics(),
                  itemBuilder: (context, index) {
                    return Consumer<SearchProvider>(
                        builder: (context, searching, child) {
                      return searching.searchingFilter == null ||
                              searching.searchingFilter == ""
                          ? bottomSheetAddNew(index)
                          : user[index]["name"].toLowerCase().contains(
                                  searching.searchingFilter.toLowerCase())
                              ? bottomSheetAddNew(index)
                              : Container();
                    });
                  },
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
                        child: Text(StringConstant.add,
                            style:
                                TextStyle(color: Colors.white, fontSize: 18)),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          )
        ]),
      ),
    );
  }

  Widget bottomSheetAddNew(index) {
    return Column(
      children: [
        ListTile(
          leading: CircleAvatar(
              backgroundImage: NetworkImage(SampleJSON.user[index]["image"])),
          title: Text(SampleJSON.user[index]["name"],
              style: TextStyle(fontSize: 18)),
          trailing: Icon(FontAwesomeIcons.circle, color: SharedColor.grey),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18.0),
          child: Divider(
            color: Colors.grey.withOpacity(0.5),
          ),
        )
      ],
    );
  }
}
