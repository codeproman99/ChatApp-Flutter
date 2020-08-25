import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tymoff/provider/search_provider.dart';
import '../../constant/constant.dart';

class MessageList extends StatelessWidget {
  final messages;

  const MessageList({Key key, this.messages}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: ListView.builder(
        itemCount: messages.length,
        physics: BouncingScrollPhysics(),
        itemBuilder: (context, index) {
          return Consumer<SearchProvider>(builder: (context, searching, child) {
            return searching.searchingFilter == null ||
                    searching.searchingFilter == ""
                ? _messageList(context, index)
                : messages[index]["name"]
                        .toLowerCase()
                        .contains(searching.searchingFilter.toLowerCase())
                    ? _messageList(context, index)
                    : Container();
          });
        },
      ),
    );
  }

  Widget _messageList(context, index) {
    final searchProvider = Provider.of<SearchProvider>(context, listen: false);
    return InkWell(
      enableFeedback: true,
      onTap: () {
        searchProvider.searchString("");
        Navigator.pushNamed(context, RoutesConstant.chat,
            arguments: messages[index]);
      },
      child: Column(
        children: <Widget>[
          ListTile(
            leading: CircleAvatar(
                backgroundImage: NetworkImage(messages[index]["image"])),
            title:
                Text(messages[index]["name"], style: TextStyle(fontSize: 16)),
            subtitle: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(messages[index]["name"], style: TextStyle(fontSize: 12)),
                Text(messages[index]["last_time"],
                    style:
                        TextStyle(fontStyle: FontStyle.italic, fontSize: 10)),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            child: Divider(
              color: Colors.grey.withOpacity(0.5),
            ),
          )
        ],
      ),
    );
  }
}
