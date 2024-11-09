import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:crop_monitoring_system/widgets/common/custom_button.dart';

class AddCropScreen extends StatelessWidget {
  const AddCropScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextEditingController nameController = TextEditingController();
    final TextEditingController typeController = TextEditingController();
    final TextEditingController areaController = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Add New Crop'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              controller: nameController,
              decoration: const InputDecoration(
                labelText: 'Crop Name',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: typeController,
              decoration: const InputDecoration(
                labelText: 'Crop Type',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: areaController,
              decoration: const InputDecoration(
                labelText: 'Area (in square meters)',
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 16),
            CustomButton(
              text: 'Add Crop',
              onPressed: () {
                // Implement crop addition logic
                Get.back();
                Get.snackbar('Success', 'Crop added successfully');
              },
            ),
          ],
        ),
      ),
    );
  }
}