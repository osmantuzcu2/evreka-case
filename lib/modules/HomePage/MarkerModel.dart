class MarkerModel {
  MarkerModel({
    this.name,
    this.next,
    this.fullness,
    this.lat,
    this.lng,
  });

  String name;
  String next;
  String fullness;
  String lat;
  String lng;

  factory MarkerModel.fromJson(Map<String, dynamic> json) => MarkerModel(
        name: json["name"],
        next: json["next"],
        fullness: json["fullness"],
        lat: json["lat"],
        lng: json["lng"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "next": next,
        "fullness": fullness,
        "lat": lat,
        "lng": lng,
      };
}

class MarkerModelFireBase {
  MarkerModelFireBase({
    this.next,
    this.lng,
    this.fullness,
    this.name,
    this.lat,
  });

  DateTime next;
  double lng;
  double fullness;
  String name;
  double lat;

  factory MarkerModelFireBase.fromJson(Map<String, dynamic> json) =>
      MarkerModelFireBase(
        next: DateTime.parse(json["next"]),
        lng: json["lng"].toDouble(),
        fullness: json["fullness"].toDouble(),
        name: json["name"],
        lat: json["lat"].toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "next": next.toIso8601String(),
        "lng": lng,
        "fullness": fullness,
        "name": name,
        "lat": lat,
      };
}
