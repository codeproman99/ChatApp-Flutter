import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:tymoff/constant/shared_color.dart';
import 'package:tymoff/provider/search_provider.dart';
import 'package:tymoff/routes.dart';
import 'package:flutter/material.dart';
import 'package:tymoff/screens/messages/messages.dart';
import 'constant/constant.dart';

void main() {
  // final pubnub = PubNub(
  //     defaultKeyset: Keyset(
  //         subscribeKey: 'sub-c-be1b2188-d15a-11ea-b3f2-c27cb65b13f4',
  //         publishKey: 'pub-c-a747742d-f63d-45ad-9926-921884c0b1c9',
  //         uuid:
  //             UUID('sec-c-YzJhMjdhZmItOTNiMi00Mzc1LTg2MWMtNGExMzQ2ZTgyMmFk')));

  // var myChannel = pubnub.channel('my_channel');
  // pubnub.subscribe(channels: {'myChannel'}, withPresence: true);
  // print(myChannel.name);
  // myChannel.subscribe().then((value) => value.messages.listen((event) {
  //       print(event.payload);
  //     }));
  // myChannel.publish({'this is first message to': 'world'});
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => SearchProvider(),
        ),
      ],
      child: MaterialApp(
        theme: ThemeData(
            primarySwatch: Colors.blue,
            visualDensity: VisualDensity.adaptivePlatformDensity,
            appBarTheme: AppBarTheme(
                textTheme:
                    TextTheme(headline1: TextStyle(color: Colors.black)))),
        onGenerateRoute: (RouteSettings settings) {
          return ongenerateRoutes(settings);
        },
        debugShowCheckedModeBanner: false,
        initialRoute: RoutesConstant.messages,
        home: Messages(),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            FlatButton(
                onPressed: () {
                  Navigator.pushNamed(context, RoutesConstant.messages);
                },
                child: Text("messages")),
            FlatButton(
                onPressed: () {
                  Navigator.pushNamed(context, RoutesConstant.broadcastSetting);
                },
                child: Text("Broadcast settings")),
            FlatButton(
                onPressed: () {
                  Navigator.pushNamed(context, RoutesConstant.media);
                },
                child: Text("Media")),
            FlatButton(
                onPressed: () {
                  Navigator.pushNamed(context, RoutesConstant.chatSetting);
                },
                child: Text("chat settings")),
            FlatButton(
                onPressed: () {
                  Navigator.pushNamed(context, RoutesConstant.post);
                },
                child: Text("Post"))
          ],
        ),
      ),
    );
  }
}
