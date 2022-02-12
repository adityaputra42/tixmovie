part of 'model.dart';

class Credit extends Equatable {
  final String name;
  final String profilePath;

  const Credit({required this.name, required this.profilePath});

  factory Credit.fromJson(Map<String, dynamic> json) => Credit(
        name: json['name'],
        profilePath: json['profile_path'],
      );

  @override
  List<Object> get props => [name, profilePath];
}
