import 'package:flutter/material.dart';
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
    //TODO: metterie qui il fetch del meteo
    //queryWeather();
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topRight,
      child: Container(height: 200, width: 350, child: _resultView()),
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
          title: Text(_data[index].areaName),
          subtitle: Text(_data[index].temperature.toString()),
          trailing: _fetchButton(),
          leading: weatherIcon(_data[index].weatherMain),
        );
      },
    );
  }

  Widget contentDownloading() {
    return Container(
        margin: EdgeInsets.all(25),
        child: Column(children: [
          Text(
            'Fetching Weather...',
            style: TextStyle(fontSize: 20),
          ),
          Container(
              margin: EdgeInsets.only(top: 50),
              child: Center(child: CircularProgressIndicator(strokeWidth: 10)))
        ]));
  }

  Widget contentNotDownloaded() {
    return ListTile(
      title: Text(
        'Press the button to download the Weather forecast',
      ),
      trailing: _fetchButton(),
    );
  }

  Widget _fetchButton() {
    return IconButton(
      icon: Icon(Icons.refresh_rounded),
      onPressed: queryWeather,
    );
  }

  Widget weatherIcon(String condition) {
    //TODO: implementare iconcine decenti
    switch (condition) {
      case "Clouds":
        return Icon(Icons.cloud);
        break;
      case "Wind":
        return Text("vento");
        break;
      case "Clear":
        return Icon(Icons.wb_sunny);
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
