import 'package:flutter/material.dart'; 
import 'package:google_fonts/google_fonts.dart';

class Louis extends StatefulWidget {
  const Louis({super.key});

  @override
  State<Louis> createState() => _LouisState();
}

class _LouisState extends State<Louis> {
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
                // funtion.InputSoal(context);
              },
              child: Container(
                width: double.infinity,  
                padding: const EdgeInsets.symmetric(
                    vertical: 8, horizontal: 20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(14),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      spreadRadius: 3,
                      blurRadius: 0,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: Text(
                  'Tuliskan Jawabanmu',
                  style: GoogleFonts.actor(
                    fontSize: 12, 
                    color: Colors.grey,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
