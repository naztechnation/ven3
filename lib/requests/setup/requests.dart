

import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:http/retry.dart';

import '../../handlers/request_handler.dart';
import '../../res/app_strings.dart';
import '../../utils/exceptions.dart';

class Requests {
  Future<dynamic> get(String route, {Map<String, String>? headers}) async {
    late dynamic map;
    debugPrint(route);
    final client = RetryClient(http.Client());
    try {
      await client
          .get(Uri.parse(route), headers: headers)
          .then((response) {
        map = json.decode(RequestHandler.handleServerError(response));

        /*if (!map["status"]) {
            throw ApiException(
                RequestHandler.handleApiError(map).first.msg!);
          }*/
      });
    } on SocketException {
      throw NetworkException(AppStrings.networkErrorMessage);
    } on HandshakeException {
      throw NetworkException(AppStrings.networkErrorMessage);
    } on FormatException catch (e) {
      throw NetworkException(e.toString());
    } finally {
      client.close();
    }
    return map;
  }

}