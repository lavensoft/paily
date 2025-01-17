import 'package:intl/intl.dart';

class FormatHelper {
  static String formatNumber([double? value, String? locale]) {
    //!HARDCODE
    var f = NumberFormat(
      locale == 'vi_VN' ? '#,##0' : '#,##0.00', 
      locale ?? 'en_US'
    );
    return f.format(value);
  }
}