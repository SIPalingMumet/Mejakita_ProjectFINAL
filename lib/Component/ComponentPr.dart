import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:static_mejakita/Fungsi/FungsiPR.dart';

class Widgetz extends StatefulWidget {
  const Widgetz({super.key});

  @override
  State<Widgetz> createState() => _WidgetzState();
}

class _WidgetzState extends State<Widgetz> {
  final Funtion funtion = Funtion();

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
                            funtion.InputSoal(context);
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
                              funtion.InputSoal(context);
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
                          funtion.InputSoal(context);
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
              child: Padding(
                padding: const EdgeInsets.only(top: 8.0, left: 8.0, right: 8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Filter berdasarkan:',
                      style: GoogleFonts.actor(fontSize: 14),
                    ),
                    const SizedBox(height: 8.0),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          funtion.buildDropdownFilter(setState),
                          const SizedBox(width: 8),
                          funtion.buildFilterButton('Matematika', setState),
                          const SizedBox(width: 8),
                          funtion.buildFilterButton('Fisika', setState),
                          const SizedBox(width: 8),
                          funtion.buildFilterButton('Kimia', setState),
                          const SizedBox(width: 8),
                          funtion.buildFilterButton('Biologi', setState),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
