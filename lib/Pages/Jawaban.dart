import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:static_mejakita/Component/ComponentJawaban.dart';

class Jawaban extends StatefulWidget {
  const Jawaban({super.key});

  @override
  State<Jawaban> createState() => _JawabanState();
}

class _JawabanState extends State<Jawaban> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
      backgroundColor: Colors.white,
      leading: IconButton(
          icon: const Icon(Icons.chevron_left),
          onPressed: () {
            Navigator.of(context).pushReplacementNamed('/homepage');
          },
        ),
        title: Text("Diskusi PR",
        style: GoogleFonts.nunito(fontSize: 14, fontWeight: FontWeight.w800),),
        ),
        body: const Louis(
  questionText: 'Your question text here',
  userName: 'Your username here',
  imageUrl: null,  
  likes: null,     
  comments: null,  
),

    );
  }
}