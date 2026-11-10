import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tugas5/colors.dart';
import 'package:tugas5/pages/login.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

class ProfilePage extends StatefulWidget {
  const new({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  Widget buildTile({required String label, String? tambahanText}) {
    return InkWell(
      onTap: () {},
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16),
        child: Row(
          spacing: 12,
          children: [
            Expanded(
              child: Text(
                label,
                style: GoogleFonts.poppins(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: AppColors.black,
                ),
              ),
            ),

            if (tambahanText != null)
              Text(
                tambahanText,
                style: GoogleFonts.poppins(
                  fontSize: 14,
                  color: AppColors.black,
                ),
              )
            else
              const Icon(LucideIcons.chevronRight),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Profile',
          style: TextStyle(
            color: AppColors.primary,
            fontFamily: GoogleFonts.poppins().fontFamily,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          spacing: 32,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 100,
                  child: ClipRRect(
                    borderRadius: BorderRadiusGeometry.circular(100),
                    child: Image.asset(
                      'assets/images/profile.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Text(
                  'Irsan Ramli',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w700,
                    fontSize: 16,
                    color: AppColors.primary,
                  ),
                ),
              ],
            ),
            Column(
              children: [
                buildTile(label: 'Ubah Profile'),
                Divider(height: 1, color: AppColors.secondary),
                buildTile(label: 'Perangkat Cetak'),
                Divider(height: 1, color: AppColors.secondary),
                buildTile(label: 'Bahasa'),
                Divider(height: 1, color: AppColors.secondary),
                buildTile(label: 'Informasi Aplikasi'),
                Divider(height: 1, color: AppColors.secondary),
                buildTile(
                  label: 'Layanan Pelanggan',
                  tambahanText: '08529260088',
                ),
              ],
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (_) => LoginPage()),
                  (_) => false,
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.danger,
              ),
              child: Text(
                'Keluar',
                style: GoogleFonts.poppins(
                  //fontWeight: FontWeight.normal,
                  fontSize: 14,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
      //   bottomNavigationBar: BottomNavigationBar(
      //     currentIndex: 3,
      //     items: [
      //       BottomNavigationBarItem(icon: Icon(LucideIcons.home), label: 'Home'),
      //       BottomNavigationBarItem(
      //         icon: Icon(LucideIcons.scanLine),
      //         label: 'Kasir',
      //       ),
      //       BottomNavigationBarItem(
      //         icon: Icon(LucideIcons.scrollText),
      //         label: 'Riwayat',
      //       ),
      //       BottomNavigationBarItem(
      //         icon: Icon(LucideIcons.user),
      //         label: 'Profile',
      //       ),
      //     ],
      //   ),
    );
  }
}
