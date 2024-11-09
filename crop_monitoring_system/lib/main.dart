import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:crop_monitoring_system/controllers/auth_controller.dart';
import 'package:crop_monitoring_system/models/user.dart';
import 'package:crop_monitoring_system/screens/auth/register_screen.dart';
import 'package:crop_monitoring_system/screens/crop/crop_list_screen.dart';
import 'package:crop_monitoring_system/screens/crop/add_crop_screen.dart';
import 'package:crop_monitoring_system/screens/sensor/sensor_data_screen.dart';
import 'package:crop_monitoring_system/screens/dashboard/dashboard_screen.dart';
import 'package:crop_monitoring_system/screens/settings/settings_screen.dart';
import 'package:crop_monitoring_system/widgets/common/custom_button.dart';
import 'package:crop_monitoring_system/utils/theme.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Crop Monitoring System',
      theme: ThemeData(
        primarySwatch: Colors.green,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: '/login',
      getPages: [
        GetPage(
          name: '/login',
          page: () => LoginScreen(),
        ),
        GetPage(
          name: '/dashboard',
          page: () => DashboardScreen(),
        ),
        GetPage(
          name: '/crops',
          page: () => const CropListScreen(),
        ),
        GetPage(
          name: '/add-crop',
          page: () => const AddCropScreen(),
        ),
        GetPage(
          name: '/sensor-data',
          page: () => const SensorDataScreen(),
        ),
        GetPage(
          name: '/settings',
          page: () => const SettingsScreen(),
        ),
      ],
    );
  }
}

class LoginScreen extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Welcome Back',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            const SizedBox(height: 30),
            TextField(
              controller: emailController,
              decoration: const InputDecoration(
                labelText: 'Email',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            TextField(
              controller: passwordController,
              decoration: const InputDecoration(
                labelText: 'Password',
                border: OutlineInputBorder(),
              ),
              obscureText: true,
            ),
            const SizedBox(height: 30),
            CustomButton(
              text: 'Login',
              onPressed: () => Get.offAll(() => DashboardScreen()),
            ),
            const SizedBox(height: 20),
            TextButton(
              onPressed: () => Get.to(() => RegisterScreen()),
              child: const Text('Don\'t have an account? Register'),
            ),
          ],
        ),
      ),
    );
  }
}