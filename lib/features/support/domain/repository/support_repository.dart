import 'package:either_dart/either.dart';

import '../../../../config/helpers/errors/invalid_data.dart';

abstract class SupportRepository {
  Future<Either<InvalidData, bool>> createSupportTicket(String name,
      String email, String phone, String description, String image);
}
