import 'dart:async';
import 'dart:convert';

import 'package:cuaca/detail.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
//import 'package:xml/xml.dart';
import 'package:xml2json/xml2json.dart';

class Home extends StatefulWidget {
  const Home({super.key, required this.title});
  final String title;

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController searchController = TextEditingController();
  String textSearch = '';
  StreamController? streamDataBMKG;

  Future<List<dynamic>> fetchDataBMKGJatim() async {
    var uRL =
        "https://data.bmkg.go.id/DataMKG/MEWS/DigitalForecast/DigitalForecast-JawaTimur.xml";

    final result = await http.get(Uri.parse(uRL));
    final Xml2Json xml2Json = Xml2Json();
    xml2Json.parse(result.body);
    var json = xml2Json.toGData();

    Map<String, dynamic> map = jsonDecode(json);
    return map['data']['forecast']['area'];
  }

  Widget buildListKota(item) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
            builder: ((context) => DetailInfo(
                title: item['description'],
                headerInfo: item['name'],
                infoData: item['parameter']))));
      },
      child: Card(
          child: ListTile(
        title: Text(
          item['description'],
        ),
        subtitle: Text(item['name'][1]['\$t'].toString()),
      )),
    );
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            widget.title,
            style: const TextStyle(fontSize: 18),
          ),
          centerTitle: true,
        ),
        body: Container(
          color: Colors.lightBlue,
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.all(13.0),
                child: TextField(
                  controller: searchController,
                  onChanged: (value) {
                    setState(() {
                      textSearch = value;
                    });
                  },
                  decoration: const InputDecoration(
                      labelText: 'Cari disini ...',
                      suffixIcon: Icon(Icons.search),
                      fillColor: Colors.white,
                      filled: true,
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(width: 2, color: Colors.white10),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(width: 2, color: Colors.white38),
                      )),
                ),
              ),
              Container(
                height: 20,
                decoration: const BoxDecoration(
                  border: Border(
                    bottom: BorderSide(width: 0.8, color: Colors.white),
                  ),
                ),
              ),
              Expanded(
                child: FutureBuilder<List<dynamic>>(
                  future: fetchDataBMKGJatim(),
                  builder: (BuildContext context, AsyncSnapshot snapshot) {
                    if (snapshot.hasError) {
                      return Text("${snapshot.error}");
                    }

                    if (snapshot.hasData) {
                      List<dynamic> dataKota = snapshot.data;
                      if (textSearch.isNotEmpty) {
                        dataKota = dataKota.where((element) {
                          return element['description']
                              .toString()
                              .toLowerCase()
                              .contains(textSearch.toString().toLowerCase());
                        }).toList();
                      }
                      return ListView.builder(
                          padding: const EdgeInsets.all(10),
                          itemCount: dataKota.length,
                          itemBuilder: (BuildContext context, int index) {
                            var item = dataKota[index];
                            return buildListKota(item);
                          });
                    } else {
                      return const Center(child: CircularProgressIndicator());
                    }
                  },
                ),
              ),
            ],
          ),
        ));
  }
}
