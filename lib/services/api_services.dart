import 'package:http/http.dart' as http;
import 'dart:convert';
import 'connection_manager.dart';
import 'package:the_sol_mag/error/error.dart';

const String SERVER_FAILURE_MESSAGE = "Server Failure";
const String FILE_NOT_FOUND = "File not found";
const String UNAUTHORIZED_ACCESS = "Unauthorized Access";
const String NO_INTERNET = "Please check your internet connection";
const String JSON_PARSING_ERROR = "There was an error parsing data";
const String INVALID_CERTIFICATE = "Invalid Server Certificate";

class APIService {
  static Future<Map<String, dynamic>> getEndpointData(String endpoint) async {
    print("Getting data for Endpoint $endpoint");
    bool connected = await ConnectionManager.isConnected();
    if (connected) {
      final response = await http.get(endpoint, headers: {
        "Content-Type": 'application/json'
      }).catchError((error) => {throw Error(message: NO_INTERNET)});

      if (response.statusCode == 200) {
        try {
          final Map<String, dynamic> data = json.decode(response.body);
          if (data != null) return data;
        } catch (e) {
          throw Error(message: e.toString());
          // throw Error(message: JSON_PARSING_ERROR);
        }
      }
      throw Error(message: APIService._mapErrorToMessage(response));
    } else {
      throw Error(message: NO_INTERNET);
    }
  }

  static Future<Map<String, dynamic>> postEndpointData(String endpoint,
      {Map<String, String> body}) async {
    print("Posting data for Endpoint $endpoint");
    print("Body ${jsonEncode(body)}");
    bool connected = await ConnectionManager.isConnected();
    if (connected) {
      final response = await http
          .post(endpoint,
              headers: {"Content-Type": 'application/json; charset=UTF-8'},
              body: jsonEncode(body) ?? "")
          .catchError((error) => {throw Error(message: NO_INTERNET)});

      if (response.statusCode == 200) {
        try {
          final Map<String, dynamic> data = json.decode(response.body);
          if (data != null) return data;
        } catch (e) {
          throw Error(message: e.toString());
          // throw Error(message: JSON_PARSING_ERROR);
        }
      }
      throw Error(message: APIService._mapErrorToMessage(response));
    } else {
      throw Error(message: NO_INTERNET);
    }
  }

  static String _mapErrorToMessage(http.Response response) {
    switch (response.statusCode.toInt()) {
      case 404:
        return FILE_NOT_FOUND;
      case 401:
        return UNAUTHORIZED_ACCESS;
      case 500:
        return SERVER_FAILURE_MESSAGE;
      default:
        return "Unexpected Error";
    }
  }
}
