import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Colors.cyanAccent, Colors.purple, Colors.pinkAccent],
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              _buildProfileHeader(),
              _buildUserInfo(),
              const SizedBox(height: 20),
              _buildStatsAndTabs(),
              _buildProfileContent(context),
              _buildBottomNav(context, isProfileActive: true),
            ],
          ),
        ),
      ),
    );
  }


  Widget _buildProfileHeader() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text(
            "PROFILE",
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              fontStyle: FontStyle.italic,
              color: Colors.yellow,
            ),
          ),
          IconButton(
            icon: const Icon(Icons.settings, size: 30, color: Colors.white),
            onPressed: () {},
          ),
        ],
      ),
    );
  }

  // --- USER INFO: Foto Profil (Asset) dan Nama ---
  Widget _buildUserInfo() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(4),
            decoration: const BoxDecoration(
              color: Colors.cyanAccent,
              shape: BoxShape.circle,
            ),
            child: const CircleAvatar(
              radius: 40,
              backgroundImage: AssetImage("asset/image/kisah3.jpg"),
            ),
          ),
          const SizedBox(width: 15),
          const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "DEFADMIN",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
              ),
              Text("@defmin", style: TextStyle(color: Colors.white70)),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildStatsAndTabs() {
    return const Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text("Mengikuti", style: TextStyle(fontSize: 14, color: Colors.white)),
            Text("Pengikut", style: TextStyle(fontSize: 14, color: Colors.white)),
          ],
        ),
        SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Icon(Icons.play_arrow, size: 30, color: Colors.white),
            Icon(Icons.image, size: 30, color: Colors.white),
            Icon(Icons.favorite, size: 30, color: Colors.white),
          ],
        ),
        Divider(color: Colors.white24, thickness: 1),
      ],
    );
  }


  Widget _buildProfileContent(BuildContext context) {
    return Expanded(
      child: Stack(
        children: [
          GridView.builder(
            padding: const EdgeInsets.all(2),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              crossAxisSpacing: 2,
              mainAxisSpacing: 2,
            ),
            itemCount: 15,
            itemBuilder: (context, index) {
              return Container(
                color: Colors.white10,
                child: Image.asset(
                  "asset/image/wls3t_$index.jpg",
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return const Center(
                      child: Icon(Icons.image_not_supported, color: Colors.white24),
                    );
                  },
                ),
              );
            },
          ),

          Positioned(
            bottom: 20,
            right: 16,
            child: Column(
              children: [
                const Icon(Icons.video_library, size: 40, color: Colors.black),
                const SizedBox(height: 10),
                FloatingActionButton(
                  onPressed: () {},
                  backgroundColor: Colors.pink,
                  child: const Icon(Icons.add, size: 35, color: Colors.white),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBottomNav(BuildContext context, {required bool isProfileActive}) {
    return Container(
      height: 70,
      margin: const EdgeInsets.only(bottom: 10, left: 16, right: 16),
      decoration: BoxDecoration(
        color: Colors.black26,
        borderRadius: BorderRadius.circular(35),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          IconButton(
            icon: Icon(
              Icons.home_filled,
              size: 30,
              color: isProfileActive ? Colors.white : Colors.yellow,
            ),
            onPressed: () {
              if (isProfileActive) Navigator.pop(context);
            },
          ),
          Container(
            width: 200,
            height: 40,
            decoration: BoxDecoration(
              color: Colors.white24,
              borderRadius: BorderRadius.circular(20),
            ),
            child: const Row(
              children: [
                SizedBox(width: 15),
                Icon(Icons.search, color: Colors.white),
              ],
            ),
          ),
          IconButton(
            icon: Icon(
              Icons.person,
              size: 30,
              color: isProfileActive ? Colors.yellow : Colors.white,
            ),
            onPressed: () {

              if (!isProfileActive) {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const ProfilePage()),
                );
              }
            },
          ),
        ],
      ),
    );
  }
}
