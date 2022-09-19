import 'package:cuaca/home.dart';
import 'package:flutter/material.dart';
import 'package:weather_icons/weather_icons.dart';

class DetailInfo extends StatefulWidget {
  const DetailInfo(
      {super.key,
      required this.title,
      required this.headerInfo,
      required this.infoData});

  final String title;
  final List<dynamic> infoData;
  final List<dynamic> headerInfo;

  @override
  State<DetailInfo> createState() => _DetailInfoState();
}

class _DetailInfoState extends State<DetailInfo> {
  Map<String, dynamic>? dataDetail;
  Map<String, dynamic>? dataSuhu;
  Map<String, dynamic>? dataCuaca;
  List<dynamic>? perkiraanCuaca;
  Map<String, dynamic>? humadity;
  Map<String, dynamic>? windDirection;
  Map<String, dynamic>? windSpeed;

  String? nama;
  String? detail;

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

  @override
  void initState() {
    dataDetail = widget.infoData[0];
    dataSuhu = widget.infoData[2];
    dataCuaca = widget.infoData[6];
    perkiraanCuaca = widget.infoData[5]['timerange'];
    humadity = widget.infoData[1];
    windDirection = widget.infoData[7];
    windSpeed = widget.infoData[8];

    super.initState();
  }

  Widget topInfo(h, w) {
    double widthCol = w / 2;
    double heightColumn = (h / 4) + 20;
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.all(10),
          width: widthCol,
          height: heightColumn,
          child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                parserIconWheather(
                    dataCuaca!['timerange'][0]['value']['\$t'], 78),
                const SizedBox(height: 25),
                Text(parserWheather(dataCuaca!['timerange'][0]['value']['\$t']),
                    style: const TextStyle(color: Colors.white, fontSize: 18)),
                Row(
                  children: [
                    Text(
                        dataSuhu!['timerange'][0]['value'][0]['\$t'].toString(),
                        style:
                            const TextStyle(color: Colors.white, fontSize: 32)),
                    const Icon(WeatherIcons.celsius,
                        color: Colors.white, size: 28)
                  ],
                )
              ]),
        ),
        Container(
          padding: const EdgeInsets.all(10),
          width: widthCol,
          height: heightColumn,
          child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  widget.headerInfo[0]['\$t'].toString(),
                  textAlign: TextAlign.right,
                  style: const TextStyle(fontSize: 22, color: Colors.white),
                ),
                Text("(${widget.headerInfo[1]['\$t']})",
                    textAlign: TextAlign.right,
                    style: const TextStyle(fontSize: 14, color: Colors.white)),
                const SizedBox(height: 15),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Column(
                      children: [
                        const Icon(Icons.water_drop,
                            color: Colors.blueAccent, size: 28),
                        const SizedBox(height: 8),
                        Text("${humadity!['timerange'][0]['value']['\$t']}%",
                            style: const TextStyle(
                                fontSize: 14, color: Colors.white)),
                        const SizedBox(height: 20),
                      ],
                    ),
                    Column(
                      children: [
                        const Icon(WeatherIcons.strong_wind,
                            color: Colors.yellowAccent, size: 28),
                        const SizedBox(height: 8),
                        Text(
                            windSpeed!['timerange'][0]['value'][2]['\$t']
                                .toString(),
                            style: const TextStyle(
                                fontSize: 14, color: Colors.white)),
                        Container(
                            margin: const EdgeInsets.all(0),
                            height: 20,
                            child: const Text("km/jam",
                                style: TextStyle(
                                    fontSize: 12, color: Colors.white))),
                      ],
                    ),
                    Column(
                      children: [
                        const Icon(WeatherIcons.wind,
                            color: Colors.yellowAccent, size: 28),
                        const SizedBox(height: 8),
                        Text(
                            windDirection!['timerange'][0]['value'][1]['\$t']
                                .toString(),
                            style: const TextStyle(
                                fontSize: 14, color: Colors.white)),
                        const SizedBox(height: 20),
                      ],
                    )
                  ],
                )
              ]),
        ),
      ],
    );
  }

  Widget bottomInfo(h, w, data) {
    double widthCol = w / 4;
    double heightColumn = (h / 4) - 60;

    Map<String, dynamic> cuacaPagi = data[1];
    Map<String, dynamic> cuacaSiang = data[2];
    Map<String, dynamic> cuacaSore = data[3];
    Map<String, dynamic> cuacaMalam = data[4];

    return Row(
      children: [
        Container(
          padding: const EdgeInsets.all(0),
          width: widthCol,
          height: heightColumn,
          child: Column(children: [
            const Text("Pagi",
                style: TextStyle(color: Colors.white, fontSize: 12)),
            parserIconWheather(dataCuaca!['timerange'][1]['value']['\$t'], 35),
            const SizedBox(height: 13),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(cuacaPagi['value'][0]['\$t'].toString(),
                    style: const TextStyle(color: Colors.white)),
                const Icon(
                  WeatherIcons.celsius,
                  size: 14,
                  color: Colors.white,
                )
              ],
            )
          ]),
        ),
        Container(
          padding: const EdgeInsets.all(0),
          width: widthCol,
          height: heightColumn,
          child: Column(children: [
            const Text("Siang",
                style: TextStyle(color: Colors.white, fontSize: 12)),
            parserIconWheather(dataCuaca!['timerange'][2]['value']['\$t'], 35),
            const SizedBox(height: 13),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(cuacaSiang['value'][0]['\$t'].toString(),
                    style: const TextStyle(color: Colors.white)),
                const Icon(
                  WeatherIcons.celsius,
                  size: 14,
                  color: Colors.white,
                )
              ],
            )
          ]),
        ),
        Container(
          padding: const EdgeInsets.all(0),
          width: widthCol,
          height: heightColumn,
          child: Column(children: [
            const Text("Malam",
                style: TextStyle(color: Colors.white, fontSize: 12)),
            parserIconWheather(dataCuaca!['timerange'][3]['value']['\$t'], 35),
            const SizedBox(height: 13),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(cuacaSore['value'][0]['\$t'].toString(),
                    style: const TextStyle(color: Colors.white)),
                const Icon(
                  WeatherIcons.celsius,
                  size: 14,
                  color: Colors.white,
                )
              ],
            )
          ]),
        ),
        Container(
          padding: const EdgeInsets.all(0),
          width: widthCol,
          height: heightColumn,
          child: Column(children: [
            const Text("Dini Hari",
                style: TextStyle(color: Colors.white, fontSize: 12)),
            parserIconWheather(dataCuaca!['timerange'][4]['value']['\$t'], 35),
            const SizedBox(height: 13),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(cuacaMalam['value'][0]['\$t'].toString(),
                    style: const TextStyle(color: Colors.white)),
                const Icon(
                  WeatherIcons.celsius,
                  size: 14,
                  color: Colors.white,
                )
              ],
            )
          ]),
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final widthScreen = MediaQuery.of(context).size.width;
    final heightScreen = MediaQuery.of(context).size.height;
    Size screenSize = MediaQuery.of(context).size;

    return DefaultTabController(
      initialIndex: 1,
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
          bottom: const TabBar(
            tabs: <Widget>[
              Tab(
                text: "Hari ini",
              ),
              Tab(
                text: "Besok",
              ),
              Tab(
                text: "Lusa",
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: <Widget>[
            Center(
              child: Container(
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage("assets/images/bg-2.jpg"),
                        fit: BoxFit.cover)),
                padding: const EdgeInsets.all(0),
                child: Stack(children: [
                  Align(
                      alignment: Alignment.bottomCenter,
                      child: Container(
                        padding: const EdgeInsets.all(0),
                        height: screenSize.height / 2,
                        width: double.infinity,
                        child: Column(children: [
                          topInfo(heightScreen, widthScreen),
                          Container(
                            padding: const EdgeInsets.only(left: 10),
                            margin: const EdgeInsets.only(bottom: 8),
                            height: 30,
                            alignment: Alignment.topLeft,
                            decoration: const BoxDecoration(
                              border: Border(
                                bottom:
                                    BorderSide(width: 0.8, color: Colors.white),
                              ),
                            ),
                            child: const Text("Perkiraan Cuaca",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 12)),
                          ),
                          bottomInfo(heightScreen, widthScreen, perkiraanCuaca),
                        ]),
                      ))
                ]),
              ),
            ),
            Center(
              child: Container(
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage("assets/images/bg-2.jpg"),
                        fit: BoxFit.cover)),
                padding: const EdgeInsets.all(0),
                child: Stack(children: [
                  Align(
                      alignment: Alignment.bottomCenter,
                      child: Container(
                        padding: const EdgeInsets.all(0),
                        height: screenSize.height / 2,
                        width: double.infinity,
                        child: Column(children: [
                          topInfo(heightScreen, widthScreen),
                          Container(
                            padding: const EdgeInsets.only(left: 10),
                            margin: const EdgeInsets.only(bottom: 8),
                            height: 30,
                            alignment: Alignment.topLeft,
                            decoration: const BoxDecoration(
                              border: Border(
                                bottom:
                                    BorderSide(width: 0.8, color: Colors.white),
                              ),
                            ),
                            child: const Text("Perkiraan Cuaca",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 12)),
                          ),
                          bottomInfo(heightScreen, widthScreen, perkiraanCuaca),
                        ]),
                      ))
                ]),
              ),
            ),
            Center(
              child: Container(
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage("assets/images/bg-2.jpg"),
                        fit: BoxFit.cover)),
                padding: const EdgeInsets.all(0),
                child: Stack(children: [
                  Align(
                      alignment: Alignment.bottomCenter,
                      child: Container(
                        padding: const EdgeInsets.all(0),
                        height: screenSize.height / 2,
                        width: double.infinity,
                        child: Column(children: [
                          topInfo(heightScreen, widthScreen),
                          Container(
                            padding: const EdgeInsets.only(left: 10),
                            margin: const EdgeInsets.only(bottom: 8),
                            height: 30,
                            alignment: Alignment.topLeft,
                            decoration: const BoxDecoration(
                              border: Border(
                                bottom:
                                    BorderSide(width: 0.8, color: Colors.white),
                              ),
                            ),
                            child: const Text("Perkiraan Cuaca",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 12)),
                          ),
                          bottomInfo(heightScreen, widthScreen, perkiraanCuaca),
                        ]),
                      ))
                ]),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
