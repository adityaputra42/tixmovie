part of 'model.dart';

class UserModel extends Equatable {
  final String id;
  final String email;
  final String name;
  final String? profilePicture;
  final List<String> selectedGenres;
  final String selectedLanguage;
  final int balance;

  const UserModel({
    required this.id,
    this.name = '',
    this.email = '',
    this.profilePicture,
    this.selectedGenres = const [],
    this.selectedLanguage = '',
    this.balance = 0,
  });

  UserModel copyWith({
    String? name,
    String? profilePicture,
    int? balance,
  }) =>
      UserModel(
        id: id,
        email: email,
        name: name ?? this.name,
        profilePicture: profilePicture ?? this.profilePicture,
        selectedGenres: selectedGenres,
        selectedLanguage: selectedLanguage,
        balance: balance ?? this.balance,
      );

  @override
  List<Object?> get props => [
        id,
        name,
        email,
        profilePicture,
        selectedGenres,
        selectedLanguage,
        balance,
      ];
}
