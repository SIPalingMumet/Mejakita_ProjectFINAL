import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:static_mejakita/Utils/Hive_Box.dart';

class Sign extends StatefulWidget {
  const Sign({super.key});

  @override
  State<Sign> createState() => _SignState();
}

class _SignState extends State<Sign> {
  bool _obscurePassword = true;
  bool _obscureConfirmPassword = true;
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();

  void signUp() async {
    final name = _nameController.text;
    final phone = _phoneController.text;
    final email = _emailController.text;
    final password = _passwordController.text;
    final confirmPassword = _confirmPasswordController.text;

    // Validasi input
    if (!email.contains('@')) {
      _showError('Email harus menggunakan @');
      return;
    }
    if (!RegExp(r'^[0-9]+$').hasMatch(phone) || phone.length < 10) {
      _showError('Nomor telepon harus berupa angka dan minimal 10 digit');
      return;
    }
    if (password != confirmPassword) {
      _showError('Password dan Konfirmasi Password harus sama');
      return;
    }
    if (password.length < 8 || !RegExp(r'^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]+$').hasMatch(password)) {
      _showError('Password harus minimal 8 karakter dan mengandung kombinasi huruf dan angka');
      return;
    }

    // Simpan data ke Hive
    final box = HiveBoxes.getSavedDataBox();
    await box.put('name', name);
    await box.put('phone', phone);
    await box.put('email', email);
    await box.put('password', password);

    // Tampilkan pesan berhasil dan arahkan ke halaman login
    _showSuccess('Sign up berhasil! Silahkan login.');
    Navigator.of(context).pushReplacementNamed('/login');
  }

  void _showError(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message, style: TextStyle(color: Colors.white)), backgroundColor: Colors.red),
    );
  }

  void _showSuccess(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message, style: TextStyle(color: Colors.white)), backgroundColor: Colors.green),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  height: 400,
                  decoration: const BoxDecoration(
                    color: Color(0xFF4d9d75),
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(200),
                      bottomRight: Radius.circular(200),
                    ),
                  ),
                ),
                const SizedBox(height: 30),
                Padding(
                  padding: const EdgeInsets.only(top: 90),
                  child: Center(
                    child: Text(
                      "Sign Up",
                      style: GoogleFonts.nunito(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 180),
                  child: Container(
                    margin: const EdgeInsets.symmetric(horizontal: 20),
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 240, 240, 240),
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.1),
                          spreadRadius: 1,
                          blurRadius: 5,
                        ),
                      ],
                    ),
                    child: Column(
                      children: [
                        buildTextField(Icons.person_outline, "Nama Anda", _nameController),
                        const SizedBox(height: 20),
                        buildTextField(Icons.phone_outlined, "Nomor Telepon", _phoneController, isPhone: true),
                        const SizedBox(height: 20),
                        buildTextField(Icons.email_outlined, "Email", _emailController),
                        const SizedBox(height: 20),
                        buildPasswordTextField(Icons.lock_outline, "Password", _passwordController, true),
                        const SizedBox(height: 20),
                        buildPasswordTextField(Icons.lock_outline, "Konfirmasi Password", _confirmPasswordController, false),
                        const SizedBox(height: 80),
                        TextButton(
                          onPressed: signUp,
                          child: Container(
                            width: 100,
                            padding: const EdgeInsets.symmetric(vertical: 12),
                            decoration: BoxDecoration(
                              color: const Color(0xFFd75252),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: const Center(
                              child: Text(
                                "Sign up",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Center(
              child: Column(
                children: [
                  Text(
                    "Punya Akun?",
                    style: GoogleFonts.nunito(
                      fontSize: 14,
                      fontWeight: FontWeight.w800,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(height: 5),
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).pushReplacementNamed('/login');
                    },
                    child: Text(
                      "Log in",
                      style: GoogleFonts.nunito(
                        color: const Color(0xFF4d9d75),
                        fontWeight: FontWeight.w800,
                        fontSize: 12,
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

  Widget buildTextField(IconData icon, String hintText, TextEditingController controller, {bool isPhone = false}) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
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
          Expanded(
            child: TextField(
              controller: controller,
              keyboardType: isPhone ? TextInputType.phone : TextInputType.text,
              decoration: InputDecoration(
                hintText: hintText,
                border: InputBorder.none,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildPasswordTextField(IconData icon, String hintText, TextEditingController controller, bool isPasswordField) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
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
          Expanded(
            child: TextField(
              controller: controller,
              obscureText: isPasswordField ? _obscurePassword : _obscureConfirmPassword,
              decoration: InputDecoration(
                hintText: hintText,
                border: InputBorder.none,
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              setState(() {
                if (isPasswordField) {
                  _obscurePassword = !_obscurePassword;
                } else {
                  _obscureConfirmPassword = !_obscureConfirmPassword;
                }
              });
            },
            child: Icon(
              (isPasswordField ? _obscurePassword : _obscureConfirmPassword) ? Icons.visibility : Icons.visibility_off,
              color: Colors.grey,
            ),
          ),
        ],
      ),
    );
  }
}
