import '../models/user_model.dart';

class UserController {
  Future<UserModel> getUser() async {
    await Future.delayed(const Duration(seconds: 1));
    return UserModel(
      name: 'Nguyen Van A',
      email: 'vana@gmail.com',
      phone: '0123456789',
    );
  }

  Future<UserModel> updateUser(UserModel user) async {
    await Future.delayed(const Duration(seconds: 2));
    return user;
  }
}