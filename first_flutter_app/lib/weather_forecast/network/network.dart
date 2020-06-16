import 'dart:convert';

import 'package:first_flutter_app/weather_forecast/model/weather_forecast_model.dart';
import 'package:first_flutter_app/weather_forecast/util/forecast_util.dart';
import 'package:http/http.dart';

class Network{
  Future<WeatherForecastModel> getWeatherForeCast({String cityName}) async{

    //url i tanımla ve neyi çağıracaksan ona göre düzenlemesini yap
    var finalUrl = "https://samples.openweathermap.org/data/2.5/forecast/daily?q="+cityName+
        "&appid="+Util.appId;
    final response = await get(Uri.encodeFull(finalUrl));
    print("URL: ${Uri.encodeFull(finalUrl)}");
    if(response.statusCode == 200){

      print("wether data: ${response.body}");
      return(WeatherForecastModel.fromJson(json.decode(response.body)));
      // we get the actual mapped model (dart object)

    }
    else{
      throw Exception("Error getting weather forecast");
    }


  }
}