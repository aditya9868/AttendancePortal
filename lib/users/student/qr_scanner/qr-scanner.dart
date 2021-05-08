import 'package:attend/index.dart';
import 'package:permission_handler/permission_handler.dart' as per;

// import 'package:encrypt/encrypt.dart' as encrypt;

class QrScreen extends StatefulWidget {
  static const routeName = '/qr-screen';
  const QrScreen({Key key}) : super(key: key);

  @override
  _QrScreenState createState() => _QrScreenState();
}

class _QrScreenState extends State<QrScreen> {
  String strcode = "";
  bool isLoading = false;
  var _init = true;

  @override
  Future<void> didChangeDependencies() async {
    super.didChangeDependencies();
    if (_init) {
      _init = false;
      setState(() {
        isLoading = true;
      });
      await getCameraPermission();
      setState(() {
        isLoading = false;
      });
    }
  }

  getCameraPermission() async {
    await per.Permission.camera.request();
    var status = await per.Permission.camera.status;
    if (status.isPermanentlyDenied) {
      per.openAppSettings();
      Navigator.pop(context);
    }
    if (status.isDenied) {
      Navigator.pop(context);
      return;
    }
  }

  Future<void> setCode(String p) async {
    setState(() {
      strcode = p;
    });
  }

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      padding: const EdgeInsets.all(0),
      isLoading: isLoading,
      children: [
        Expanded(
          child: strcode == ""
              ? QRViewContainer(
                  func: setCode,
                )
              : Center(child: Text(strcode)),
        ),
      ],
    );
  }
}
