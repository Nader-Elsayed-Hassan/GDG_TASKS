class WetherModel {
  final String cityName;
  final String country;
  final double temperature;
  final String condition;
  final String iconUrl;
  final String region;
  final String windDirection;
  WetherModel({
    required this.cityName,
    required this.country,
    required this.temperature,
    required this.condition,
    required this.iconUrl,
    required this.region,
    required this.windDirection,
  });
  factory WetherModel.fromJson(Map<String, dynamic> json) {
    return WetherModel(
      cityName: json['location']['name'],
      country: json['location']['country'],
      temperature: json['current']['temp_c'],
      condition: json['current']['condition']['text'],
      iconUrl: "http:${json['current']['condition']['icon']}",
      region: json['location']['region'],
      windDirection: json['wind_dir'],
    );
  }
}
