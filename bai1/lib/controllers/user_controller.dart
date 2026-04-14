import '../data/repository/user_repository.dart';
import '../data/services/user_service.dart';
import '../models/user_model.dart';

class UserController {
  late final UserRepository _repository;

  UserController() {
    _repository = UserRepository(UserService());
  }

  Future<List<UserModel>> fetchUsers() async {
    return await _repository.getUsers();
  }
}