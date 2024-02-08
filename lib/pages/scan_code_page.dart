import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

class ScanCodePage extends StatefulWidget {
  const ScanCodePage({super.key});

  @override
  State<ScanCodePage> createState() => _ScanCodePageState();
}

class _ScanCodePageState extends State<ScanCodePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purple.shade600,

      appBar: AppBar(
        backgroundColor: Colors.purple.shade700,
        title: const Text('Scan QR Code', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.popAndPushNamed(context, "/generate");
            },
            icon: const Icon(
              Icons.qr_code, color: Colors.white,
            ),
          ),
        ],
        centerTitle: true,
        leading:  
        IconButton(onPressed: () {
          Navigator.popAndPushNamed(context, "/home");
        }, icon: const Icon(Icons.arrow_back, color: Colors.white,)),
      ),

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
        
            Container(
              child: const Text(
                'Scan your barcode here', 
                style: 
                TextStyle(color: Colors.white, 
                fontWeight: FontWeight.w600,
                fontSize: 25,
                ),),
            ),
        
              const SizedBox(
                height: 30,
              ),
        
            Container(
                width: 250,
                height: 250,
                decoration:
                    BoxDecoration(border: Border.all(color: Colors.purple.shade700, width: 7)),
                child: MobileScanner(
                  controller: MobileScannerController(
                    detectionSpeed: DetectionSpeed.noDuplicates,
                    returnImage: true,
                  ),
                  onDetect: (capture) {
                    final List<Barcode> barcodes = capture.barcodes;
                    final Uint8List? image = capture.image;
                    for (final barcode in barcodes) {
                      print('Barcode Found ${barcode.rawValue}');
                    }
                    if (image != null) {
                      showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              title: Text(
                                barcodes.first.rawValue ?? "",
                              ),
                              content: Image(
                                image: MemoryImage(image),
                              ),
                            );
                          });
                    }
                  },
                ),
            ),
          ],
        ),
      ),
    );
  }
}
