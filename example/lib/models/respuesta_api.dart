// To parse this JSON data, do
//
//     final respuestaApi = respuestaApiFromJson(jsonString);

import 'dart:convert';

List<RespuestaApi> respuestaApiFromJson(String str) => List<RespuestaApi>.from(
    json.decode(str).map((x) => RespuestaApi.fromJson(x)));

String respuestaApiToJson(List<RespuestaApi> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class RespuestaApi {
  bool isSuccess;
  List<dynamic> result;
  String displayMessage;
  dynamic errorMessage;
  dynamic token;

  RespuestaApi({
    required this.isSuccess,
    required this.result,
    required this.displayMessage,
    required this.errorMessage,
    required this.token,
  });

  factory RespuestaApi.fromJson(Map<String, dynamic> json) => RespuestaApi(
        isSuccess: json["isSuccess"],
        result: List<dynamic>.from(json["result"].map((x) => x)),
        displayMessage: json["displayMessage"],
        errorMessage: json["errorMessage"],
        token: json["token"],
      );

  Map<String, dynamic> toJson() => {
        "isSuccess": isSuccess,
        "result": List<dynamic>.from(result.map((x) => x)),
        "displayMessage": displayMessage,
        "errorMessage": errorMessage,
        "token": token,
      };
}
