import 'package:flutter/material.dart';
import 'package:clima/services/location.dart';


class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {

  @override
  Future initState() {

    super.initState();
    getLocation();

  }

  void getLocation() async{

    Location location = new Location();
   await location.getCurrentLocation();
   print(location.latitude);
   print(location.longitude);

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
