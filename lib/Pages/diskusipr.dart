import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:static_mejakita/Component/ComponentPr.dart';
import 'package:static_mejakita/Fungsi/filter.dart';

class Diskusipr extends StatefulWidget {
  const Diskusipr({super.key});

  @override
  State<Diskusipr> createState() => _DiskusiprState();
}

class _DiskusiprState extends State<Diskusipr> {
  late filter myfilter = filter();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        title: Text(
          "Diskusi PR",
          style: GoogleFonts.nunito(fontSize: 14, fontWeight: FontWeight.w800),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                  onPressed: () {
                    myfilter.Dialogfilter(context);
                  },
                  icon: const Icon(Icons.filter_alt_outlined),
                  color: const Color(0xFF4d9d75),
                ),
                const SizedBox(width: 1),
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).pushReplacementNamed('/history');
                  },
                  child: Container(
                    width: 30,
                    height: 30,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: Colors.transparent,
                        width: 2.0,
                      ),
                    ),
                    child: ClipOval(
                      child: Image.asset(
                        'images/Ion1.png',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      body: const Widgetz(),
    );
  }
}
