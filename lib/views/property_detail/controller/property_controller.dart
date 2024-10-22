import 'package:get/get.dart';
import 'package:real_estate/model/property_model.dart';
import 'package:real_estate/utils/app_constants.dart';
import 'package:real_estate/utils/utils.dart';

class PropertyController extends GetxController {
  final savePropertyList = <PropertyModel>[].obs;
  final favPropertyList = <PropertyModel>[].obs;
  final searchQuery = RxString('');

//search query to filter list of property
  final listOfProperties = AppConstants.listOfProperties.obs;
  List<PropertyModel> get filteredList => listOfProperties
      .where((property) => property.propertyLocation
          .toLowerCase()
          .contains(searchQuery.toLowerCase()))
      .toList();

//to save property
  void saveProperty(PropertyModel property) {
    if (!savePropertyList.contains(property)) {
      // Check for duplicates
      savePropertyList.add(property);
      Utils.toastMessage('Item Saved');
      update(); // Notify UI of changes
    } else {
      savePropertyList.remove(property);
      Utils.toastMessage('Item unsaved');
      update();
    }
  }

  //to add favourite property
  void saveFavouriteProperty(PropertyModel property) {
    if (!favPropertyList.contains(property)) {
      // Check for duplicates
      favPropertyList.add(property);
      Utils.toastMessage('Added to favourite');
      update(); // Notify UI of changes
    } else {
      favPropertyList.remove(property);
      Utils.toastMessage('Removed from favourite');
      update();
    }
  }
}
