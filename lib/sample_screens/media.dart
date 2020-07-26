import 'package:tymoff/constant/constant.dart';
import 'package:tymoff/sample_json/json.dart';
import 'package:tymoff/shared_widgets/flat_buttons.dart';
import 'package:tymoff/shared_widgets/simple_app_bar.dart';
import 'package:flutter/material.dart';

class Media extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: SharedWidget.simpleAppBar(StringConstant.media, context,
              Icons.arrow_back, Colors.grey[200].withOpacity(0.2)),
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Container(
              height: MediaQuery.of(context).size.height,
              color: Colors.grey[50],
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        SharedFlatButtons(btnText: StringConstant.photos),
                        SharedFlatButtons(btnText: StringConstant.links),
                        SharedFlatButtons(btnText: StringConstant.videos),
                      ],
                    ),
                  ),
                  Flexible(
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
                            image:
                                NetworkImage(SampleJSON.photos[index]["image"]),
                            fit: BoxFit.cover,
                          )),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          )),
    );
  }
}
