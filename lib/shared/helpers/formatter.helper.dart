import 'package:intl/intl.dart';

class FormatHelper {
  static String formatNumber(double value) {
    var f = NumberFormat('#,##0.00', 'en_US');
    return f.format(value);
  }
}