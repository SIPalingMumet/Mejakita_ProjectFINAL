import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:static_mejakita/Pages/Splash.dart';
import 'pertanyaan2.dart';

class Pertanyaan1 extends StatefulWidget {
  const Pertanyaan1({super.key});

  @override
  State<Pertanyaan1> createState() => _PertanyaanState();
}

class _PertanyaanState extends State<Pertanyaan1> {
  String? selectedOption;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        title: const Text(
          "Pilih bidang yang kamu kuasai!",
          style: TextStyle(
            fontFamily: 'Lato',
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
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
                  child: const Text(
                    'LEWATI',
                    style: TextStyle(color: Colors.grey),
                  ),
                ),
                const SizedBox(width: 16),
                TextButton(
                  onPressed: () {
                    const SplashScreen();
                  },
                  child: const Text(
                    'SIMPAN',
                    style: TextStyle(color: Colors.blue),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      body: Container(
        color: Colors.white,
        child: ListView(
          padding: const EdgeInsets.all(10),
          children: [
            const SizedBox(height: 10),
            buildOptionItem('[English] English UK', Icons.language, 'English'),
            buildOptionItem(
                'Pengetahuan Kuantitatif', Icons.calculate, 'Kuantitatif'),
          ],
        ),
      ),
    );
  }

  Widget buildOptionItem(String title, IconData icon, String value) {
    bool isSelected = selectedOption == value;

    return GestureDetector(
      onDoubleTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => Pertanyaan2(selectedSubject: value),
          ),
        );
      },
      onTap: () {
        setState(() {
          selectedOption = value;
        });
      },
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
        decoration: BoxDecoration(
          color: isSelected
              ? Colors.purple.withOpacity(0.1)
              : const Color.fromARGB(255, 251, 251, 251),
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            color: isSelected ? Colors.purple : Colors.grey.shade300,
            width: 2,
          ),
        ),
        child: Row(
          children: [
            Icon(
              icon,
              size: 35,
              color: isSelected ? Colors.purple : Colors.grey,
            ),
            const SizedBox(width: 15),
            Expanded(
              child: Text(
                title,
                style: GoogleFonts.actor(
                  fontSize: 16,
                  color: isSelected ? Colors.purple : Colors.black,
                  fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                ),
              ),
            ),
            if (isSelected)
              const Icon(
                Icons.check_circle,
                color: Colors.purple,
              ),
          ],
        ),
      ),
    );
  }
}
