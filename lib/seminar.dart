import 'package:flutter/material.dart';

class SeminarPage extends StatefulWidget {
  const SeminarPage({super.key});

  @override
  State<SeminarPage> createState() => _SeminarPageState();
}

class _SeminarPageState extends State<SeminarPage> {
  final TextEditingController _searchController = TextEditingController();
  int _selectedIndex = 3;

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
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: <Widget>[
              Row(
                children: <Widget>[
                  Expanded(
                    child: TextField(
                      controller: _searchController,
                      decoration: const InputDecoration(
                        labelText: 'Search',
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  ElevatedButton(
                    onPressed: () {
                      // Add search functionality here
                    },
                    child: const Text('Cari'),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Rekomendasi',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(height: 10),
              SizedBox(
                height: 250,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: <Widget>[
                    _buildHorizontalCard('Rekomendasi 1', context),
                    _buildHorizontalCard('Rekomendasi 2', context),
                    _buildHorizontalCard('Rekomendasi 3', context),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Baru saja',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(height: 10),
              Column(
                children: <Widget>[
                  _buildVerticalCard('Baru saja 1', context),
                  _buildVerticalCard('Baru saja 2', context),
                  _buildVerticalCard('Baru saja 3', context),
                  _buildVerticalCard('Baru saja 4', context),
                  _buildVerticalCard('Baru saja 5', context),
                ],
              ),
            ],
          ),
        ),
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
        onTap: _onItemTapped,
      ),
    );
  }

  Widget _buildHorizontalCard(String title, BuildContext context) {
    return Card(
      child: Container(
        width: 200,
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(
              height: 100,
              child: Center(
                child: Image.asset(
                  'assets/img/seminar.png',
                  fit: BoxFit
                      .cover, // Optional: Specify how the image should fit within its bounds
                ),
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              'Judul',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
            const SizedBox(height: 5),
            const Text(
              'Lorem Ipsum Dolor Sit Amet.',
              style: TextStyle(
                fontSize: 12,
                color: Colors.grey,
              ),
            ),
            const Spacer(),
            Align(
              alignment: Alignment.bottomRight,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/detail');
                },
                child: const Text('Lihat'),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildVerticalCard(String title, BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: <Widget>[
            // Bagian paling kiri: gambar
            Container(
              width: 60,
              height: 60,
              color: Colors.grey[300],
              child: Center(
                child: Image.asset(
                  'assets/img/seminar.png',
                  fit: BoxFit
                      .cover, // Optional: Specify how the image should fit within its bounds
                ),
              ),
            ),
            const SizedBox(width: 10),
            // Bagian tengah: judul dan deskripsi
            const Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    'Judul',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  SizedBox(height: 5),
                  Text(
                    'Lorem Ipsum Dolor Sit Amet.',
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            ),
            // Bagian paling kanan: tombol Lihat
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/detail');
              },
              child: const Text('Lihat'),
            ),
          ],
        ),
      ),
    );
  }
}
