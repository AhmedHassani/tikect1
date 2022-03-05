import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

import 'package:ticket1/Model/delete_response.dart';
import 'package:ticket1/Model/model_http.dart';

/*
  Base Repository
  method : insert
  method : delete
  method : find
  method : find by id
 */
abstract class BaseRepository<T> {
  String domain = "192.168.224.250:8000";

  Future<List<T>> findAll(
      {required String endpoint, Map<String, dynamic>? header}) async {
    var uri = Uri.http(
      domain,
      endpoint,
    );
    final response = await http.get(uri);
    var responseData = json.decode(response.body);
    return responseData;
  }

  Future<T> findById(
      {required String endpoint, Map<String, dynamic>? header}) async {
    var uri = Uri.http(domain, endpoint);
    final response = await http.get(uri);
    var responseData = json.decode(response.body);
    return responseData;
  }

  Future<DeleteResponse> delete(
      {required String endpoint, required int id}) async {
    var uri = Uri.http(domain, endpoint);
    final response = await http.get(uri);
    var responseData = json.decode(response.body);
    return responseData;
  }

  Future<ModelHttp> save({
    required String endpoint,
    required Map<String, String> header,
    required Map<String, dynamic> body,
  }) async {
    var response;
    var uri = Uri.http(domain, endpoint);
    try {
      response = await http.post(uri, headers: header, body: jsonEncode(body));
      return ModelHttp(
          model: jsonDecode(response.body),
          statusCode: response.statusCode,
          error: "Not error");
    } catch (er) {
      return ModelHttp(
          model: response.body,
          statusCode: response.statusCode,
          error: "Error : some thank waring !");
    }
  }
}
