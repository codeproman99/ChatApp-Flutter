import 'package:flutter/material.dart';
import 'package:tymoff/constant/constant.dart';
import 'package:tymoff/constant/shared_color.dart';

class StatusList extends StatelessWidget {
  final status;

  const StatusList({Key key, this.status}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10.0),
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
                            bottomSheetAddStatus(context);
                          },
                          child: Column(
                            children: <Widget>[
                              Padding(
                                padding: const EdgeInsets.all(2.0),
                                child: CircleAvatar(
                                  radius: 37,
                                  backgroundColor: SharedColor.blueAncent,
                                  child: CircleAvatar(
                                    radius: 35,
                                    backgroundColor: Colors.white,
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
                                      style: TextStyle(fontSize: 12),
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
                                      style: TextStyle(fontSize: 12),
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

  bottomSheetAddStatus(context) {
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
                    StringConstant.sendaFile,
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                  ),
                  padding: EdgeInsets.all(15.0),
                ),
                Divider(),
                Container(
                  child: Text(
                    StringConstant.clickaPhoto,
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                  ),
                  padding: EdgeInsets.all(10.0),
                ),
                Divider(),
                Container(
                  child: Text(
                    StringConstant.uploadFromGallery,
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                  ),
                  padding: EdgeInsets.all(10.0),
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
                          TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
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
}
