import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:static_mejakita/Fungsi/FungsiJawaban.dart';

class Louis extends StatefulWidget {
  const Louis({super.key});

  @override
  State<Louis> createState() => _LouisState();
}

class _LouisState extends State<Louis> {
  final fungis myFungis = fungis();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextButton(
              onPressed: () {
                myFungis.inputJawaban(context);
              },
              child: Container(
                width: double.infinity,
                padding:
                    const EdgeInsets.symmetric(vertical: 8, horizontal: 20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      spreadRadius: 3,
                      blurRadius: 0,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: Row(children: [
                  const Icon(
                    Icons.photo_camera,
                    color: Colors.black,
                  ),
                  const SizedBox(width: 30),
                  Text(
                    'Kirim Jawaban anda Disini',
                    style: GoogleFonts.nunito(
                        fontSize: 12, fontWeight: FontWeight.w400, color: Colors.grey),
                  ),
                  const SizedBox(width: 82),
                  const Icon(
                    Icons.send_outlined,
                    color: Colors.green,
                  ),
                ]),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
