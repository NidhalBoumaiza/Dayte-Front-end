import 'package:get/get.dart';

class AvailabilityScreenController extends GetxController {
  RxMap<String, DateTime> myMap = <String, DateTime>{}.obs;

  void addDay(String dayName, DateTime date) {
    myMap[dayName] = date;
    print(myMap);
  }

  void deleteDay(String dayName) {
    myMap.remove(dayName);
  }
}
