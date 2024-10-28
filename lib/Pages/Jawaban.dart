import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:static_mejakita/Component/ComponentJawaban.dart';

class Jawaban extends StatelessWidget {
  final String questionText;
  final String userName;
  final String? imageUrl;
  final int likes;
  final int comments;

  const Jawaban({
    super.key,
    required this.questionText,
    required this.userName,
    this.imageUrl,
    required this.likes,
    required this.comments,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.chevron_left),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text(
          "Diskusi PR",
          style: GoogleFonts.nunito(
            fontSize: 14,
            fontWeight: FontWeight.w800,
            color: Colors.black,
          ),
        ),
        centerTitle: true,
      ),
      body: Louis(
        questionText: questionText,
        userName: userName,
        imageUrl: imageUrl,
        likes: likes,
        comments: comments,
      ),
    );
  }
}
