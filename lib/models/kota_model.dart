class Kota {
  final String name;
  final String description;

  Kota({required this.name, required this.description});

  Kota.fromJson(Map json)
      : name = json['name'], description = json['description'];
}