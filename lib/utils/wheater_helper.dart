import 'package:flutter/material.dart';
import 'package:weather_icons/weather_icons.dart';

parserWheather(code) {
  String w = "";
  switch (code) {
    case "0":
      w = 'Cerah';
      break;
    case "1":
      w = 'Cerah Berawan';
      break;
    case "2":
      w = 'Cerah Berawan';
      break;
    case "3":
      w = 'Berawan';
      break;
    case "4":
      w = 'Berawan Tebal';
      break;
    case "5":
      w = 'Udara Kabur';
      break;
    case "10":
      w = 'Asap';
      break;
    case "45":
      w = 'Kabut';
      break;
    case "60":
      w = 'Hujan Ringan';
      break;
    case "61":
      w = 'Hujan Sedang';
      break;
    case "63":
      w = 'Hujan Lebat';
      break;
    case "80":
      w = 'Hujan Lokal';
      break;
    case "95":
      w = 'Hujan Petir';
      break;
    case "97":
      w = 'Hujan Petir';
      break;
  }
  return w;
}

parserIconWheather(code, double iconSize) {
  var w = Icon(
    WeatherIcons.day_sunny,
    size: iconSize,
    color: Colors.white,
  );

  switch (code) {
    case "0":
      w = Icon(
        WeatherIcons.day_sunny,
        size: iconSize,
        color: Colors.white,
      );
      break;
    case "1":
      w = Icon(
        WeatherIcons.day_cloudy,
        size: iconSize,
        color: Colors.white,
      );
      break;
    case "2":
      w = Icon(
        WeatherIcons.day_cloudy,
        size: iconSize,
        color: Colors.white,
      );
      break;
    case "3":
      w = Icon(
        WeatherIcons.cloud,
        size: iconSize,
        color: Colors.white,
      );
      break;
    case "4":
      w = Icon(
        WeatherIcons.cloudy,
        size: iconSize,
        color: Colors.white,
      );
      break;
    case "5":
      w = Icon(
        WeatherIcons.wind_beaufort_0,
        size: iconSize,
        color: Colors.white,
      );
      break;
    case "10":
      w = Icon(
        WeatherIcons.smoke,
        size: iconSize,
        color: Colors.white,
      );
      break;
    case "45":
      w = Icon(
        WeatherIcons.day_sunny,
        size: iconSize,
        color: Colors.white,
      );
      break;
    case "60":
      w = Icon(
        WeatherIcons.rain,
        size: iconSize,
        color: Colors.white,
      );
      break;
    case "61":
      w = Icon(
        WeatherIcons.rain,
        size: iconSize,
        color: Colors.white,
      );
      break;
    case "63":
      w = Icon(
        WeatherIcons.rain,
        size: iconSize,
        color: Colors.white,
      );
      break;
    case "80":
      w = Icon(
        WeatherIcons.rain,
        size: iconSize,
        color: Colors.white,
      );
      break;
    case "95":
      w = Icon(
        WeatherIcons.thunderstorm,
        size: iconSize,
        color: Colors.white,
      );
      break;
    case "97":
      w = Icon(
        WeatherIcons.thunderstorm,
        size: iconSize,
        color: Colors.white,
      );
      break;
  }

  return w;
}
