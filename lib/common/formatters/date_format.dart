import 'package:intl/intl.dart';

String formatData(value, {format = "dd/MM/yyyy"}) {
  var date = DateTime.tryParse(value);
  if (date != null) {
    var formatter = DateFormat(format);
    value = formatter.format(date);
  }
  return value;
}
