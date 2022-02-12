part of 'services.dart';

class UserService {
  CollectionReference reference =
      FirebaseFirestore.instance.collection('users');

  Future<void> setUser(UserModel user) async {
    try {
      reference.doc(user.id).set({
        'email': user.email,
        'name': user.name,
        'selectedGenres': user.selectedGenres,
        'selectedLanguage': user.selectedLanguage,
        'profilePicture': user.profilePicture,
        'balance': user.balance
      });
    } catch (e) {
      rethrow;
    }
  }

  Future<UserModel> getUser(String id) async {
    try {
      DocumentSnapshot snapshot = await reference.doc(id).get();
      return UserModel(
          id: id,
          name: snapshot['name'],
          email: snapshot['email'],
          selectedGenres: (snapshot['selectedGenres'] as List)
              .map((e) => e.toString())
              .toList(),
          selectedLanguage: snapshot['selectedLanguage'],
          balance: snapshot['balance'],
          profilePicture: snapshot['profilePicture']);
    } catch (e) {
      rethrow;
    }
  }
}
