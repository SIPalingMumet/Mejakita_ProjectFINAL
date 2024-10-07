import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Diskusipr extends StatefulWidget {
  const Diskusipr({super.key});

  @override
  State<Diskusipr> createState() => _DiskusiprState();
}

class _DiskusiprState extends State<Diskusipr> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      leading: IconButton(
          icon: const Icon(Icons.chevron_left),
          onPressed: () {
            // Navigator.pop(context);
          },
        ),
        title: Text("Diskusi PR", style: GoogleFonts.actor(fontSize: 16),),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                  icon: const Icon(Icons.history, color: Colors.black),
                  onPressed: () {
                    Navigator.of(context).pushReplacementNamed('/history');
                  },
                ),
                const SizedBox(width: 3),
                IconButton(
                  icon: const Icon(Icons.person, color: Colors.black),
                  onPressed: () {
                    Navigator.of(context).pushReplacementNamed('/pertanyaan');
                  },
                ),
                const SizedBox(width: 8),
              ],
            ),
          ),
        ]
      ),
      body: const Column(
        
      ),
    );
  }
}