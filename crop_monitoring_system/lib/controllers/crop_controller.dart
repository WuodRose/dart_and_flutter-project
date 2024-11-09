import 'package:get/get.dart';
import '../models/crop.dart';
import '../services/database/database_service.dart';

class CropController extends GetxController {
  final RxList<Crop> crops = <Crop>[].obs;
  final RxBool isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
    fetchCrops();
  }

  Future<void> fetchCrops() async {
    isLoading.value = true;
    try {
      final conn = await DatabaseService.getConnection();
      final results = await conn.query('SELECT * FROM crops WHERE user_id = ?', [Get.find<AuthController>().user.value?.id]);
      
      crops.value = results.map((row) => Crop.fromJson(row.fields)).toList();
    } catch (e) {
      Get.snackbar('Error', 'Failed to fetch crops');
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> addCrop(Crop crop) async {
    try {
      final conn = await DatabaseService.getConnection();
      await conn.query(
        'INSERT INTO crops (field_id, name, variety, planting_date, expected_harvest_date, status) VALUES (?, ?, ?, ?, ?, ?)',
        [crop.fieldId, crop.name, crop.variety, crop.plantingDate.toIso8601String(), crop.expectedHarvestDate.toIso8601String(), crop.status]
      );
      await fetchCrops();
      Get.back();
      Get.snackbar('Success', 'Crop added successfully');
    } catch (e) {
      Get.snackbar('Error', 'Failed to add crop');
    }
  }
}

# 