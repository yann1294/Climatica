 import 'package:clima/screens/location_screen.dart';
  import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:clima/services/weather.dart';



  class LoadingScreen extends StatefulWidget {
    @override
    _LoadingScreenState createState() => _LoadingScreenState();
  }

  class _LoadingScreenState extends State<LoadingScreen> {


    @override
    Future initState() {

      super.initState();
      getLocationData();
      print("This line of code is triggered");

    }

    void getLocationData() async{

      WeatherModel weatherModel = new WeatherModel();
     var weatherData = await weatherModel.getLocationWeather();


      Navigator.push(context, MaterialPageRoute(builder: (context){

        return LocationScreen(locationWeather: weatherData,);

      }));

    }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: Center(
        child: SpinKitRipple(
          color: Colors.white,
          size: 100,
        ),
      ),
    );
  }

    }


