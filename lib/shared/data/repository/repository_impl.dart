import 'dart:convert';
import 'dart:io';

import 'package:gurte_jaba/shared/shared.dart';
import 'package:http/http.dart' as http;

class RepositoryImpl implements Repository {
  static const basedURL = 'http://mark.bslmeiyu.com/api';

  @override
  Future<List<DataResponse>> getDataResponse() async {
    const url = '/getplaces';
    http.Response response = await http.get(
      Uri.parse(basedURL + url),
    );
    try {
      if (response.statusCode == HttpStatus.ok) {
        final List<dynamic> json = jsonDecode(response.body);
        print(json);
        return json.map((e) => DataResponse.fromJson(e)).toList();
      } else {
        throw Exception('API call not successful : ${response.statusCode}');
      }
    } catch (e) {
      rethrow;
    }
  }
}
