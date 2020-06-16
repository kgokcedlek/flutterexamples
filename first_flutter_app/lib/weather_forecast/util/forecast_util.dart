import 'package:intl/intl.dart';

class Util{
  // static String appId = "ADD YOUR OWN APPID";
  static String appId = "108875289fee1d65fcd899e20e424d8d";

  static String getFormattedDate(DateTime dateTime){
    return new DateFormat("EEEE,MMM d, y").format(dateTime);
    //...1999
  }
}