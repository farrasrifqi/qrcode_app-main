import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purple.shade600,

      appBar: AppBar(
        backgroundColor: Colors.purple.shade700,
        title: const Text(
          'QRCODE',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
      ),

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            Container(
              height: 200,
              width: 200,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.purple.shade700, width: 8)
              ),
              child: Image.asset('assets/images/Barcode.jpeg'),
            ),

            const SizedBox(
              height: 40,
            ),

            InkWell(
              child: Container(
                  height: 50,
                  width: 200,
                  decoration: BoxDecoration(
                    color: Colors.purple.shade700,
                  ),
                  child: const Center(
                    child: Text(
                      'Scan QR Code',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                          fontSize: 17),
                    ),
                  ),
                ),
                onTap: () {
                  Navigator.popAndPushNamed(context, "/scan");
                },
            ),

            const SizedBox(
              height: 15,
            ),

            InkWell (
              child: Container(
                  height: 50,
                  width: 200,
                  decoration: BoxDecoration(
                    color: Colors.purple.shade700,
                  ),
                  child: const Center(
                    child: Text(
                      'Generate QR Code',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                          fontSize: 17),
                    ),
                  )
                ),
                onTap: () {
                  Navigator.popAndPushNamed(context, "/generate");
                },
            ),

          ],
        ),
      ),
    );
  }
}
