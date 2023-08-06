import 'dart:convert';
import 'package:gurte_jaba/shared/shared.dart';

class RepositoryImpl implements Repository {
  RepositoryImpl(this.networkUtils);

  final NetworkUtils networkUtils;
  @override
  Future<List<DataResponse>> getDataResponse() async {
    try {
      final response = await networkUtils.get(UrlConstants.url);
      if (response.statusCode == 200) {
        final List<dynamic> list = jsonDecode(response.body);
        return list.map((e) => DataResponse.fromJson(e)).toList();
      } else {
        throw Exception('API call not successful : ${response.statusCode}');
      }
    } catch (e) {
      rethrow;
    }
  }
}
