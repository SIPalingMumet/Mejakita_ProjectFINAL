import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
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
        title: Text(
          "Profile",
          style: GoogleFonts.nunito(fontSize: 14, fontWeight: FontWeight.w800),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 20),
            const Center(
              child: CircleAvatar(
                radius: 50,
                backgroundImage: AssetImage('images/Ion1.png'),
                backgroundColor: Colors.yellow,
              ),
            ),
            const SizedBox(height: 20),
            Container(
              margin: const EdgeInsets.all(20),
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: const Color(0xFFF3F4F6),
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: Colors.transparent),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 40,
                  ),
                  buildProfileItem(Icons.person_outline, "Andrew Jacked"),
                  const SizedBox(height: 14),
                  buildProfileItem(Icons.phone_outlined, "Antonio Vivaldi"),
                  const SizedBox(height: 14),
                  buildProfileItem(Icons.description_outlined, "11/01/2006"),
                  const SizedBox(height: 14),
                  buildProfileItem(
                      Icons.email_outlined, "Prajagopta@gmail.com"),
                  const SizedBox(
                    height: 40,
                  ),
                  Center(
                    child: TextButton(
                      onPressed: () {},
                      child: Container(
                        width: 100,
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        margin: const EdgeInsets.symmetric(horizontal: 20),
                        decoration: BoxDecoration(
                          color: const Color(0xFFd75252),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Center(
                          child: Text(
                            "Log out",
                            style: GoogleFonts.nunito(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildProfileItem(IconData icon, String text) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 5,
          ),
        ],
      ),
      child: Row(
        children: [
          Icon(icon, color: Colors.green),
          const SizedBox(width: 15),
          Text(
            text,
            style: GoogleFonts.nunito(
                fontSize: 14, fontWeight: FontWeight.w800, color: Colors.grey),
          ),
        ],
      ),
    );
  }
}
