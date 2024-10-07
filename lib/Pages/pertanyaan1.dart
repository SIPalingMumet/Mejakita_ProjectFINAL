import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Pertanyaan1 extends StatefulWidget {
  const Pertanyaan1({super.key});

  @override
  State<Pertanyaan1> createState() => _Pertanyaan1State();
}

class _Pertanyaan1State extends State<Pertanyaan1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Pilih bidang yang kamu kuasai!",
          style: GoogleFonts.actor(fontSize: 16),
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pushReplacementNamed('/homepage');
                  },
                  child: Text(
                    'LEWATI',
                    style: GoogleFonts.actor(fontSize: 14),
                  ),
                ),
                const SizedBox(width: 16),
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pushReplacementNamed('/homepage');
                  },
                  child: Text(
                    'SIMPAN',
                    style: GoogleFonts.actor(fontSize: 14),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}