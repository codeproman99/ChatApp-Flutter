import 'package:tymoff/constant/constant.dart';
import 'package:tymoff/sample_json/json.dart';
import 'package:tymoff/shared_widgets/flat_buttons.dart';
import 'package:flutter/material.dart';

class Media extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: Container(
        height: MediaQuery.of(context).size.height,
        color: Colors.grey[50],
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              height: kToolbarHeight,
              decoration: new BoxDecoration(
                // color: Color(0xffe4e8f5).withOpacity(0.8),
                gradient: LinearGradient(
                    colors: [Color(0xffe4e8f5), Color(0xffF5F4FF)],
                    stops: [0.0, 1.0],
                    begin: FractionalOffset.topCenter,
                    end: FractionalOffset.bottomCenter,
                    tileMode: TileMode.repeated),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 10, top: 3.0, bottom: 3.0),
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
                  Text(StringConstant.media,
                      style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.w500,
                          color: Colors.black)),
                  Container()
                ],
              ),
            ),
            SizedBox(height: 10),
            Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 8.0, horizontal: 10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  SharedFlatButtons(
                    btnText: StringConstant.photos,
                    textColor: Color(0xffA1A5D3),
                    backgroundColor: Color(0xffE6E5FF).withOpacity(0.9),
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
            Flexible(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10.0, vertical: 8.0),
                child: GridView.builder(
                  itemCount: SampleJSON.photos.length,
                  gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3),
                  physics: BouncingScrollPhysics(),
                  itemBuilder: (context, index) {
                    return Card(
                      child: ClipRRect(
                          child: Image(
                        image: NetworkImage(SampleJSON.photos[index]["image"]),
                        fit: BoxFit.cover,
                      )),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      )),
    );
  }
}
