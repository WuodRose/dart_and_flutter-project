import 'package:get/get.dart';
import 'package:crop_monitoring_system/models/user.dart';

class AuthController extends GetxController {
  final Rx<User?> _user = Rx<User?>(null);
  User? get user => _user.value;

  Future<void> login(String email, String password) async {
    try {
      // Implement your login logic here
      _user.value = User(
        id: 1,
        username: email.split('@')[0], // Create username from email temporarily
        email: email,
        token: 'dummy-token', // Replace with actual token from your backend
        name: 'Test User',
      );
      Get.offAllNamed('/dashboard');
    } catch (e) {
      Get.snackbar('Error', 'Login failed: ${e.toString()}');
    }
  }

  Future<void> register(String email, String password, String name) async {
    try {
      // Implement your registration logic here
      _user.value = User(
        id: 1,
        username: email.split('@')[0], // Create username from email temporarily
        email: email,
        token: 'dummy-token', // Replace with actual token from your backend
        name: name,
      );
      Get.offAllNamed('/dashboard');
    } catch (e) {
      Get.snackbar('Error', 'Registration failed: ${e.toString()}');
    }
  }

  void logout() {
    _user.value = null;
    Get.offAllNamed('/login');
  }

  // Helper method to check if user is logged in
  bool get isLoggedIn => _user.value != null;

  // Helper method to get user token
  String? get userToken => _user.value?.token;
}