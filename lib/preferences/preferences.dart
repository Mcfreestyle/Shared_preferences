import 'package:shared_preferences/shared_preferences.dart';

class Preferences {
  static late SharedPreferences _prefs;

  static String _img = '';
  static String _name = '';
  static String _lastName = '';
  static String _city = '';
  static String _country = '';
  static int _gender = 1;
  static bool _theme = false;

  static Future init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  //Getters and setters

  //IMG
  static String get img {
    return _prefs.getString('img') ?? _img;
  }

  static set img(String img) {
    _img = img;
    _prefs.setString('img', img);
  }

  //NAME
  static String get name {
    return _prefs.getString('name') ?? _name;
  }

  static set name(String name) {
    _name = name;
    _prefs.setString('name', name);
  }

  //LAST NAME
  static String get lastName {
    return _prefs.getString('lastName') ?? _lastName;
  }

  static set lastName(String lastName) {
    _lastName = lastName;
    _prefs.setString('lastName', lastName);
  }

  //CITY
  static String get city {
    return _prefs.getString('city') ?? _city;
  }

  static set city(String city) {
    _city = city;
    _prefs.setString('city', city);
  }

  //COUNTRY
  static String get country {
    return _prefs.getString('country') ?? _country;
  }

  static set country(String country) {
    _country = country;
    _prefs.setString('country', country);
  }

  //GENDER
  static int get gender {
    return _prefs.getInt('gender') ?? _gender;
  }

  static set gender(int gender) {
    _gender = gender;
    _prefs.setInt('gender', gender);
  }

  //THEME
  static bool get theme {
    return _prefs.getBool('theme') ?? _theme;
  }

  static set theme(bool value) {
    _theme = value;
    _prefs.setBool('theme', value);
  }
}
