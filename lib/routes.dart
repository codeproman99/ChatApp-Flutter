import 'package:flutter/material.dart';
import 'package:tymoff/screens/messages/group_setting.dart';
import 'package:tymoff/screens/messages/status_view.dart';
import 'package:tymoff/screens/post_feed/post.dart';
import 'constant/constant.dart';
import 'main.dart';
import 'sample_screens/broadcast.dart';
import 'sample_screens/media.dart';
import 'screens/messages/chat.dart';
import 'screens/messages/messages.dart';
import 'screens/messages/chat_settings.dart';

ongenerateRoutes(RouteSettings settings) {
  switch (settings.name) {
    case RoutesConstant.home:
      return MaterialPageRoute(builder: (_) => MyHomePage());
    case RoutesConstant.messages:
      return MaterialPageRoute(builder: (_) => Messages());
    case RoutesConstant.broadcastSetting:
      return MaterialPageRoute(builder: (_) => BroadcastSettings());
    case RoutesConstant.chatSetting:
      return MaterialPageRoute(builder: (_) => ChatSettings());
    case RoutesConstant.groupSetting:
      return MaterialPageRoute(builder: (_) => GroupSetting());
    case RoutesConstant.post:
      return MaterialPageRoute(builder: (_) => Post());
    case RoutesConstant.chat:
      return MaterialPageRoute(
          builder: (_) => Chat(
                userChat: settings.arguments,
              ));
    case RoutesConstant.status:
      return MaterialPageRoute(
          builder: (_) => Status(
                user: settings.arguments,
              ));
    case RoutesConstant.media:
      return MaterialPageRoute(builder: (_) => Media());
    default:
      return MaterialPageRoute(
          builder: (_) => Scaffold(
                body: Center(
                    child: Text('No route defined for ${settings.name}')),
              ));
  }
}
