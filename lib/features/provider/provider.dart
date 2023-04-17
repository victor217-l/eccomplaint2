import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../model/user.dart';
import '../model/user_model.dart';

class UserProvider extends ChangeNotifier{
  User _user = User(
    id: '',
    name: '',
    email: '',
    password: '',
    data: [],
    type: '',
     age: '', surname: '',
  );


  User get user => _user;

  void setUser(String user) {
    _user = User.fromJson(user);
    notifyListeners();
  }
}

class DataStorage extends ChangeNotifier {


}


