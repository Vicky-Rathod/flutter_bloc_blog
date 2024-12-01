import 'package:equatable/equatable.dart';

class AuthEntity extends Equatable {
  final String email;
  final String password;
  final String? username;
  final String? firstName;
  final String? lastName;
  final String? phoneNumber;
  final String? address;
  final String? city;

  const AuthEntity(
      {required this.email, required this.password, this.username, this.firstName, this.lastName, this.phoneNumber, this.address, this.city});

  bool get isValid => email.contains('@');
  bool get isPasswordValid => password.length > 6;

  @override
  // TODO: implement props
  List<Object?> get props => [email, password, username, firstName, lastName, phoneNumber, address, city];
}
