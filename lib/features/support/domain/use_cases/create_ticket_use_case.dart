import 'package:Tellme/features/support/domain/repository/support_repository.dart';

class CreateSupportTicketUseCase {
  SupportRepository supportRepository;
  CreateSupportTicketUseCase({required this.supportRepository});
  Future<bool> call(String name, String email, String phone, String description,
      String image) async {
    return await supportRepository.createSupportTicket(
        name, email, phone, description, image);
  }
}
