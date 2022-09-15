import 'dart:convert';

import 'package:cuaca/home.dart';
import 'package:flutter/material.dart';

class DetailInfo extends StatefulWidget {
  const DetailInfo({super.key, required this.title, required this.infoData});

  final String title;
  final List<dynamic> infoData;

  @override
  State<DetailInfo> createState() => _DetailInfoState();
}

class _DetailInfoState extends State<DetailInfo> {
  Map<String, dynamic>? dataDetail;

  @override
  void initState() {
    dataDetail = widget.infoData[0];
    debugPrint(widget.infoData[0].toString());
    super.initState();
  }

  Widget bottomInfo(widthScreen) {
    double widthCol = widthScreen / 4;
    return Row( 
      children: [
        Container(
          color: Colors.red,
          width: widthCol,
          height: 20,
        ),
        Container(
          color: Colors.blue,
          width: widthCol,
          height: 20,
        ),
        Container(
          color: Colors.amber,
          width: widthCol,
          height: 20,
        ),Container(
          color: Colors.green,
          width: widthCol,
          height: 20,
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
          title: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: const EdgeInsets.only(right: 15),
                child: const CircleAvatar(
                  radius: 15,
                  backgroundImage: AssetImage('assets/images/bmkg.png'),
                ),
              ),
              Text(
                widget.title,
                style: const TextStyle(fontSize: 18),
              )
            ],
          )),
      body: Container(
        color: Colors.lightBlue,
        padding: const EdgeInsets.all(0),
        child: Stack(children: [
          Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                color: Colors.white,
                height: screenSize.height / 2,
                width: double.infinity,
                child: Column(children: [
                  bottomInfo(widthScreen),
                ]),
              ))
        ]),
      ),
    );
  }
}
