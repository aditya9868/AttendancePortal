import 'package:toast/toast.dart';
import 'package:attend/index.dart';

class CommonWidgets {
  static showToast(BuildContext context, String message, {int duration}) {
    return Toast.show(message, context,
        gravity: Toast.BOTTOM, duration: duration ?? Toast.LENGTH_SHORT);
  }

 
}
