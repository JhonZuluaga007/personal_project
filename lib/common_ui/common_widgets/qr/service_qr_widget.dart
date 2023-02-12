import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';

class ServiceQRWidget {
  static escanearQr(Function function) async {
    String qrValor = await FlutterBarcodeScanner.scanBarcode(
      '#FF0000',
      'Cancel',
      false,
      ScanMode.QR,
    );
    function(qrValor);
  }
}
