import 'dart:convert';

List<WatchlistData> watchlistDataFromJson(String str) => List<WatchlistData>.from(json.decode(str).map((x) => WatchlistData.fromJson(x)));

String watchlistDataToJson(List<WatchlistData> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class WatchlistData {
  WatchlistData({
    required this.id,
    required this.name,
    required this.contacts,
    required this.url,
  });

  String id;
  String name;
  String contacts;
  String url;

  factory WatchlistData.fromJson(Map<String, dynamic> json) => WatchlistData(
    id: json["id"],
    name: json["name"],
    contacts: json["Contacts"],
    url: json["url"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "Contacts": contacts,
    "url": url,
  };
}
