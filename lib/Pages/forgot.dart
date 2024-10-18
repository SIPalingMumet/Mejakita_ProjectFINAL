import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Forgot extends StatefulWidget {
  const Forgot({super.key});

  @override
  State<Forgot> createState() => _ForgotState();
}

class _ForgotState extends State<Forgot> {
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(children: [
          Stack(children: [
            Container(
              height: 420,
              decoration: const BoxDecoration(
                color: Color(0xFF4d9d75),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(200),
                  bottomRight: Radius.circular(200),
                ),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 90),
              child: Center(
                child: Text(
                  "Lupa Password",
                  style: GoogleFonts.nunito(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 180),
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 20),
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 240, 240, 240),
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      spreadRadius: 1,
                      blurRadius: 5,
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    buildTextField(Icons.email_outlined, "Email anda", false),
                    const SizedBox(height: 20),
                    Text(
                      "Masukan Email yang akan Dikirim kode OTP",
                      style: GoogleFonts.nunito(
                          fontSize: 12,
                          fontWeight: FontWeight.w800,
                          color: Colors.grey),
                    ),
                    const SizedBox(height: 100),
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).pushReplacementNamed('/OTP');
                      },
                      child: Container(
                        width: 100,
                        padding: const EdgeInsets.symmetric(vertical: 12),
                        decoration: BoxDecoration(
                          color: const Color(0xFFd75252),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: const Center(
                          child: Text(
                            "Kirim OTP",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ]),
          const SizedBox(
            height: 20,
          ),
          Center(
              child: Column(
            children: [
              Text(
                "Ingat Password ?",
                style: GoogleFonts.nunito(
                    fontSize: 14,
                    fontWeight: FontWeight.w800,
                    color: Colors.black),
              ),
              const SizedBox(
                height: 5,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.of(context).pushReplacementNamed('/login');
                },
                child: Text(
                  "Log in",
                  style: GoogleFonts.nunito(
                    color: const Color(0xFF4d9d75),
                    fontWeight: FontWeight.w800,
                    fontSize: 12,
                  ),
                ),
              ),
            ],
          ))
        ]),
      ),
    );
  }

  Widget buildTextField(IconData icon, String hintText, bool isPassword) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 5,
          ),
        ],
      ),
      child: Row(
        children: [
          Icon(icon, color: Colors.green),
          const SizedBox(width: 15),
          Expanded(
            child: TextField(
              obscureText: isPassword ? _obscureText : false,
              decoration: InputDecoration(
                hintText: hintText,
                border: InputBorder.none,
              ),
            ),
          ),
          if (isPassword)
            GestureDetector(
              onTap: () {
                setState(() {
                  _obscureText = !_obscureText;
                });
              },
              child: Icon(
                _obscureText ? Icons.visibility : Icons.visibility_off,
                color: Colors.grey,
              ),
            ),
        ],
      ),
    );
  }
}
