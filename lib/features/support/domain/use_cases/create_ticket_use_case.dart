import 'package:Tellme/features/support/domain/repository/support_repository.dart';
import 'package:either_dart/either.dart';

import '../../../../config/helpers/errors/invalid_data.dart';

class CreateSupportTicketUseCase {
  SupportRepository supportRepository;
  CreateSupportTicketUseCase({required this.supportRepository});
  Future<Either<InvalidData, bool>> call(String name, String email,
      String phone, String description, String image) async {
    return await supportRepository.createSupportTicket(
        name, email, phone, description, image);
  }
}
