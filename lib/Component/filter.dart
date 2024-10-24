import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class filter {
  String? selectedMapel;
  String? selectedPendidikan;
  String? selectedMateri;
  
  // Fungsi untuk menamoilkan widget filter
  void Dialogfilter(BuildContext context) {
    showDialog(
        context: context,
        builder: (context) {
          return StatefulBuilder(
            builder: (BuildContext context, setState) {
              return AlertDialog(
                backgroundColor: const Color(0xFF9CA3AF),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                title: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const SizedBox(width: 10),
                    Text(
                      "Pilih Filter ",
                      style: GoogleFonts.nunito(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w800),
                    ),
                    IconButton(
                      icon: const Icon(
                        Icons.cancel_outlined,
                        color: Colors.white,
                      ),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                  ],
                ),
                content: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: DropdownButtonFormField<String>(
                            value: selectedMapel,
                            hint: const Text(' Mapel',
                                style: TextStyle(fontSize: 16)),
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: Colors.white,
                              contentPadding: const EdgeInsets.symmetric(
                                  vertical: 5, horizontal: 0.8),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12),
                                borderSide: const BorderSide(
                                    color: Colors.blue, width: 2),
                              ),
                            ),
                            onChanged: (newValue) {
                              setState(() {
                                selectedMapel = newValue;
                              });
                            },
                            items: [' Matematika ', ' Fisika  ', ' Kimia ']
                                .map((mapel) => DropdownMenuItem<String>(
                                      value: mapel,
                                      child: Container(
                                        margin: const EdgeInsets.symmetric(
                                          horizontal: 5,
                                        ),
                                        padding: const EdgeInsets.symmetric(
                                          vertical: 3,
                                          horizontal: 3,
                                        ),
                                        decoration: BoxDecoration(
                                          color: const Color(0xFF4d9d75),
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                        ),
                                        child: Text(
                                          mapel,
                                          style: GoogleFonts.nunito(
                                              color: Colors.white,
                                              fontWeight: FontWeight.w400),
                                        ),
                                      ),
                                    ))
                                .toList(),
                          ),
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          child: DropdownButtonFormField<String>(
                            value: selectedPendidikan,
                            hint: const Text(' Tingkat',
                                style: TextStyle(fontSize: 16)),
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: Colors.white,
                              contentPadding: const EdgeInsets.symmetric(
                                  vertical: 5, horizontal: 1),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12),
                                borderSide: const BorderSide(
                                    color: Colors.grey, width: 2),
                              ),
                            ),
                            onChanged: (newValue) {
                              setState(() {
                                selectedPendidikan = newValue;
                                selectedMateri = null;
                              });
                            },
                            items: [' SMP ', ' SMA ']
                                .map((pendidikan) => DropdownMenuItem<String>(
                                      value: pendidikan,
                                      child: Container(
                                        margin: const EdgeInsets.symmetric(
                                          horizontal: 5,
                                        ),
                                        padding: const EdgeInsets.symmetric(
                                          vertical: 3,
                                          horizontal: 3,
                                        ),
                                        decoration: BoxDecoration(
                                          color: const Color(0xFF4d9d75),
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                        ),
                                        child: Text(
                                          pendidikan,
                                          style: GoogleFonts.nunito(
                                              color: Colors.white,
                                              fontWeight: FontWeight.w400),
                                        ),
                                      ),
                                    ))
                                .toList(),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 15),
                    DropdownButtonFormField<String>(
                      value: selectedMateri,
                      hint:
                          const Text(' Materi', style: TextStyle(fontSize: 16)),
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        contentPadding: const EdgeInsets.symmetric(
                            vertical: 5, horizontal: 1),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide:
                              const BorderSide(color: Colors.grey, width: 2),
                        ),
                      ),
                      onChanged: (newValue) {
                        setState(() {
                          selectedMateri = newValue;
                        });
                      },
                      items: getMateriOptions(selectedMapel, selectedPendidikan)
                          .map((materi) => DropdownMenuItem<String>(
                                value: materi,
                                child: Container(
                                  margin: const EdgeInsets.symmetric(
                                    horizontal: 5,
                                  ),
                                  padding: const EdgeInsets.symmetric(
                                    vertical: 3,
                                    horizontal: 3,
                                  ),
                                  decoration: BoxDecoration(
                                    color: const Color(0xFF4d9d75),
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                  child: Text(
                                    materi,
                                    style: GoogleFonts.nunito(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w400),
                                  ),
                                ),
                              ))
                          .toList(),
                    ),
                    const SizedBox(height: 20),
                    Center(
                        child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xFF4d9d75),
                        padding: const EdgeInsets.symmetric(
                            vertical: 10, horizontal: 15),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        elevation: 6,
                      ),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Text(
                        '  Filter ',
                        style: GoogleFonts.actor(
                            fontSize: 12, color: Colors.white),
                      ),
                    )),
                  ],
                ),
              );
            },
          );
        });
  }
 // Fungsi Untuk Menampilkan Percabangan
  List<String> getMateriOptions(String? mapel, String? pendidikan) {
    if (mapel == null || pendidikan == null) {
      return [];
    }

    if (mapel == ' Fisika ' && pendidikan == ' SMP ') {
      return [' Gerak', ' Gaya', ' Energi'];
    } else if (mapel == ' Fisika  ' && pendidikan == ' SMA ') {
      return [' Kinematika', ' Dinamika', ' Hukum Newton'];
    } else if (mapel == ' Matematika ' && pendidikan == ' SMP ') {
      return [' Aljabar', ' Geometri Dasar', ' Bilangan'];
    } else if (mapel == ' Matematika ' && pendidikan == ' SMA ') {
      return [' Kalkulus', ' Trigonometri', '  Statistika'];
    } else if (mapel == ' Kimia ' && pendidikan == '  SMP ') {
      return [' Zat dan Wujudnya', '  Perubahan Kimia', ' Asam dan Basa'];
    } else if (mapel == ' Kimia ' && pendidikan == ' SMA ') {
      return [' Stoikiometri', '  Ikatan Kimia', '  Termokimia'];
    }

    return [];
  }
}
