import 'package:personal_project/config/helpers/api.dart';
import 'package:personal_project/config/helpers/endpoints.dart';

class AntigenDataSource {
  Future<bool> validateAntigen(String userId, String code) async {
    final response = await Api.post(
        Endpoints.validateAntigen, {'code': code, 'userId': userId});

    if (response["statusCode"] == 200) {
      print('esooo hp');
      return true;
    } else {
      print('GONO hp');

      return false;
    }
  }
}
