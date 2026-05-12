import 'package:flutter/material.dart';

void main() => runApp(const MaterialApp(home: SearchAccountPage()));

class SearchAccountPage extends StatefulWidget {
  const SearchAccountPage({super.key});

  @override
  State<SearchAccountPage> createState() => _SearchAccountPageState();
}

class _SearchAccountPageState extends State<SearchAccountPage> {
  final List<Map<String, String>> _allAccounts = [
    {"name": "Budi Santoso", "username": "@budi_s"},
    {"name": "Siti Aminah", "username": "@sitiam"},
    {"name": "Andi Wijaya", "username": "@andiw"},
    {"name": "Dewi Lestari", "username": "@dewi_les"},
    {"name": "Rian Hidayat", "username": "@rianh"},
  ];

  List<Map<String, String>> _foundAccounts = [];

  @override
  void initState() {
    super.initState();
    _foundAccounts = _allAccounts;
  }

  void _runFilter(String enteredKeyword) {
    List<Map<String, String>> results = [];
    if (enteredKeyword.isEmpty) {
      results = _allAccounts;
    } else {
      results = _allAccounts
          .where(
            (user) =>
                user["username"]!.toLowerCase().contains(
                  enteredKeyword.toLowerCase(),
                ),
          )
          .toList();
    }

    setState(() {
      _foundAccounts = results;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Cari Akun')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              onChanged: (value) => _runFilter(value),
              decoration: const InputDecoration(
                labelText: 'Cari Username',
                suffixIcon: Icon(Icons.search),
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: _foundAccounts.isNotEmpty
                  ? ListView.builder(
                      itemCount: _foundAccounts.length,
                      itemBuilder: (context, index) => Card(
                        key: ValueKey(_foundAccounts[index]["username"]),
                        elevation: 2,
                        margin: const EdgeInsets.symmetric(vertical: 8),
                        child: ListTile(
                          leading: CircleAvatar(
                            child: Text(_foundAccounts[index]["name"]![0]),
                          ),
                          title: Text(_foundAccounts[index]["name"]!),
                          subtitle: Text(_foundAccounts[index]["username"]!),
                        ),
                      ),
                    )
                  : const Center(child: Text('Akun tidak ditemukan')),
            ),
          ],
        ),
      ),
    );
  }
}
