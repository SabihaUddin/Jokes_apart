// To parse this JSON data, do
//
//     final countryModel = countryModelFromJson(jsonString);

import 'dart:convert';

List<JokesModel> countryModelFromJson(String str) => List<JokesModel>.from(json.decode(str).map((x) => JokesModel.fromJson(x)));

String countryModelToJson(List<JokesModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class JokesModel {
  JokesModel({
    this.id,
    this.countryModelType,
    this.setup,
    this.punchline,
    this.type,
  });

  int? id;
  String? countryModelType;
  String? setup;
  String? punchline;
  String? type;

  factory JokesModel.fromJson(Map<String, dynamic> json) => JokesModel(
    id: json["id"],
    countryModelType: json["type"] == null ? null : json["type"],
    setup: json["setup"],
    punchline: json["punchline"],
    type: json[" type"] == null ? null : json[" type"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "type": countryModelType == null ? null : countryModelType,
    "setup": setup,
    "punchline": punchline,
    " type": type == null ? null : type,
  };
}
