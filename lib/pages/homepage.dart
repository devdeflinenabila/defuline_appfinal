import 'package:defuline_app/pages/profilpage.dart';
import 'package:defuline_app/pages/realss_page.dart';
import 'package:defuline_app/pages/search.dart';
import 'package:defuline_app/pages/settinggs.dart';
import 'package:flutter/material.dart';

class DeflineDashboard extends StatefulWidget {
  const DeflineDashboard({super.key});

  @override
  State<DeflineDashboard> createState() => _DeflineDashboardState();
}

class _DeflineDashboardState extends State<DeflineDashboard> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  bool _isLiked = false;

  void _showComments() {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(25)),
      ),
      builder: (context) => Container(
        padding: const EdgeInsets.all(20),
        height: 400,
        child: Column(
          children: [
            Container(
              width: 50,
              height: 5,
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              "Komentar",
              style: TextStyle(
                color: Colors.black,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const Divider(),
            Expanded(
              child: ListView(
                children: const [
                  ListTile(
                    leading: CircleAvatar(backgroundColor: Colors.blue),
                    title: Text(
                      "User_A",
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    subtitle: Text(
                      "Keren banget fotonya!",
                      style: TextStyle(color: Colors.black54),
                    ),
                  ),
                  ListTile(
                    leading: CircleAvatar(backgroundColor: Colors.green),
                    title: Text(
                      "User_B",
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    subtitle: Text(
                      "Lagi dimana ini kak?",
                      style: TextStyle(color: Colors.black54),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.cyan, Colors.purple, Colors.pinkAccent],
                ),
              ),
              child: Text(
                'MENU',
                style: TextStyle(color: Colors.white, fontSize: 24),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.settings),
              title: const Text('SETTINGS'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SettingsApp(),
                  ),
                );
              }),
            ListTile(
              leading: const Icon(Icons.accessibility),
              title: const Text('ABOUT'),
              onTap: () => Navigator.pop(context),
            ),
            ListTile(
              leading: const Icon(Icons.comment),
              title: const Text('USER AGREEMENT'),
              onTap: () => Navigator.pop(context),
            ),
            ListTile(
              leading: const Icon(Icons.policy),
              title: const Text('PRIVACY POLICY'),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const Profilpage()),
                );
              },
            ),
          ],
        ),
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Colors.cyanAccent, Colors.purple, Colors.pinkAccent],
            stops: [0.0, 0.5, 1.0],
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 10,
                ),
                child: Row(
                  children: [
                    IconButton(
                      icon: const Icon(
                        Icons.menu,
                        size: 30,
                        color: Colors.white,
                      ),
                      onPressed: () => _scaffoldKey.currentState?.openDrawer(),
                    ),
                    const SizedBox(width: 10),
                    const Text(
                      'DEFLINE',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        fontStyle: FontStyle.italic,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),

              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                  children: [
                    _buildStoryItem("asset/image/kisah3.jpg", isViewed: true),
                    _buildStoryItem("asset/image/kisah2.jpg"),
                    _buildStoryItem("asset/image/wls3.jpg"),
                    _buildFollowButton(),
                  ],
                ),
              ),

              const SizedBox(height: 20),

              Expanded(
                child: Container(
                  margin: const EdgeInsets.symmetric(horizontal: 16),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Column(
                    children: [
                      const ListTile(
                        leading: CircleAvatar(
                          backgroundImage: AssetImage("asset/image/wls2.jpg"),
                        ),
                        title: Text(
                          "KISAHGUA_1F",
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        subtitle: Text(
                          "@KISAHGUA__NIH",
                          style: TextStyle(color: Colors.orange),
                        ),
                        trailing: Icon(Icons.music_note, color: Colors.black),
                      ),
                      Expanded(
                        child: ClipRRect(
                          child: Image.asset(
                            "asset/image/kisah2.jpg",
                            fit: BoxFit.cover,
                            width: double.infinity,
                          ),
                        ),
                      ),

                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  _isLiked = !_isLiked;
                                });
                              },
                              child: Icon(
                                _isLiked
                                    ? Icons.favorite
                                    : Icons.favorite_border,
                                color: _isLiked ? Colors.red : Colors.pink,
                                size: 35,
                              ),
                            ),
                            const SizedBox(width: 15),

                            GestureDetector(
                              onTap: _showComments,
                              child: const Icon(
                                Icons.chat,
                                color: Colors.pink,
                                size: 32,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              _buildBottomSection(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildBottomSection(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Column(
                children: [
                  IconButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const RealssPage(),
                        ),
                      );
                    },
                    icon: const Icon(
                      Icons.video_library,
                      color: Colors.white,
                      size: 30,
                    ),
                  ),
                  FloatingActionButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const RealssPage(),
                        ),
                      );
                    },
                    backgroundColor: Colors.pink,
                    child: const Icon(Icons.add, color: Colors.white, size: 35),
                  ),
                ],
              ),
            ],
          ),
        ),
        Container(
          height: 70,
          margin: const EdgeInsets.only(bottom: 10, left: 16, right: 16),
          decoration: BoxDecoration(
            color: Colors.black26,
            borderRadius: BorderRadius.circular(35),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              const Icon(Icons.home_filled, size: 30, color: Colors.yellow),
              Container(
                width: 200,
                height: 40,
                decoration: BoxDecoration(
                  color: Colors.white24,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Row(
                  children: [
                    IconButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => SearchAccountPage(),
                          ),
                        );
                      },
                      icon: const Icon(
                        Icons.search_rounded,
                        color: Colors.white,
                        size: 30,
                      ),
                    ),
                  ],
                ),
              ),
              IconButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const Profilpage(),
                    ),
                  );
                },
                icon: const Icon(
                  Icons.person_outline,
                  color: Colors.white,
                  size: 30,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildStoryItem(String imagePath, {bool isViewed = false}) {
    return Container(
      margin: const EdgeInsets.only(right: 12),
      padding: const EdgeInsets.all(3),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(
          color: isViewed ? Colors.blue : Colors.orange,
          width: 3,
        ),
      ),
      child: CircleAvatar(radius: 35, backgroundImage: AssetImage(imagePath)),
    );
  }

  Widget _buildFollowButton() {
    return Column(
      children: [
        const Text(
          "FOLLOW",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 12,
            color: Colors.white,
          ),
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
          decoration: BoxDecoration(
            color: Colors.orange,
            borderRadius: BorderRadius.circular(10),
          ),
          child: const Icon(Icons.keyboard_arrow_down, color: Colors.white),
        ),
      ],
    );
  }
}
