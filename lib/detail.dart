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

  parserIconWheather(code) {
    var w = const Icon(
      WeatherIcons.day_sunny,
      size: 80,
      color: Colors.white,
    );

    switch (code) {
      case "0":
        w = const Icon(
          WeatherIcons.day_sunny,
          size: 80,
          color: Colors.white,
        );
        break;
      case "1":
        w = const Icon(
          WeatherIcons.day_cloudy,
          size: 80,
          color: Colors.white,
        );
        break;
      case "2":
        w = const Icon(
          WeatherIcons.day_cloudy,
          size: 80,
          color: Colors.white,
        );
        break;
      case "3":
        w = const Icon(
          WeatherIcons.cloud,
          size: 80,
          color: Colors.white,
        );
        break;
      case "4":
        w = const Icon(
          WeatherIcons.cloudy,
          size: 80,
          color: Colors.white,
        );
        break;
      case "5":
        w = const Icon(
          WeatherIcons.wind_beaufort_0,
          size: 80,
          color: Colors.white,
        );
        break;
      case "10":
        w = const Icon(
          WeatherIcons.smoke,
          size: 80,
          color: Colors.white,
        );
        break;
      case "45":
        w = const Icon(
          WeatherIcons.day_sunny,
          size: 80,
          color: Colors.white,
        );
        break;
      case "60":
        w = const Icon(
          WeatherIcons.rain,
          size: 80,
          color: Colors.white,
        );
        break;
      case "61":
        w = const Icon(
          WeatherIcons.rain,
          size: 80,
          color: Colors.white,
        );
        break;
      case "63":
        w = const Icon(
          WeatherIcons.rain,
          size: 80,
          color: Colors.white,
        );
        break;
      case "80":
        w = const Icon(
          WeatherIcons.rain,
          size: 80,
          color: Colors.white,
        );
        break;
      case "95":
        w = const Icon(
          WeatherIcons.thunderstorm,
          size: 80,
          color: Colors.white,
        );
        break;
      case "97":
        w = const Icon(
          WeatherIcons.thunderstorm,
          size: 80,
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
    debugPrint(widget.infoData[6].toString());
    super.initState();
  }

  Widget topInfo(h, w) {
    double widthCol = w / 2;
    double heightColumn = h / 4;
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
                parserIconWheather(dataCuaca!['timerange'][0]['value']['\$t']),
                const SizedBox(height: 10),
                Text(parserWheather(dataCuaca!['timerange'][0]['value']['\$t']),
                    style: const TextStyle(color: Colors.white, fontSize: 14)),
                Row(
                  children: [
                    Text(
                        dataSuhu!['timerange'][0]['value'][0]['\$t'].toString(),
                        style:
                            const TextStyle(color: Colors.white, fontSize: 30)),
                    const Icon(WeatherIcons.celsius,
                        color: Colors.white, size: 28)
                  ],
                )
              ]),
        ),
        Container(
          padding: const EdgeInsets.all(0),
          width: widthCol,
          height: heightColumn,
          child: Column(children: [
            Text(
              widget.headerInfo[0]['\$t'].toString(),
              style: const TextStyle(fontSize: 26, color: Colors.white),
            ),
            Text("(${widget.headerInfo[1]['\$t']})",
                style: const TextStyle(fontSize: 14, color: Colors.white)),
            const SizedBox(height: 15),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  children: [
                    const Icon(Icons.water_drop_outlined,
                        color: Colors.white, size: 20),
                    const Text("70%",
                        style: TextStyle(fontSize: 14, color: Colors.white))
                  ],
                ),
                Column(
                  children: [
                    const Icon(WeatherIcons.windy,
                        color: Colors.white, size: 20),
                    const Text("18.5",
                        style: TextStyle(fontSize: 14, color: Colors.white))
                  ],
                ),
                Column(
                  children: [
                    const Icon(WeatherIcons.wind,
                        color: Colors.white, size: 20),
                    const Text("SE",
                        style: TextStyle(fontSize: 14, color: Colors.white))
                  ],
                )
              ],
            )
          ]),
        ),
      ],
    );
  }

  Widget bottomInfo(h, w) {
    double widthCol = w / 4;
    double heightColumn = h / 4 - 40;
    return Row(
      children: [
        Container(
          width: widthCol,
          height: heightColumn,
          child: Column(children: [
            const Text("Pagi", style: TextStyle(color: Colors.white)),
            const Icon(Icons.cloud_queue, color: Colors.white),
            const Text("23C", style: TextStyle(color: Colors.white))
          ]),
        ),
        Container(
          width: widthCol,
          height: heightColumn,
          child: Column(children: [
            const Text("Siang", style: TextStyle(color: Colors.white)),
            const Icon(Icons.cloud_queue, color: Colors.white),
            const Text("23C", style: TextStyle(color: Colors.white))
          ]),
        ),
        Container(
          width: widthCol,
          height: heightColumn,
          child: Column(children: [
            const Text("Malam", style: TextStyle(color: Colors.white)),
            const Icon(Icons.cloud_queue, color: Colors.white),
            const Text("23C", style: TextStyle(color: Colors.white))
          ]),
        ),
        Container(
          width: widthCol,
          height: heightColumn,
          child: Column(children: [
            const Text("Dini Hari", style: TextStyle(color: Colors.white)),
            const Icon(Icons.cloud_queue, color: Colors.white),
            const Text("23C", style: TextStyle(color: Colors.white))
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

    return Scaffold(
      appBar: AppBar(
          leading: BackButton(onPressed: () {
            Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                    builder: (context) =>
                        const Home(title: "Info Cuaca Jawa Timur")));
          }),
          title: Text(
            widget.title,
            style: const TextStyle(fontSize: 18),
          )),
      body: Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/images/bg-2.jpg"),
                fit: BoxFit.cover)),
        padding: const EdgeInsets.all(0),
        child: Stack(children: [
          Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                height: screenSize.height / 2,
                width: double.infinity,
                child: Column(children: [
                  topInfo(heightScreen, widthScreen),
                  Container(
                    padding: const EdgeInsets.only(left: 10),
                    height: 40,
                    alignment: Alignment.topLeft,
                    child: const Text("Perkiraan Cuaca",
                        style: TextStyle(color: Colors.white)),
                  ),
                  bottomInfo(heightScreen, widthScreen),
                ]),
              ))
        ]),
      ),
    );
  }
}
