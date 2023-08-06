import 'package:gurte_jaba/shared/domain/domain.dart';

abstract class Repository {
  Future<List<DataResponse>> getDataResponse();
}
