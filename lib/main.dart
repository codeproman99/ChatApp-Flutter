import 'package:flutter/services.dart';
import 'package:tymoff/routes.dart';
import 'package:flutter/material.dart';
import 'constant/constant.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    return MaterialApp(
      theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
          appBarTheme: AppBarTheme(
              textTheme: TextTheme(headline1: TextStyle(color: Colors.black)))),
      onGenerateRoute: (RouteSettings settings) {
        return ongenerateRoutes(settings);
      },
      debugShowCheckedModeBanner: false,
      initialRoute: RoutesConstant.home,
      home: MyHomePage(),
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
