import 'package:defuline_app/pages/homepage.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFFFDEFF9),
              Color(0xFFEC38BC),
              Color(0xFF7303C0),
            ],
          ),
        ),
        child: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: Column(
                children: [
                  const SizedBox(height: 50),

                  _buildLogoSection(),

                  const SizedBox(height: 50),


                  _buildLabel("USERNAME"),
                  _buildTextField(hint: ""),

                  const SizedBox(height: 20),


                  _buildLabel("PASSWORD"),
                  _buildTextField(hint: "", isPassword: true),

                  const SizedBox(height: 40),


                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _socialIcon("asset/image/google.png"),

                      ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => const DeflineDashboard()),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.cyanAccent,
                          foregroundColor: Colors.black,
                          padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 12),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                        child: const Text("LOGIN", style: TextStyle(fontWeight: FontWeight.bold)),
                      ),

                      _socialIcon("asset/image/xapp.png"),
                      _socialIcon("asset/image/facebook.png"),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildLogoSection() {
    return Column(
      children: [
        Container(
          width: 80,
          height: 80,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            image: const DecorationImage(
              image: AssetImage('asset/image/logodefline.png'),
              fit: BoxFit.cover,
            ),
          ),
        ),
        const SizedBox(height: 10),
        const Text(
          'DEFLINE',
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
            color: Colors.purpleAccent,
            letterSpacing: 2,
          ),
        ),
      ],
    );
  }

  Widget _buildLabel(String text) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Padding(
        padding: const EdgeInsets.only(left: 10, bottom: 5),
        child: Text(
          text,
          style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.black, fontSize: 16),
        ),
      ),
    );
  }

  Widget _buildTextField({required String hint, bool isPassword = false}) {
    return TextField(
      obscureText: isPassword,
      decoration: InputDecoration(
        hintText: hint,
        filled: true,
        fillColor: Colors.white.withOpacity(0.6),
        contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        suffixIcon: isPassword ? const Icon(Icons.visibility, color: Colors.black) : null,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }


  Widget _socialIcon(String assetPath) {
    return InkWell(
      onTap: () {},
      child: CircleAvatar(
        radius: 18,
        backgroundColor: Colors.transparent,
        backgroundImage: AssetImage(assetPath),
      ),
    );
  }
}
