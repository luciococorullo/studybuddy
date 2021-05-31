import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:studybuddy/shared/costants.dart';
import 'package:weather/weather.dart';

enum AppState { NOT_DOWNLOADED, DOWNLOADING, FINISHED_DOWNLOADING }

class WeatherWidget extends StatefulWidget {
  @override
  _WeatherWidgetState createState() => _WeatherWidgetState();
}

class _WeatherWidgetState extends State<WeatherWidget> {
  String key = '856822fd8e22db5e1ba48c0e7d69844a';
  WeatherFactory ws;
  List<Weather> _data = [];
  AppState _state = AppState.NOT_DOWNLOADED;

  @override
  void initState() {
    super.initState();
    ws = new WeatherFactory(key);
    //TODO: metterie qui il fetch del meteo?
  }

  @override
  Widget build(BuildContext context) {
    //queryWeather();
    return Container(
      //TODO: definire size dinamico
      height: 100,
      width: 300,
      child: _resultView(),
      decoration:
          BoxDecoration(color: glass, borderRadius: BorderRadius.circular(10)),
    );
  }

  void queryWeather() async {
    FocusScope.of(context).requestFocus(FocusNode());

    setState(() {
      _state = AppState.DOWNLOADING;
    });

    Weather weather = await ws.currentWeatherByCityName("Naples");
    setState(() {
      _data = [weather];
      _state = AppState.FINISHED_DOWNLOADING;
    });
  }

  Widget contentFinishedDownload() {
    return ListView.builder(
      itemCount: _data.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(_data[index].areaName,
              style: GoogleFonts.montserrat(
                  textStyle: TextStyle(
                color: Colors.white,
                fontSize: 18,
              ))),
          subtitle: Text(_data[index].temperature.toString(),
              style: GoogleFonts.montserrat(
                  textStyle: TextStyle(
                color: Colors.white,
                fontSize: 15,
              ))),
          trailing: _fetchButton(),
          leading: weatherIcon(_data[index].weatherMain),
        );
      },
    );
  }

  Widget contentDownloading() {
    return ListTile(
      title: Text(
        'Fetching Weather...',
        style: TextStyle(fontSize: 20),
      ),
    );
  }

  Widget contentNotDownloaded() {
    return ListTile(
      title: Text("Naples",
          style: GoogleFonts.montserrat(
              textStyle: TextStyle(
            color: Colors.white,
            fontSize: 18,
          ))),
      subtitle: Text("18.5 Celsius",
          style: GoogleFonts.montserrat(
              textStyle: TextStyle(
            color: Colors.white,
            fontSize: 15,
          ))),
      trailing: _fetchButton(),
      leading: weatherIcon("Clear"),
    );
  }

  Widget _fetchButton() {
    return IconButton(
      icon: Icon(
        Icons.refresh_rounded,
        color: Colors.white,
      ),
      onPressed: queryWeather,
    );
  }

  Widget weatherIcon(String condition) {
    //TODO: implementare iconcine decenti
    switch (condition) {
      case "Clouds":
        return Icon(
          Icons.cloud,
          color: Colors.white,
        );
        break;
      case "Wind":
        return Text("vento");
        break;
      case "Clear":
        return Icon(
          Icons.wb_sunny,
          color: Colors.white,
        );
      case "Rain":
        return Text("pioggia");
      case "Clouds":
        return Text("neve");
        break;
      default:
        return Text("?");
    }
  }

  Widget _resultView() => _state == AppState.FINISHED_DOWNLOADING
      ? contentFinishedDownload()
      : _state == AppState.DOWNLOADING
          ? contentDownloading()
          : contentNotDownloaded();
}
