import 'package:first_flutter_app/ui/forecast_card.dart';
import 'package:first_flutter_app/weather_forecast/model/weather_forecast_model.dart';
import 'package:flutter/material.dart';

//Better way of doing business
class BottomView extends StatelessWidget {

final AsyncSnapshot<WeatherForecastModel> snapshot;

  const BottomView({Key key, this.snapshot}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Text("7-Day Weather Forecast".toUpperCase(),
          style: TextStyle(
              fontSize: 14,
              color: Colors.black87
          ),),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal:8.0, vertical: 10.0),
          child: Container(
            height: 160,
            child: ListView.separated(
                scrollDirection: Axis.horizontal,
                separatorBuilder: (context, index)=>SizedBox(width: 8,),
                itemCount: snapshot.data.list.length,
                itemBuilder: (context,index)=>ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  child: Container(
                    width: MediaQuery.of(context).size.width/2.2,
                    height: 160,
                    child: forecastCard(snapshot,index),
                    decoration: BoxDecoration(
                        gradient: LinearGradient(colors: [Color(0xff9661C3),Colors.white],
                            begin: Alignment.topLeft,end:Alignment.bottomRight )
                    ),
                  ),

                )),

          ),
        )
      ],
    );
  }
}

//yukardaki gibi stless oluşturmak yerine aşağıdaki gibi de yazabilirdik.
Widget botttomView(AsyncSnapshot<WeatherForecastModel> snapshot, BuildContext context){
  var forecastList =snapshot.data.list;

  return Column(
    mainAxisAlignment: MainAxisAlignment.start,
    children: <Widget>[
      Text("7-Day Weather Forecast".toUpperCase(),
      style: TextStyle(
        fontSize: 14,
        color: Colors.black87
      ),),
      Padding(
        padding: const EdgeInsets.symmetric(horizontal:8.0, vertical: 10.0),
        child: Container(
          height: 160,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
                separatorBuilder: (context, index)=>SizedBox(width: 8,),
                itemCount: forecastList.length,
                itemBuilder: (context,index)=>ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  child: Container(
                    width: MediaQuery.of(context).size.width/2.2,
                    height: 160,
                    child: forecastCard(snapshot,index),
                    decoration: BoxDecoration(
                      gradient: LinearGradient(colors: [Color(0xff9661C3),Colors.white],
                      begin: Alignment.topLeft,end:Alignment.bottomRight )
                    ),
                  ),

                )),

        ),
      )
    ],
  );
}