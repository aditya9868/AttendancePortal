import 'package:toast/toast.dart';
import 'package:attend/index.dart';

class CommonWidgets {
  static showToast(BuildContext context, String message, {int duration}) {
    return Toast.show(message, context,
        gravity: Toast.BOTTOM, duration: duration ?? Toast.LENGTH_SHORT);
  }

  static push(BuildContext context, Widget route) {
    Navigator.push<dynamic>(
      context,
      MaterialPageRoute<dynamic>(
          builder: (BuildContext context) => route, fullscreenDialog: true),
    );
  }

  static int getColorFromHex(String hexColor) {
    hexColor = hexColor.toUpperCase().replaceAll('#', '');
    if (hexColor.length == 6) {
      hexColor = 'FF' + hexColor;
    }
    return int.parse(hexColor, radix: 16);
  }

  static String convertAnyStringToHex(String hexColor) {
    final p = hexColor.split('');
    for (var i = 0; i < p.length; i++) {
      switch (p[i].codeUnits[0] % 16) {
        case 10:
          p[i] = 'a';
          break;
        case 11:
          p[i] = 'b';
          break;
        case 12:
          p[i] = 'c';
          break;
        case 13:
          p[i] = 'd';
          break;
        case 14:
          p[i] = 'e';
          break;
        case 15:
          p[i] = 'f';
          break;

        default:
          p[i] = (p[i].codeUnits[0] % 16).toString();
      }
    }
    hexColor = p.join();
    return hexColor;
  }
}
