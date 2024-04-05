import 'package:intl/intl.dart';

abstract class FormatNumbers {
  static String formatNumbertoString(double? number) {
    return NumberFormat('###,###,###,##0.00', 'pt_BR').format(number);
  }

  // Transforma String em double
  static double formatStringtoNumber(String? number) {
    return double.parse(number!);
  }

  static double formatStringToDouble(String number) {
    if (number != '') {
      return double.parse(number.replaceAll('.', '').replaceAll(',', '.'));
    } else {
      return 0.0;
    }
  }
}
