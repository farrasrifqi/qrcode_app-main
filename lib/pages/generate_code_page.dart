import 'package:flutter/material.dart';
import 'package:pretty_qr_code/pretty_qr_code.dart';

class GenerateCodePage extends StatefulWidget {
  const GenerateCodePage({super.key});

  @override
  State<GenerateCodePage> createState() => _GenerateCodePageState();
}

class _GenerateCodePageState extends State<GenerateCodePage> {
  String? qrData;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purple.shade600,
      
      appBar: AppBar(
        backgroundColor: Colors.purple.shade700,
        title: const Text(
          'Generate QR Code',
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.popAndPushNamed(context, "/scan");
            },
            icon: const Icon(
              Icons.qr_code_scanner,
              color: Colors.white,
            ),
          ),
        ],
        centerTitle: true,
        leading: IconButton(
            onPressed: () {
              Navigator.popAndPushNamed(context, "/home");
            },
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.white,
            )),
      ),

      // body: Padding(
      //   padding: const EdgeInsets.all(20.0),
      //   child: Column(
      //     mainAxisSize: MainAxisSize.max,
      //     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      //     crossAxisAlignment: CrossAxisAlignment.center,
      //     children: [

      //         TextField(
      //           decoration: const InputDecoration(
      //             border: OutlineInputBorder(),
      //             hintText: 'put your link here',
      //           ),

      //          onSubmitted: (value) {
      //           setState(() {
      //             qrData = value;
      //           });
      //         },
      //       ),
      //        if (qrData != null) PrettyQrView.data(data: qrData!,)

      //     ],
      //   ),
      // ),

      body: Container(
        color: Colors.purple.shade600,
        padding: const EdgeInsets.all(30.0),
        child: ListView(
          // mainAxisSize: MainAxisSize.max,
          // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          // crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextField(
              style: const TextStyle(color: Colors.white),
              decoration: const InputDecoration(
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(width: 1, color: Colors.white),
                      borderRadius: BorderRadius.all(Radius.circular(0))),
                  hintText: 'put your link here',
                  hintStyle: TextStyle(color: Colors.white),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(width: 1, color: Colors.white),
                    borderRadius: BorderRadius.all(Radius.circular(0)),
                  ),
                ),

              onSubmitted: (value) {
                setState(() {
                  qrData = value;
                });
              },
            ),

              const SizedBox(height: 20,),

            if (qrData != null) PrettyQrView.data(data: qrData!)

          ],
        ),
      ),
    );
  }
}
