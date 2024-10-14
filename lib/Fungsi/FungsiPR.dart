import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Funtion {
  String activeFilter = 'Semua';
  String selectedTingkat = 'Semua Tingkat';
  List<Widget> soalList = [];
  String? selectedMapel;
  String? selectedPendidikan;
  String? selectedMateri;

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

  void resetInput() {
    selectedTingkat = 'Semua Tingkat';
    selectedPendidikan = null;
    selectedMapel = null;
    selectedMateri = null;
    soalList.clear();
    activeFilter = 'Semua';
  }

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

  void InputSoal(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return StatefulBuilder(
          builder: (context, setState) {
            return AlertDialog(
              backgroundColor: Colors.white,
              title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text("Upload Soal"),
                  IconButton(
                    icon: const Icon(Icons.cancel_outlined,
                    color: Colors.white,),
                    onPressed: () {
                      resetInput();
                      Navigator.pop(context);
                    },
                  ),
                ],
              ),
              content: SingleChildScrollView(
                child: Column(
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
                            items: ['Matematika', 'Fisika', 'Kimia']
                                .map((mapel) => DropdownMenuItem<String>(
                                      value: mapel,
                                      child: Text(mapel),
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
                            items: ['SMP', 'SMA']
                                .map((pendidikan) => DropdownMenuItem<String>(
                                      value: pendidikan,
                                      child: Text(pendidikan),
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
                                child: Text(materi),
                              ))
                          .toList(),
                    ),
                    const SizedBox(height: 10),
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.amber,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      padding: const EdgeInsets.all(8.0),
                      child: const Text(
                        "Soal yang anda tambahkan akan terupload secara terpisah. Maksimal upload adalah 3 soal.",
                        style: TextStyle(color: Colors.blueGrey),
                      ),
                    ),
                    const SizedBox(height: 5),
                    ...soalList,
                    const SizedBox(height: 5),
                  ],
                ),
              ),
              actions: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.green,
                      ),
                      child: IconButton(
                        icon: const Icon(Icons.add, color: Colors.white),
                        onPressed: () {
                          if (soalList.length < 3) {
                            setState(() {
                              soalList.add(
                                Container(
                                  margin:
                                      const EdgeInsets.symmetric(vertical: 8),
                                  padding: const EdgeInsets.all(8),
                                  decoration: const BoxDecoration(
                                    border: Border(
                                      bottom: BorderSide(
                                        color: Colors.grey,
                                        width: 2,
                                      ),
                                    ),
                                  ),
                                  child: Row(
                                    children: [
                                      const Expanded(
                                        child: TextField(
                                          decoration: InputDecoration(
                                            hintText:
                                                'Tuliskan Soal Secara Detail atau Apa yang Membuat Kamu Bingung!',
                                            border: InputBorder.none,
                                          ),
                                          maxLines: null,
                                          keyboardType: TextInputType.multiline,
                                        ),
                                      ),
                                      IconButton(
                                        icon: const Icon(Icons.close,
                                            color: Colors.grey),
                                        onPressed: () {
                                          setState(() {
                                            soalList
                                                .removeAt(soalList.length - 1);
                                          });
                                        },
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            });
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text('Maksimal upload adalah 3 soal.'),
                              ),
                            );
                          }
                        },
                        padding: const EdgeInsets.all(0),
                        constraints: const BoxConstraints(),
                        tooltip: 'Tambah Soal',
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green,
                        padding: const EdgeInsets.symmetric(
                            vertical: 10, horizontal: 15),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        elevation: 6,
                      ),
                      child: Text(
                        '  Upload  ',
                        style: GoogleFonts.actor(
                            fontSize: 12, color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ],
            );
          },
        );
      },
    );
  }

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
              width: 100, // Lebar gambar
              height: 150, // Tinggi gambar
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
                    icon: const Icon(Icons.maps_ugc_sharp, color: Colors.grey),
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
