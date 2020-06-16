
import 'package:first_flutter_app/util/convert_icon.dart';
import 'package:first_flutter_app/weather_forecast/model/weather_forecast_model.dart';
import 'package:first_flutter_app/weather_forecast/util/forecast_util.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class MidView extends StatelessWidget {
  final AsyncSnapshot<WeatherForecastModel> snapshot;

  const MidView({Key key, this.snapshot}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    var forecastList = snapshot.data.list;
    var city = snapshot.data.city.name;
    var country = snapshot.data.city.country;
    var formatteDate =new DateTime.fromMillisecondsSinceEpoch(forecastList[0].dt*1000);
    var forecast = forecastList[0];
    Container midView = Container(
      child: Padding(
        padding: const EdgeInsets.all(4.0),
        child:   Column(

          mainAxisAlignment: MainAxisAlignment.spaceBetween,

          children: <Widget>[
            //${} içindeki snapshot.data.city.name yi seçip refactor seçeneğinden

            //introduce variable seçerek bir variable oluştrup sonra burda

            //uzun uzun yazmadan çağırabiliyorsun.
            Text("${snapshot.data.city.name},$country",

              style: TextStyle(

                  fontWeight: FontWeight.bold,

                  fontSize: 18,

                  color: Colors.black87

              ),),
            Text("${Util.getFormattedDate(formatteDate)}", style: TextStyle(
                fontSize: 15
            ),),
            SizedBox(height: 10,),
            getWeatherIcon(weatherDescription: forecastList[0].weather[0].main,
                color: Colors.pinkAccent,
                size: 198),
            //Icon(Icons.wb_sunny,size:195 ,),
            //Icon(FontAwesomeIcons.cloud,size: 198,color: Colors.pinkAccent,),

            Padding(
              padding: const EdgeInsets.symmetric(vertical: 12,horizontal: 12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text("${forecastList[0].temp.day.toStringAsFixed(0)} °F",
                    style: TextStyle(
                        fontSize: 34
                    ),),
                  Text("${forecastList[0].weather[0].description.toUpperCase()}"),

                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 12.0,horizontal: 12.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,

                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text("${forecastList[0].speed.toStringAsFixed(1)} mi/h"),
                        Icon(FontAwesomeIcons.wind, size: 20, color: Colors.brown,)
                        //Icon(Icons.arrow_forward, size: 20, color: Colors.brown,)
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text("${forecastList[0].humidity.toStringAsFixed(0)} %"),
                        //Icon(Icons.hot_tub,size:20,color: Colors.brown,)
                        Icon(FontAwesomeIcons.solidGrinBeamSweat,size: 20, color: Colors.brown,)
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text("${forecastList[0].temp.max.toStringAsFixed(0)} °F"),
                        Icon(FontAwesomeIcons.temperatureHigh,size: 20, color: Colors.brown,)
                      ],
                    ),
                  )


                ],

              ),
            )


          ],

        ),
      ),
    );
    return midView;
  }
}


/*
Widget midView(AsyncSnapshot<WeatherForecastModel> snapshot){
  var forecastList = snapshot.data.list;
  var country = snapshot.data.city.country;
  var formatteDate =new DateTime.fromMillisecondsSinceEpoch(forecastList[0].dt*1000);
  Container midView = Container(
child: Padding(
  padding: const EdgeInsets.all(4.0),
  child:   Column(

    mainAxisAlignment: MainAxisAlignment.spaceBetween,

    children: <Widget>[
      //${} içindeki snapshot.data.city.name yi seçip refactor seçeneğinden

      //introduce variable seçerek bir variable oluştrup sonra burda

      //uzun uzun yazmadan çağırabiliyorsun.
      Text("${snapshot.data.city.name},$country",

      style: TextStyle(

        fontWeight: FontWeight.bold,

        fontSize: 18,

        color: Colors.black87

      ),),
      Text("${Util.getFormattedDate(formatteDate)}", style: TextStyle(
        fontSize: 15
      ),),
      SizedBox(height: 10,),
      getWeatherIcon(weatherDescription: forecastList[0].weather[0].main,
      color: Colors.pinkAccent,
      size: 198),
      //Icon(Icons.wb_sunny,size:195 ,),
      //Icon(FontAwesomeIcons.cloud,size: 198,color: Colors.pinkAccent,),
      
      Padding(
        padding: const EdgeInsets.symmetric(vertical: 12,horizontal: 12),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text("${forecastList[0].temp.day.toStringAsFixed(0)} °F",
            style: TextStyle(
              fontSize: 34
            ),),
            Text("${forecastList[0].weather[0].description.toUpperCase()}"),

          ],
        ),
      ),
      Padding(
        padding: const EdgeInsets.symmetric(vertical: 12.0,horizontal: 12.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,

          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text("${forecastList[0].speed.toStringAsFixed(1)} mi/h"),
                  Icon(FontAwesomeIcons.wind, size: 20, color: Colors.brown,)
                  //Icon(Icons.arrow_forward, size: 20, color: Colors.brown,)
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text("${forecastList[0].humidity.toStringAsFixed(0)} %"),
                  //Icon(Icons.hot_tub,size:20,color: Colors.brown,)
                  Icon(FontAwesomeIcons.solidGrinBeamSweat,size: 20, color: Colors.brown,)
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text("${forecastList[0].temp.max.toStringAsFixed(0)} °F"),
                  Icon(FontAwesomeIcons.temperatureHigh,size: 20, color: Colors.brown,)
                ],
              ),
            )


          ],

        ),
      )


    ],

  ),
),
  );
  return midView;
}*/