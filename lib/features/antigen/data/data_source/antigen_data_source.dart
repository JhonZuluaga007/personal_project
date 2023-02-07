import 'package:personal_project/config/helpers/api.dart';
import 'package:personal_project/config/helpers/endpoints.dart';
import 'package:http/http.dart' as http;

class AntigenDataSource {
  void validateAntigen(String userId, String code) async {
    var request =
        http.MultipartRequest('POST', Uri.parse(Endpoints.validateAntigen));
    request.fields.addAll({'code': code, 'userId': userId});

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      print(await response.stream.bytesToString());
    } else {
      print(response.reasonPhrase);
    }
  }
}
