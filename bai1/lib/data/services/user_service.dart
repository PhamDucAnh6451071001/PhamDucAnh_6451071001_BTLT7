import 'dart:convert';
import 'package:http/http.dart' as http;
import '../../models/user_model.dart';
import '../../utils/api_constants.dart';

class UserService {
  Future<List<UserModel>> fetchUsers() async {
    final response = await http.get(Uri.parse(ApiConstants.userEndpoint));

    if (response.statusCode == 200) {
      final List<dynamic> data = jsonDecode(response.body);
      return data.map((e) => UserModel.fromJson(e)).toList();
    } else {
      throw Exception('Không tải được dữ liệu');
    }
  }
}