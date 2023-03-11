import 'package:Tellme/config/helpers/errors/invalid_data.dart';
import 'package:Tellme/features/support/data/data_source/support_data_source.dart';
import 'package:Tellme/features/support/domain/repository/support_repository.dart';

class SupportRepositoryImpl implements SupportRepository {
  final SupportDataSource supportDataSource;
  SupportRepositoryImpl({required this.supportDataSource});

  @override
  Future<bool> createSupportTicket(String name, String email, String phone,
      String description, String image) async {
    try {
      bool response = await supportDataSource.createSupportTicket(
          name, email, phone, description, image);
      return response;
    } on InvalidData {
      return false;
    }
  }
}
