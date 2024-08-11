import 'package:easy_localization/easy_localization.dart';

class DateHelper {
  static String? formatDate(DateTime? date) {
    final DateTime formattedDate = date ?? DateTime.now();
    return "${formattedDate.year}-${formattedDate.month}-${formattedDate.day}";
  }

  static String formatMonth(DateTime date) {
    return DateFormat('dd MMMM yyyy').format(date);
  }

  static DateTime? fromString(String? date) {
    if (date == null) return null;
    var dateParts = date.split(" ")[0].split("-");
    return DateTime(
      int.parse(dateParts[0]),
      int.parse(dateParts[1]),
      int.parse(dateParts[2]),
    );
  }

 static String convertToTimeString(DateTime dateTime) {

//   DateTime now = DateTime.now();
// String formattedTime = DateFormat('h:mm a').format(now);
// print(formattedTime);
  // Create a DateFormat object for the desired output format
  DateFormat timeFormat = DateFormat('h:mm a');
  
  // Format the DateTime to the desired string
  String timeString = timeFormat.format(dateTime);
  
  return timeString;
}
}
