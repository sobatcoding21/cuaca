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
  Future<List<dynamic>> getDataCuacaJatim() async {
    var uRL =
        "https://data.bmkg.go.id/DataMKG/MEWS/DigitalForecast/DigitalForecast-JawaTimur.xml";
    //final document = XmlDocument.parse(uRL);
    //debugPrint(document.toString());

    final result = await http.get(Uri.parse(uRL));
    final Xml2Json xml2Json = Xml2Json();
    xml2Json.parse(result.body);
    var json = xml2Json.toGData();

    Map<String, dynamic> map = jsonDecode(json);
    return map['data']['forecast']['area'];
  }

  Widget buildListKota(item) {
    return Card(
        child: ListTile(
      trailing: IconButton(
        icon: const Icon(Icons.more_vert),
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(
              builder: ((context) => DetailInfo(
                  title: item['description'],
                  headerInfo: item['name'],
                  infoData: item['parameter']))));
        },
      ),
      title: Text(
        item['description'],
      ),
    ));
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text(widget.title)),
        body: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              const SizedBox(
                height: 20,
              ),
              TextField(
                onChanged: (value) {
                  //
                },
                decoration: const InputDecoration(
                    labelText: 'Search', suffixIcon: Icon(Icons.search)),
              ),
              const SizedBox(
                height: 20,
              ),
              Expanded(
                child: FutureBuilder<List<dynamic>>(
                  future: getDataCuacaJatim(),
                  builder: (BuildContext context, AsyncSnapshot snapshot) {
                    if (snapshot.hasData) {
                      return ListView.builder(
                          padding: const EdgeInsets.all(10),
                          itemCount: snapshot.data.length,
                          itemBuilder: (BuildContext context, int index) {
                            var item = snapshot.data[index];
                            //debugPrint(item.toString());
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
