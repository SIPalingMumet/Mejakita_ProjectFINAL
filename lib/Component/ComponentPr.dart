import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Widgetz extends StatelessWidget {
  const Widgetz({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(0),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(0),
                  child: Row(
                    children: [
                      const SizedBox(width: 20),
                      const CircleAvatar(
                        backgroundImage: AssetImage('images/tole.png'),
                        radius: 24,
                      ),
                      const SizedBox(width: 4),
                      Expanded(
                        child: TextButton(
                          onPressed: () {
                            // funtion.tanyaSoal(context, setState);
                          },
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                                vertical: 10, horizontal: 20),
                            decoration: BoxDecoration(
                              color: Colors.grey[200],
                              borderRadius: BorderRadius.circular(8),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.1),
                                  spreadRadius: 3,
                                  blurRadius: 6,
                                  offset: const Offset(0, 3),
                                ),
                              ],
                            ),
                            child: Text(
                              'Soal apa yang ingin kamu tanyain?            ',
                              style: GoogleFonts.actor(
                                  fontSize: 12, color: Colors.grey),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 87),
                          child: IconButton(
                            icon: const Icon(
                              Icons.photo_camera,
                              color: Colors.grey,
                              size: 20,
                            ),
                            onPressed: () {
                              // funtion.tanyaSoal(context, setState);
                            },
                          ),
                        ),
                        const SizedBox(width: 2),
                        Text(
                          "Foto Soal",
                          style: GoogleFonts.actor(
                              fontSize: 10, color: Colors.grey),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 30),
                      child: ElevatedButton(
                        onPressed: () {
                          // funtion.tanyaSoal(context, setState);
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.green,
                          padding: const EdgeInsets.symmetric(
                              vertical: 0, horizontal: 10),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          elevation: 6,
                          minimumSize: const Size(0, 30),
                        ),
                        child: Text(
                          '  Upload  ',
                          style: GoogleFonts.actor(
                              fontSize: 12, color: Colors.white),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 5),
            Container(
              width: MediaQuery.of(context).size.width,
              color: const Color.fromARGB(255, 235, 235, 235),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  '  Filter berdasarkan :',
                  style: GoogleFonts.actor(fontSize: 14),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
