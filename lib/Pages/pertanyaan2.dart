import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Pertanyaan2 extends StatefulWidget {
  final String selectedSubject;

  const Pertanyaan2({super.key, required this.selectedSubject});

  @override
  State<Pertanyaan2> createState() => _Pertanyaan2State();
}

class _Pertanyaan2State extends State<Pertanyaan2> {
  bool selectAll = false;
  List<String> chapterTitles = [
    'Reading Comprehension - Context Clues',
    'Reading Comprehension - Vocabulary'
  ];
  List<bool> selectedChapters = [false, false];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.purple,
        title: Text(
          ' ${widget.selectedSubject}',
          style: GoogleFonts.actor(fontSize: 18, color: Colors.white),
        ),
      ),
      body: Container(
        padding: const EdgeInsets.all(20),
        color: Colors.purple,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text(
                  'Pilih Bab yang kamu kuasai',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.normal,
                    color: Colors.white,
                  ),
                ),
                Row(
                  children: [
                    const Text(
                      'Pilih Semua',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                      ),
                    ),
                    Checkbox(
                      value: selectAll,
                      onChanged: (bool? value) {
                        setState(() {
                          selectAll = value ?? false;
                          for (int i = 0; i < selectedChapters.length; i++) {
                            selectedChapters[i] = selectAll;
                          }
                        });
                      },
                      activeColor: Colors.white,
                      checkColor: Colors.purple,
                    ),
                    IconButton(
                      icon: const Icon(
                        Icons.check,
                        color: Colors.white,
                      ),
                      onPressed: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Data Telah Tersimpan'),
                          ),
                        );
                        Navigator.of(context).pushReplacementNamed('/pertanyaan');
                      },
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: chapterTitles.length,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            selectedChapters[index] = !selectedChapters[index];
                          });
                        },
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                            vertical: 15,
                            horizontal: 10,
                          ),
                          decoration: BoxDecoration(
                            color: selectedChapters[index]
                                ? Colors.white.withOpacity(0.1)
                                : Colors.white,
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(
                              color: selectedChapters[index]
                                  ? Colors.white
                                  : Colors.grey.shade300,
                              width: 2,
                            ),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                chapterTitles[index],
                                style: TextStyle(
                                  fontSize: 16,
                                  color: selectedChapters[index]
                                      ? Colors.white
                                      : Colors.black,
                                  fontWeight: selectedChapters[index]
                                      ? FontWeight.bold
                                      : FontWeight.normal,
                                ),
                              ),
                              if (selectedChapters[index])
                                const Icon(
                                  Icons.check_circle,
                                  color: Colors.white,
                                ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),
                    ],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
