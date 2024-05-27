import 'package:flutter/material.dart';
import 'detail.dart';
import 'confirmation.dart';
import 'confirmlowongan.dart';
import 'profile.dart';
import 'unggah.dart';
import 'lowongan.dart';
import 'edit.dart';
import 'registration.dart';
import 'seminar.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Bursa Talenta',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      routes: {
        '/': (context) => const MyHomePage(title: 'Bursa Talenta'),
        '/detail': (context) => const RegistrationPage(),
        '/confirm': (context) => const ConfirmationPage(),
        '/confirmLowongan': (context) => const ConfirmLowongan(),
        '/profile': (context) => const ProfilePage(),
        '/edit': (context) => const EditProfileScreen(),
        '/unggah': (context) => const PostPage(),
        '/lowongan': (context) => const LowonganPage(),
        '/registration': (context) => const RegisLowongan(),
        '/softskill': (context) => const SeminarPage(),
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final TextEditingController _searchController = TextEditingController();
  int _selectedIndex = 0;

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });

    // Navigasi ke halaman yang sesuai berdasarkan indeks item yang dipilih
    switch (index) {
      case 0:
        Navigator.pushNamed(context, '/');
        break;
      case 1:
        Navigator.pushNamed(context, '/lowongan');
        break;
      case 2:
        Navigator.pushNamed(context, '/unggah');
        break;
      case 3:
        Navigator.pushNamed(context, '/softskill');
        break;
      case 4:
        Navigator.pushNamed(context, '/profile');
        break;
      default:
        Navigator.pushNamed(context, '/');
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Seminar dan Volunteer'),
        automaticallyImplyLeading:
            false, // Menghilangkan tombol kembali otomatis
      ),
      body: Column(
        children: [
          // Search bar
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: TextField(
              controller: _searchController,
              decoration: InputDecoration(
                hintText: 'Search',
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                  borderSide: const BorderSide(color: Colors.grey),
                ),
              ),
            ),
          ),
          // List of cards
          Expanded(
            child: ListView.builder(
              itemCount: 10, // Replace with the actual number of items
              itemBuilder: (context, index) {
                return Card(
                  margin: const EdgeInsets.symmetric(vertical: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Profile picture and username
                      const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            CircleAvatar(
                              radius: 20,
                              backgroundImage: AssetImage(
                                  'assets/img/profile.png'), // Replace with your profile image asset
                            ),
                            SizedBox(width: 10),
                            Text(
                              'Username', // Replace with dynamic username
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                      // Image section
                      Image.asset(
                        'assets/img/truk.jpg', // Replace with your image asset
                        width: double.infinity,
                        height: 300,
                        fit: BoxFit.cover,
                      ),
                      // Caption section
                      const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text(
                          'This is a caption for the image.', // Replace with dynamic caption
                          style: TextStyle(fontSize: 14),
                        ),
                      ),
                      // Action buttons
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            IconButton(
                              icon: const Icon(Icons.thumb_up),
                              onPressed: () {
                                // Logic for like button
                              },
                            ),
                            IconButton(
                              icon: const Icon(Icons.comment),
                              onPressed: () {
                                // Logic for comment button
                              },
                            ),
                            IconButton(
                              icon: const Icon(Icons.share),
                              onPressed: () {
                                // Logic for share button
                              },
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Beranda',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.work),
            label: 'Lowongan',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add),
            label: 'Unggah',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.list),
            label: 'Soft Skill',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profil',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.blue, // Warna untuk ikon yang dipilih
        unselectedItemColor: Colors.grey, // Warna untuk ikon yang tidak dipilih
        onTap: _onItemTapped,
      ),
    );
  }
}
