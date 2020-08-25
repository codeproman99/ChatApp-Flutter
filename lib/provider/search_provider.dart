import 'package:flutter/widgets.dart';

class SearchProvider extends ChangeNotifier {
  List<dynamic> searchResult = [];
  String searchingFilter;
  List<dynamic> get search {
    return searchResult;
  }

  void searchString(dynamic _search) {
    searchingFilter = _search;
    notifyListeners();
  }

  void addToSearchList(dynamic _search) {
    searchResult.add(_search);
    notifyListeners();
  }

  void removeFromSearchList(dynamic _search) {
    notifyListeners();
  }
}
