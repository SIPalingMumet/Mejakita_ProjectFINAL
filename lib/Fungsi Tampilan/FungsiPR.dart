import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Funtion {
  String activeFilter = 'Semua'; //  default value
  String selectedTingkat = 'Semua Tingkat'; // default value
  List<Widget> soalList = []; // Container Soal
  String? selectedMapel; // Filter For Mapel
  String? selectedPendidikan; //  Filter For Pendidikan
  String? selectedMateri; // If Else of Mapel x Pendidikan

  // Dropdown Button For Pendidikan
  Widget buildDropdownFilter(Function setState) {
    List<String> tingkatOptions = [
      'Semua Tingkat',
      'SD',
      'SMP',
      'SMA',
      'Perguruan Tinggi',
    ];

    bool isActive = activeFilter == 'Semua Tingkat';

    return Container(
      constraints: const BoxConstraints(
        minWidth: 100,
        maxWidth: 150,
      ),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.green),
        borderRadius: BorderRadius.circular(20),
        color: isActive ? Colors.green : Colors.transparent,
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          value: selectedTingkat,
          onChanged: (String? newValue) {
            setState(() {
              selectedTingkat = newValue!;
              activeFilter = 'Semua Tingkat';
            });
          },
          items: tingkatOptions.map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 12, horizontal: 15),
                child: Text(
                  value,
                  style: GoogleFonts.actor(
                    color: isActive ? Colors.white : Colors.greenAccent,
                    fontSize: 12,
                  ),
                ),
              ),
            );
          }).toList(),
          dropdownColor: Colors.green,
          style: GoogleFonts.actor(
            color: isActive ? Colors.white : Colors.green,
            fontSize: 12,
          ),
          icon: const Icon(Icons.arrow_drop_down, color: Colors.green),
          isExpanded: true,
          hint: Container(
            padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 15),
            child: Text(
              'Pilih Tingkat',
              style: GoogleFonts.actor(
                  color: isActive ? Colors.white : Colors.green),
            ),
          ),
        ),
      ),
    );
  }

  // For Reset All Input Of Input Function
  void resetInput() {
    selectedTingkat = 'Semua Tingkat';
    selectedPendidikan = null;
    selectedMapel = null;
    selectedMateri = null;
    soalList.clear();
    activeFilter = 'Semua';
  }

  // Outlined Filtered Button
  Widget buildFilterButton(String filterName, Function setState) {
    bool isActive = activeFilter == filterName;

    return OutlinedButton(
      onPressed: () {
        setState(() {
          activeFilter = filterName;
        });
      },
      style: OutlinedButton.styleFrom(
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 15),
        backgroundColor: isActive ? Colors.green : Colors.transparent,
        side: BorderSide(
          color: isActive ? Colors.green : Colors.green,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
        minimumSize: const Size(100, 40),
      ),
      child: Text(
        filterName,
        style: GoogleFonts.actor(
          color: isActive ? Colors.white : Colors.green,
          fontSize: 12,
        ),
      ),
    );
  }

  // List Of Materi yang akan ditampilkan sesuai dengan isian mapel dan pendidikan
  List<String> getMateriOptions(String? mapel, String? pendidikan) {
    if (mapel == null || pendidikan == null) {
      return [];
    }

    if (mapel == 'Fisika' && pendidikan == 'SMP') {
      return ['Gerak', 'Gaya', 'Energi'];
    } else if (mapel == 'Fisika' && pendidikan == 'SMA') {
      return ['Kinematika', 'Dinamika', 'Hukum Newton'];
    } else if (mapel == 'Matematika' && pendidikan == 'SMP') {
      return ['Aljabar', 'Geometri Dasar', 'Bilangan'];
    } else if (mapel == 'Matematika' && pendidikan == 'SMA') {
      return ['Kalkulus', 'Trigonometri', 'Statistika'];
    } else if (mapel == 'Kimia' && pendidikan == 'SMP') {
      return ['Zat dan Wujudnya', 'Perubahan Kimia', 'Asam dan Basa'];
    } else if (mapel == 'Kimia' && pendidikan == 'SMA') {
      return ['Stoikiometri', 'Ikatan Kimia', 'Termokimia'];
    }

    return [];
  }

  // Fungsi Widget Untuk MengInputkan Soal dan  Filter
  void inputSoal(BuildContext context) {
    String? imagePath;
    showDialog(
      context: context,
      builder: (context) {
        return StatefulBuilder(builder: (context, setState) {
          TextEditingController messageController = TextEditingController();

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
                  "Upload Jawaban ",
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
                      child: Container(
                        height: 135,
                        width: 200,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.1),
                              spreadRadius: 3,
                              blurRadius: 6,
                              offset: const Offset(0, 3),
                            ),
                          ],
                        ),
                        child: imagePath == null
                            ? Center(
                                child: Text(
                                  "No file has choice",
                                  style: TextStyle(
                                    color: Colors.grey[500],
                                    fontSize: 14,
                                  ),
                                ),
                              )
                            : ClipRRect(
                                borderRadius: BorderRadius.circular(12),
                                child: Image.network(
                                  imagePath!,
                                  fit: BoxFit.cover,
                                  width: double.infinity,
                                  height: double.infinity,
                                ),
                              ),
                      ),
                    ),
                    const SizedBox(width: 10),
                    ElevatedButton.icon(
                      onPressed: () {
                        setState(() {
                          imagePath = 'https://picsum.photos/200/300';
                        });
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      icon:
                          const Icon(Icons.edit_document, color: Colors.white),
                      label: Text(
                        "Pilih File",
                        style: GoogleFonts.nunito(
                            fontSize: 12,
                            fontWeight: FontWeight.w800,
                            color: Colors.white),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
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
                            borderSide:
                                const BorderSide(color: Colors.blue, width: 2),
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
                                      borderRadius: BorderRadius.circular(8.0),
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
                            borderSide:
                                const BorderSide(color: Colors.grey, width: 2),
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
                                      borderRadius: BorderRadius.circular(8.0),
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
                const SizedBox(height: 10),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(24),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        spreadRadius: 3,
                        blurRadius: 0,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: TextField(
                          controller: messageController,
                          maxLines: null,
                          style: const TextStyle(fontSize: 12),
                          decoration: const InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Kirim pertanyaan anda disini',
                            hintStyle: TextStyle(color: Colors.grey),
                          ),
                        ),
                      ),
                      IconButton(
                        icon:
                            const Icon(Icons.send_outlined, color: Colors.grey),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        });
      },
    );
  }

  // Fungsi Untuk Menampilkan Widget Soal
  Widget buildQuestionCard({
    required String userName,
    required String questionText,
    String? imageUrl,
    required int likes,
    required int comments,
    required VoidCallback onNavigate,
  }) {
    return Card(
      color: const Color(0xFFF3F4F6),
      margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      elevation: 3,
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                ClipOval(
                  child: Image.asset(
                    'images/Ion1.png',
                    width: 40,
                    height: 40,
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(width: 10),
                Text(
                  userName,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            if (imageUrl != null)
              Container(
                width: 100,
                height: 150,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  image: DecorationImage(
                    image: NetworkImage(imageUrl),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            const SizedBox(height: 10),
            Text(
              questionText,
              style: const TextStyle(fontSize: 14),
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    IconButton(
                      icon: const Icon(Icons.thumb_up, color: Colors.black),
                      onPressed: () {},
                    ),
                    Text(likes.toString()),
                    const SizedBox(width: 10),
                    IconButton(
                      icon: const Icon(Icons.thumb_down, color: Colors.grey),
                      onPressed: () {},
                    ),
                    Text(comments.toString()),
                    const SizedBox(width: 10),
                    IconButton(
                      icon:
                          const Icon(Icons.maps_ugc_sharp, color: Colors.grey),
                      onPressed: () {
                        onNavigate();
                      },
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
