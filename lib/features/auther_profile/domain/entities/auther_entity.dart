import 'package:equatable/equatable.dart';

class AutherEntity extends Equatable {
  final String name;
  final String email;
  final String bio;
  final String image;

  const AutherEntity({
    required this.name,
    required this.email,
    required this.bio,
    required this.image,
  });

  @override
  List<Object?> get props => [name, email, bio, image];
}
