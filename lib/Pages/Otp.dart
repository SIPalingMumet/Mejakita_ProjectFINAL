import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Otp extends StatefulWidget {
  const Otp({super.key});

  @override
  State<Otp> createState() => _OtpState();
}

class _OtpState extends State<Otp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
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
                  "Kode OTP",
                  style: GoogleFonts.nunito(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
              ],
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
                  Navigator.of(context).pushReplacementNamed('/Reset');
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
          ],
        ),
      ),
    );
  }
}
