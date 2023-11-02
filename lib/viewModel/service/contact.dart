import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:resq_guide/model/contact.dart';

class UserProvider with ChangeNotifier {
  List<UserModel> _userData = [];
  final Dio _dio = Dio();
  final String _url = 'https://65223fddf43b17938414559c.mockapi.io/contact';

  final TextEditingController nameController = TextEditingController();
  final TextEditingController phoneNumberController = TextEditingController();
  bool _isLoading = false;

  List<UserModel> get userData => _userData;
  bool get isLoading => _isLoading;

  void fetchData() async {
    try {
      _isLoading = true;
      notifyListeners();

      Response response = await _dio.get(_url);

      if (response.statusCode == 200) {
        _userData =
            List<UserModel>.from(response.data.map((x) => UserModel.fromJson(x)));
      } else {
        print('Failed to fetch data. Status code: ${response.statusCode}');
      }
    } catch (error) {
      print('An error occurred: $error');
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  void updateUser(String userId, String newName, String newphoneNumber) async {
    String updateUrl = '$_url/$userId';

    try {
      Response response = await _dio.put(updateUrl, data: {
        'name': newName,
        'phoneNumber': newphoneNumber,
      });

      if (response.statusCode == 200) {
        print('User updated successfully');
        fetchData(); // Refresh the user list after update
      } else {
        print('Failed to update user. Status code: ${response.statusCode}');
      }
    } catch (error) {
      print('An       error occurred: $error');
    }
  }

  void deleteUser(String userId) async {
    String deleteUrl = '$_url/$userId';

    try {
      Response response = await _dio.delete(deleteUrl);

      if (response.statusCode == 200) {
        print('User deleted successfully');
        fetchData(); // Refresh the user list after deletion
      } else {
        print('Failed to delete user. Status code: ${response.statusCode}');
      }
    } catch (error) {
      print('An error occurred: $error');
    }
  }

  void addUser() async {
    String name = nameController.text;
    String phoneNumber = phoneNumberController.text;

    try {
      Response response = await _dio.post(_url, data: {
        'name': name,
        'phoneNumber': phoneNumber,
      });

      if (response.statusCode == 201) {
        print('User added successfully');
        fetchData(); // Refresh the user list after adding a new user
        nameController.clear();
        phoneNumberController.clear();
      } else {
        print('Failed to add user. Status code: ${response.statusCode}');
      }
    } catch (error) {
      print('An error occurred: $error');
    }
  }
}
