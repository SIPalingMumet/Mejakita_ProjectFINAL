import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:static_mejakita/Component/ComponentJawaban.dart';
import 'package:static_mejakita/Fungsi%20Tampilan/FungsiPR.dart';

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
      padding: const EdgeInsets.all(5),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextButton(
                  onPressed: () {
                    // funtion.InputSoal(context);
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
                        'Kirim Pertanyaan anda Disini',
                        style: GoogleFonts.nunito(
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                            color: Colors.grey),
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
            const SizedBox(height: 15),
            Container(
              width: MediaQuery.of(context).size.width,
              color: Colors.white,
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
            ),
            const SizedBox(
              height: 5,
            ),
            funtion.buildQuestionCard(
              userName: "Saya",
              questionText: "Hormon adalah pembawa pesan kimiawi...",
              imageUrl: null,
              likes: 20,
              comments: 0,
              onNavigate: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const Louis(
                      questionText: "Hormon adalah pembawa pesan kimiawi...",
                      userName: "Saya",
                      imageUrl: null,
                      likes: 20,
                      comments: 0,
                    ),
                  ),
                );
              },
            ),
            const SizedBox(
              height: 5,
            ),
            funtion.buildQuestionCard(
                userName: "Andrew Jacked",
                questionText:
                    "Apakah aplikasi yang bergerak di bidang non profit pendidikan yang adala di malang jawa timur ",
                likes: 2,
                imageUrl: 'https://picsum.photos/200/300',
                comments: 5,
                onNavigate: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const Louis(
                          questionText:
                              "Apakah aplikasi yang bergerak di bidang non profit pendidikan yang adala di malang jawa timur ",
                          userName: "Andrew Jacked",
                          imageUrl: 'https://picsum.photos/200/300',
                          likes: 2,
                          comments: 5,
                        ),
                      ));
                }),
          ],
        ),
      ),
    );
  }
}
