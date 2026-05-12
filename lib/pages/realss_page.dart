import 'package:defuline_app/pages/homepage.dart';
import 'package:defuline_app/pages/profilpage.dart' show ProfilePage;
import 'package:flutter/material.dart';

// Pastikan file ini ada di project kamu, jika belum ada silakan buat atau sesuaikan namanya
// import 'package:defuline_app/pages/homepage.dart';
// import 'package:defuline_app/pages/profilpage.dart';

class RealssPage extends StatefulWidget {
  const RealssPage({super.key});

  @override
  State<RealssPage> createState() => _RealssPageState();
}

class _RealssPageState extends State<RealssPage> {
  bool _isLiked = true;

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Colors.cyanAccent, Colors.purple, Colors.pinkAccent],
          ),
        ),
        child: SafeArea(
          child: Stack(
            children: [
              // 1. Background Image (Konten Utama)
              Positioned.fill(
                child: Container(
                  margin: const EdgeInsets.only(top: 60, bottom: 90),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(0),
                    child: Image.asset(
                      "asset/image/pse3.jpg",
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) => Container(
                        color: Colors.black.withOpacity(0.8),
                        child: const Center(
                          child: Icon(
                            Icons.broken_image,
                            color: Colors.white,
                            size: 50,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),

              // 2. Header (Judul)
              Positioned(
                top: 15,
                left: 20,
                child: Row(
                  children: const [
                    Icon(
                      Icons.video_library,
                      color: Colors.pinkAccent,
                      size: 18,
                    ),
                    SizedBox(width: 10),
                    Text(
                      'REELS LINE',
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        fontStyle: FontStyle.italic,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),

              // 3. Sidebar Kanan (Tombol Interaksi)
              Positioned(
                right: 15,
                top: screenHeight * 0.25,
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    vertical: 12,
                    horizontal: 8,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.25),
                    borderRadius: BorderRadius.circular(30),
                    border: Border.all(color: Colors.white.withOpacity(0.2)),
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const CircleAvatar(
                        radius: 18,
                        backgroundColor: Colors.white70,
                        child: Icon(Icons.person, color: Colors.grey, size: 20),
                      ),
                      const SizedBox(height: 15),
                      GestureDetector(
                        onTap: () => setState(() => _isLiked = !_isLiked),
                        child: Icon(
                          _isLiked ? Icons.favorite : Icons.favorite_border,
                          color: _isLiked ? Colors.red : Colors.white,
                          size: 30,
                        ),
                      ),
                      const SizedBox(height: 15),
                      const Icon(Icons.chat, color: Colors.white, size: 26),
                      const SizedBox(height: 15),
                      const Icon(
                        Icons.share_outlined,
                        color: Colors.black,
                        size: 26,
                      ),
                      const SizedBox(height: 15),
                      const Icon(
                        Icons.more_horiz,
                        color: Colors.black,
                        size: 26,
                      ),
                    ],
                  ),
                ),
              ),

              // 4. Deskripsi & Caption (Kiri Bawah)
              Positioned(
                bottom: 130, // Ditinggikan sedikit agar tidak tertutup nav bar
                left: 20,
                right: 80, // Agar teks tidak menabrak sidebar kanan
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 4,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.black54,
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: const Text(
                        "FADLI _ MODESAD",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 13,
                        ),
                      ),
                    ),
                    const SizedBox(height: 8),
                    const Text(
                      "Lebih baik sadar diri daripada berjuang tapi tidak dihargai\n#fyppppp #sadardiri",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                        height: 1.3,
                      ),
                      maxLines: 4,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),

              // 5. Tombol Tambah (+)
              Positioned(
                bottom: 105,
                right: 20,
                child: SizedBox(
                  width: 45,
                  height: 45,
                  child: FloatingActionButton(
                    onPressed: () {},
                    backgroundColor: Colors.pink,
                    elevation: 4,
                    child: const Icon(Icons.add, color: Colors.white, size: 28),
                  ),
                ),
              ),

              // 6. Navigation Bar (Home, Search, Profile)
              // 6. Navigation Bar (Home, Search, Profile)
              Positioned(
                bottom: 15,
                left: 15,
                right: 15,
                child: Container(
                  height: 65,
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.5),
                    borderRadius: BorderRadius.circular(35),
                    border: Border.all(color: Colors.white10),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      // Tombol Home
                      IconButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const DeflineDashboard(),
                            ),
                          );
                        },
                        icon: const Icon(
                          Icons.home,
                          color: Colors.white,
                          size: 28,
                        ),
                      ),

                      // TOMBOL SEARCH DENGAN IKON DI KIRI & TEKS DI TENGAH
                      GestureDetector(
                        onTap: () {
                          // Aksi pencarian
                        },
                        child: Container(
                          width: screenWidth * 0.4,
                          // Lebar sedikit ditambah agar teks leluasa
                          padding: const EdgeInsets.symmetric(
                            horizontal: 12,
                            vertical: 8,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.white24,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Row(
                            // Ini yang membuat ikon & teks berada di tengah container
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                              Icon(Icons.search, color: Colors.white, size: 18),
                              SizedBox(width: 8), // Jarak antara ikon dan teks
                              Text(
                                'Search',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 14,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),

                      // Tombol Profile
                      IconButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const ProfilePage(),
                            ),
                          );
                        },
                        icon: const Icon(
                          Icons.person,
                          color: Colors.white,
                          size: 28,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
