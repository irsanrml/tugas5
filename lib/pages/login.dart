import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tugas5/colors.dart';
import 'package:tugas5/pages/profile.dart';
import 'package:tugas5/pages/register.dart';

class LoginPage extends StatefulWidget {
  const new({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  bool obsecure = true;

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  void _obsecurePass() {
    setState(() {
      obsecure = !obsecure;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Scaffold(
        body: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
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
                  'Hi, Silakan masuk untuk melanjutkan',
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
                        'assets/images/login.png',
                        fit: BoxFit.cover,
                      ),
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
                      color: AppColors.secondary,
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
                  controller: passwordController,
                  decoration: InputDecoration(
                    hintText: 'Password',
                    hintStyle: GoogleFonts.poppins(
                      fontSize: 14,
                      color: AppColors.secondary,
                    ),
                    suffixIcon: IconButton(
                      icon: Icon(
                        obsecure ? Icons.visibility : Icons.visibility_off,
                      ),
                      onPressed: _obsecurePass,
                    ),
                  ),
                  obscureText: obsecure,
                  keyboardType: TextInputType.visiblePassword,
                  validator: (value) {
                    if (value?.isEmpty == true) {
                      return 'Password tidak boleh kosong';
                    }
                    return null;
                  },
                  onChanged: (value) {
                    setState(() {});
                  },
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    GestureDetector(
                      onTap: () {},
                      child: Text(
                        'Lupa Password?',
                        style: GoogleFonts.poppins(fontSize: 14),
                      ),
                    ),
                  ],
                ),
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState?.validate() == true) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (_) => ProfilePage()),
                        //(_) => false,
                      );
                    }
                  },
                  child: Text(
                    'Masuk',
                    style: GoogleFonts.poppins(fontSize: 14),
                  ),
                ),
                Padding(padding: EdgeInsets.symmetric(vertical: 40)),
                RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    text: 'Belum punya akun? ',
                    style: GoogleFonts.poppins(fontSize: 14),
                    children: [
                      TextSpan(
                        text: 'Daftar',
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (_) => RegisterPage()),
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
                // Row(
                //   mainAxisAlignment: MainAxisAlignment.center,
                //   children: [
                //     Text(
                //       'Belum punya akun?',
                //       style: GoogleFonts.poppins(fontSize: 14),
                //     ),
                //     TextButton(
                //       onPressed: () {},
                //       child: Text(
                //         'Daftar',
                //         style: GoogleFonts.poppins(
                //           fontSize: 14,
                //           fontWeight: FontWeight.bold,
                //         ),
                //       ),
                //     ),
                //   ],
                // ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
