import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Jawaban extends StatefulWidget {
  const Jawaban({super.key});

  @override
  State<Jawaban> createState() => _JawabanState();
}

class _JawabanState extends State<Jawaban> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      leading: IconButton(
          icon: const Icon(Icons.chevron_left),
          onPressed: () {
            Navigator.of(context).pushReplacementNamed('/homepage');
          },
        ),
        title: Text("Diskusi PR",style: GoogleFonts.actor(fontSize: 16),),
        ),
    );
  }
}