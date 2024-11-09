import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CropListScreen extends StatelessWidget {
  const CropListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Crops'),
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () => Get.toNamed('/add-crop'),
          ),
        ],
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: 10, // Replace with actual crop list length
        itemBuilder: (context, index) {
          return Card(
            margin: const EdgeInsets.only(bottom: 16),
            child: ListTile(
              leading: const CircleAvatar(
                backgroundColor: Colors.green,
                child: Icon(Icons.eco, color: Colors.white),
              ),
              title: Text('Crop ${index + 1}'),
              subtitle: Text('Planted on: 2024-${index + 1}-01'),
              trailing: const Icon(Icons.chevron_right),
              onTap: () => Get.toNamed('/sensor-data'),
            ),
          );
        },
      ),
    );
  }
}