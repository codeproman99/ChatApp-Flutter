import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tymoff/provider/search_provider.dart';

class SearchBar extends StatefulWidget {
  @override
  _SearchBarState createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  TextEditingController _searchController = new TextEditingController();
  String searchingFilter;
  @override
  Widget build(BuildContext context) {
    final searchProvider = Provider.of<SearchProvider>(context, listen: false);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: Container(
        height: MediaQuery.of(context).size.height / 15,
        decoration: new BoxDecoration(
            color: Color(0xffF9F9F9), borderRadius: BorderRadius.circular(2.0)),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 4.0),
          child: TextFormField(
              controller: _searchController,
              decoration: new InputDecoration(
                  // contentPadding: EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 17.0),
                  hintStyle: TextStyle(
                    fontSize: 15,
                  ),
                  prefixIcon: Icon(
                    Icons.search,
                    size: 25,
                    color: Colors.grey.withOpacity(0.8),
                  ),
                  border: InputBorder.none),
              onTap: () {
                setState(() {
                  _searchController.addListener(() {
                    setState(() {
                      searchProvider.searchString(_searchController.text);
                    });
                  });
                });
              }),
        ),
      ),
    );
  }
}
