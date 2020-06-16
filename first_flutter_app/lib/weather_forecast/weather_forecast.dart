import 'package:first_flutter_app/ui/bottom_view.dart';
import 'package:first_flutter_app/ui/mid_v%C4%B1ew.dart';
import 'package:first_flutter_app/weather_forecast/model/weather_forecast_model.dart';
import 'package:first_flutter_app/weather_forecast/network/network.dart';
import 'package:flutter/material.dart';

class WeatherForecast extends StatefulWidget {
  @override
  _WeatherForecastState createState() => _WeatherForecastState();
}

class _WeatherForecastState extends State<WeatherForecast> {
Future<WeatherForecastModel> forecastObject;
String _citName = "San Diego";
  //initial yapıcaz.
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
   // forecastObject = Network().getWeatherForeCast(cityName:_citName);
    forecastObject = getWeather(cityName: _citName);
//    forecastObject.then((weather){
//print(weather.list[0].weather[0].main);
//    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: <Widget>[
          textFieldView(),
          Container(
            child: FutureBuilder<WeatherForecastModel>(
              future: forecastObject,
              builder: (BuildContext context, AsyncSnapshot<WeatherForecastModel> snapshot){
                if(snapshot.hasData){
                  return Column(
                    children: <Widget>[
                      MidView(snapshot: snapshot,),
                      //midView(snapshot),
                      BottomView(snapshot: snapshot,)
                      //botttomView(snapshot,context)
                    ],
                  );
                }
                else{
                  return Container(
                    child: Center(
                      child: CircularProgressIndicator(),
                    ),
                  );
                }
            },
            ),
          )
        ],
      ),
    );
  }

 Widget textFieldView() {
    return Container(
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: TextField(
          decoration: InputDecoration(
            hintText: "Enter CityName",
            prefixIcon: Icon(Icons.search),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0)),
              contentPadding: EdgeInsets.all(8.0)
            ),
              onSubmitted: (value){
            setState(() {
              _citName =value;
              //aşağıdaki newden sonra seçip sağ tıklayıp refactorden extract method ile
              // bir methoda çevirdik. kendimiz isim verdik ve bir method oluştu.
              //o isimle çağırmış olduk. kısaca yazalım diye.
              //forecastObject= new Network().getWeatherForeCast(cityName: _citName);
              forecastObject= getWeather(cityName: _citName);
            });

              },
          ),
      ),
      );

  }

 Future<WeatherForecastModel> getWeather({String cityName }) => new Network().getWeatherForeCast(cityName: _citName);
}
