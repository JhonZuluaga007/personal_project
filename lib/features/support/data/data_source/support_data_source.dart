import 'package:Tellme/config/helpers/api.dart';
import 'package:Tellme/config/helpers/endpoints.dart';

import '../../../../config/helpers/errors/invalid_data.dart';

class SupportDataSource {
  Future<bool> createSupportTicket(String name, String email, String phone,
      String description, String image) async {
    final response = await Api.post(Endpoints.createSupportCase, {
      "project": "ChelseaProject",
      "name": name,
      "email": email,
      "phone": phone,
      "description": description,
      "supportImage": image
    });
    if (response["statusCode"] == 200) {
      return true;
    } else {
      throw InvalidData(
        'Error, your request couldnt be handled',
      );
    }
  }
}
