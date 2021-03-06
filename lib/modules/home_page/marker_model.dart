class MarkerModel {
  MarkerModel({
    this.name,
    this.next,
    this.fullness,
    this.lat,
    this.lng,
  });

  factory MarkerModel.fromJson(Map<String, String> json) => MarkerModel(
        name: json["name"],
        next: json["next"],
        fullness: json["fullness"],
        lat: json["lat"],
        lng: json["lng"],
      );

  String name;
  String next;
  String fullness;
  String lat;
  String lng;

  Map<String, dynamic> toJson() => {
        "name": name,
        "next": next,
        "fullness": fullness,
        "lat": lat,
        "lng": lng,
      };
}
