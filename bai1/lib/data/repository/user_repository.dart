import '../../models/user_model.dart';
import '../services/user_service.dart';

class UserRepository {
  final UserService _userService;

  UserRepository(this._userService);

  Future<List<UserModel>> getUsers() async {
    return await _userService.fetchUsers();
  }
}