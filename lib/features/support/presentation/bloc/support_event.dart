part of 'support_bloc.dart';

@immutable
abstract class SupportEvent {}

class CreateSupportTicketEvent extends SupportEvent {
  final String name;
  final String email;
  final String phone;
  final String description;
  final String? image;

  CreateSupportTicketEvent(
      {required this.name,
      required this.email,
      required this.phone,
      required this.description,
      this.image});
}
