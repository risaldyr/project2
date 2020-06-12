import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ApplicationColor with ChangeNotifier{
  bool _isLightBlack = true;

  bool get isLightBlack => _isLightBlack;
  set isLightBlack(bool value)
  {
    _isLightBlack = value;
    notifyListeners();
  }

  Color get color => (_isLightBlack) ? Colors.black :  Colors.white;
}