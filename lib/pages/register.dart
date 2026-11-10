import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tugas5/colors.dart';
import 'package:tugas5/pages/homepage.dart';
import 'package:tugas5/pages/login.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _formKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  bool isAccept = false;
  bool obscure = true;

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Scaffold(
        appBar: AppBar(title: Text('Daftar')),
        body: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              spacing: 16,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  spacing: 4,
                  children: [
                    Text(
                      'Selamat Datang',
                      style: GoogleFonts.poppins(
                        fontSize: 24,
                        color: AppColors.primary,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.left,
                    ),
                    Text(
                      'Hi, buat akun baru',
                      style: GoogleFonts.poppins(
                        fontSize: 16,
                        color: AppColors.primary,
                      ),
                      textAlign: TextAlign.left,
                    ),
                    SizedBox(height: 12),
                    Column(
                      children: [
                        SizedBox(
                          width: 200,
                          height: 200,
                          child: Image.asset(
                            'assets/images/register.png',
                            fit: BoxFit.cover,
                          ),
                        ),
                        SizedBox(height: 12),
                        TextFormField(
                          controller: nameController,
                          decoration: InputDecoration(
                            hintText: 'Nama',
                            hintStyle: GoogleFonts.poppins(
                              fontSize: 14,
                              color: AppColors.secondary,
                            ),
                          ),
                          validator: (value) {
                            if (value != null) {
                              if (value.isEmpty) {
                                return 'Nama tidak boleh kosong!';
                              } else if (value.length < 3) {
                                return 'Nama minimal 3 karakter';
                              }
                            }

                            return null;
                          },
                        ),
                      ],
                    ),
                    SizedBox(height: 12),
                    TextFormField(
                      controller: emailController,
                      decoration: InputDecoration(
                        hintText: 'Email',
                        hintStyle: GoogleFonts.poppins(
                          fontSize: 14,
                          color: Colors.grey,
                        ),
                      ),
                      validator: (value) {
                        if (value?.isEmpty == true) {
                          return 'Email tidak boleh kosong';
                        }
                        return null;
                      },
                      onChanged: (value) {
                        setState(() {});
                      },
                    ),
                    SizedBox(height: 12),
                    TextFormField(
                      obscureText: obscure,
                      controller: passwordController,
                      decoration: InputDecoration(
                        hintText: 'Password',
                        hintStyle: GoogleFonts.poppins(
                          fontSize: 14,
                          color: Colors.grey,
                        ),
                        suffixIcon: const Icon(
                          Icons.keyboard_arrow_down,
                          color: AppColors.secondary,
                        ),
                      ),

                      // onChanged: (value) {
                      //  setState(() {});
                      //  },
                    ),
                    Row(
                      spacing: 8,
                      children: [
                        Checkbox(
                          value: isAccept,
                          onChanged: (value) {
                            setState(() {
                              isAccept = !isAccept;
                            });
                          },
                        ),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsetsGeometry.only(top: 12.0),
                            child: RichText(
                              text: TextSpan(
                                style: GoogleFonts.poppins(
                                  fontSize: 14,
                                  color: AppColors.black,
                                ),
                                children: [
                                  const TextSpan(
                                    text: 'Dengan menekan daftar anda setuju dengan ',
                                  ),
                                  TextSpan(
                                    text: 'Syarat dan Kebijakan',
                                    style: const TextStyle(
                                      color: AppColors.primary,
                                      fontWeight: FontWeight.w600,
                                    ),
                                    recognizer: TapGestureRecognizer()
                                      ..onTap = () {},
                                  ),
                                  const TextSpan(text: ' kami'),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState?.validate() == true) {
                          Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(builder: (_) => MainPage()),
                            (_) => false,
                          );
                        }
                      },
                      child: Text(
                        'Daftar',
                        style: GoogleFonts.poppins(fontSize: 14),
                      ),
                    ),
                    Padding(padding: EdgeInsets.symmetric(vertical: 40)),
                    RichText(
                      textAlign: TextAlign.center,
                      text: TextSpan(
                        text: 'Sudah punya akun? ',
                        style: GoogleFonts.poppins(fontSize: 14),
                        children: [
                          TextSpan(
                            text: 'Masuk',
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (_) => LoginPage(),
                                  ),
                                );
                              },
                            style: TextStyle(
                              color: AppColors.primary,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
