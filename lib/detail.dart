import 'package:flutter/material.dart';


class RegistrationPage extends StatefulWidget {
  const RegistrationPage({super.key});

  @override
  State<RegistrationPage> createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  void _showAlertDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Konfirmasi'),
          content: const Text('Yakin daftar?'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Tutup dialog
              },
              child: const Text('Tidak'),
            ),
            TextButton(
              onPressed: () {
                Navigator.pushNamed(
                    context, '/confirm'); // Navigasi ke ConfirmationPage
              },
              child: const Text('Ya'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Registration Page'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            // Bagian paling atas: field untuk memasukkan gambar
            Container(
              height: 200,
              color: Colors.grey[300],
              child: Center(
                child: Image.asset(
                  'assets/img/seminar.png',
                  fit: BoxFit
                      .cover, // Optional: Specify how the image should fit within its bounds
                ),
              ),
            ),
            const SizedBox(height: 20),
            // Bagian tengah: judul bold
            const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Judul',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 24,
                ),
                textAlign: TextAlign.left,
              ),
            ),
            const SizedBox(height: 20),
            // Bagian bawah judul: deskripsi
            const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Lorem Ipsum Dolor Sit Amet',
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
            ),
            const Spacer(),
            // Bagian paling bawah: tombol Daftar
            ElevatedButton(
              onPressed: () => _showAlertDialog(context),
              child: const Text('Daftar'),
            ),
          ],
        ),
      ),
    );
  }
}
