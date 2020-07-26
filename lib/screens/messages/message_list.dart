import 'package:flutter/material.dart';

import '../../constant/constant.dart';

class MessageList extends StatelessWidget {
  final messages;

  const MessageList({Key key, this.messages}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: ListView.separated(
        separatorBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            child: Divider(
              color: Colors.grey.withOpacity(0.5),
            ),
          );
        },
        itemCount: messages.length,
        physics: BouncingScrollPhysics(),
        itemBuilder: (context, index) {
          return InkWell(
            enableFeedback: true,
            onTap: () {
              Navigator.pushNamed(context, RoutesConstant.chat,
                  arguments: messages[index]);
            },
            child: ListTile(
              leading: CircleAvatar(
                  backgroundImage: NetworkImage(messages[index]["image"])),
              title:
                  Text(messages[index]["name"], style: TextStyle(fontSize: 18)),
              subtitle: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(messages[index]["name"]),
                  Text(messages[index]["last_time"],
                      style: TextStyle(fontStyle: FontStyle.italic)),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
