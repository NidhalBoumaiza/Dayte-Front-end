import 'package:get/get.dart';

class AvailabilityScreenController extends GetxController {
  RxMap<String, String> myMap = <String, String>{}.obs;

  void addDay(String dayName, String date) {
    myMap[dayName] = date;
    print(myMap);
  }

  void deleteDay(String dayName) {
    myMap.remove(dayName);
  }
}
