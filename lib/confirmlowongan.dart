import 'package:flutter/material.dart';

class ConfirmLowongan extends StatelessWidget {
  const ConfirmLowongan({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(''),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          const Center(
            child: Column(
              children: [
                Icon(
                  Icons.check_circle,
                  color: Colors.blue,
                  size: 100,
                ),
                SizedBox(height: 20),
                Text(
                  'Lowongan Anda Telah Terdaftar',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/');
              },
              child: const Text('Kembali'),
            ),
          ),
        ],
      ),
    );
  }
}
