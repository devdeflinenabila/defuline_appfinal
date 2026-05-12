import 'package:defuline_app/pages/homepage.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const SettingsApp());
}

class SettingsApp extends StatefulWidget {
  const SettingsApp({super.key});

  @override
  State<SettingsApp> createState() => _SettingsAppState();
}

class _SettingsAppState extends State<SettingsApp> {
  // State global untuk Tema dan Bahasa
  ThemeMode _themeMode = ThemeMode.light;
  String _currentLanguage = 'Indonesia';

  void _toggleTheme(bool isDark) {
    setState(() {
      _themeMode = isDark ? ThemeMode.dark : ThemeMode.light;
    });
  }

  void _changeLanguage(String lang) {
    setState(() {
      _currentLanguage = lang;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // Konfigurasi Tema Terang
      theme: ThemeData(
        brightness: Brightness.light,
        scaffoldBackgroundColor: Colors.white,
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.white,
          foregroundColor: Colors.black,
          elevation: 0,
        ),
      ),
      // Konfigurasi Tema Gelap
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        scaffoldBackgroundColor: Colors.black,
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.black,
          foregroundColor: Colors.white,
          elevation: 0,
        ),
      ),
      themeMode: _themeMode,
      home: SettingsPage(
        currentLang: _currentLanguage,
        isDarkMode: _themeMode == ThemeMode.dark,
        onThemeChanged: _toggleTheme,
        onLanguageChanged: _changeLanguage,
      ),
    );
  }
}

class SettingsPage extends StatelessWidget {
  final String currentLang;
  final bool isDarkMode;
  final Function(bool) onThemeChanged;
  final Function(String) onLanguageChanged;

  const SettingsPage({
    super.key,
    required this.currentLang,
    required this.isDarkMode,
    required this.onThemeChanged,
    required this.onLanguageChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Settings and privacy',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => DeflineDashboard(),
              ),
            );
          },
        ),
      ),
      body: ListView(
        children: [
          const _SectionHeader(title: 'Tampilan & Bahasa'),

          // Switch Mode Gelap
          ListTile(
            leading: Icon(isDarkMode ? Icons.dark_mode : Icons.light_mode),
            title: const Text('Mode Gelap'),
            trailing: Switch(
              value: isDarkMode,
              onChanged: onThemeChanged,
              activeColor: Colors.blue,
            ),
          ),

          // Menu Ganti Bahasa
          ListTile(
            leading: const Icon(Icons.language),
            title: const Text('Bahasa'),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(currentLang, style: const TextStyle(color: Colors.grey)),
                const Icon(Icons.chevron_right, color: Colors.grey),
              ],
            ),
            onTap: () => _showLanguageDialog(context),
          ),

          const Divider(thickness: 0.5),
          const _SectionHeader(title: 'Akun Anda'),
          const _SettingsItem(icon: Icons.person_outline, title: 'Pusat Akun'),
          const _SettingsItem(icon: Icons.lock_outline, title: 'Kata Sandi & Keamanan'),

          const Divider(thickness: 0.5),
          const _SectionHeader(title: 'Cara Anda Menggunakan'),
          const _SettingsItem(icon: Icons.notifications_none, title: 'Notifikasi'),
          const _SettingsItem(icon: Icons.history, title: 'Waktu yang Dihabiskan'),
          const _SettingsItem(icon: Icons.archive_outlined, title: 'Arsip dan Unduhan'),

          const Divider(thickness: 0.5),
          const _SectionHeader(title: 'Siapa yang Dapat Melihat'),
          const _SettingsItem(icon: Icons.lock_person_outlined, title: 'Privasi Akun'),
          const _SettingsItem(icon: Icons.star_outline, title: 'Teman Dekat'),
          const _SettingsItem(icon: Icons.block, title: 'Diblokir'),

          const SizedBox(height: 25),
          const Center(
            child: Text(
              'Keluar',
              style: TextStyle(
                color: Colors.red,
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
          ),
          const SizedBox(height: 40),
        ],
      ),
    );
  }

  // Fungsi untuk memunculkan pilihan bahasa dari bawah
  void _showLanguageDialog(BuildContext context) {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) {
        return Container(
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text('Pilih Bahasa', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
              const SizedBox(height: 10),
              ListTile(
                title: const Text('Indonesia'),
                onTap: () { onLanguageChanged('Indonesia'); Navigator.pop(context); },
              ),
              ListTile(
                title: const Text('English'),
                onTap: () { onLanguageChanged('English'); Navigator.pop(context); },
              ),
            ],
          ),
        );
      },
    );
  }
}

// Komponen Header Kategori
class _SectionHeader extends StatelessWidget {
  final String title;
  const _SectionHeader({required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
      child: Text(
        title,
        style: const TextStyle(
          color: Colors.grey,
          fontSize: 12,
          fontWeight: FontWeight.bold,
          letterSpacing: 0.5,
        ),
      ),
    );
  }
}


class _SettingsItem extends StatelessWidget {
  final IconData icon;
  final String title;
  const _SettingsItem({required this.icon, required this.title});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(icon),
      title: Text(title, style: const TextStyle(fontSize: 15)),
      trailing: const Icon(Icons.chevron_right, color: Colors.grey, size: 20),
      onTap: () {},
    );
  }
}
