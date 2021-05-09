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
}
