import 'package:attend/index.dart';

class QRViewContainer extends StatefulWidget {
  final Function(String) func;
  const QRViewContainer({
    Key key,
    this.func,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() => _QRViewContainerState();
}

class _QRViewContainerState extends State<QRViewContainer> {
  Barcode result;
  QRViewController controller;
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');

  @override
  void reassemble() {
    super.reassemble();
    if (Platform.isAndroid) {
      controller.pauseCamera();
    } else if (Platform.isIOS) {
      controller.resumeCamera();
    }
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          _buildQrView(context),
        ],
      ),
    );
  }

  Widget _buildQrView(BuildContext context) {
    var scanArea = (MediaQuery.of(context).size.width < 400 ||
            MediaQuery.of(context).size.height < 400)
        ? 250.0
        : 350.0;

    return QRView(
      key: qrKey,
      cameraFacing: CameraFacing.front,
      onQRViewCreated: _onQRViewCreated,
      formatsAllowed: [BarcodeFormat.qrcode],
      overlay: QrScannerOverlayShape(
        borderColor: Color(0xFF00CEBD),
        borderRadius: 10,
        borderLength: 30,
        borderWidth: 5,
        cutOutSize: scanArea,
      ),
    );
  }

  Future<void> _onQRViewCreated(QRViewController controller) async {
    final a = await controller.getCameraInfo();
    print("eeeeeeeee");
    print(a.index);
    await controller.flipCamera();
    setState(() {
      this.controller = controller;
    });

    controller.scannedDataStream.listen((scanData) {
      setState(() {
        result = scanData;
      });
      try {
        widget.func(result.code);
      } catch (e) {
        print(e);
      }
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}
