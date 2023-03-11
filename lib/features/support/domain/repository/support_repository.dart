abstract class SupportRepository {
  Future<bool> createSupportTicket(String name, String email, String phone,
      String description, String image);
}
