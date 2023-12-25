import 'package:flutter/material.dart';
import 'package:tiket/Screens/log_screen.dart';
import 'package:tiket/constants.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Column(
        children: [
          Container(
            width: screenWidth,
            height: screenHeight,
            child: Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.asset(
                    'images/splash_bg.jpg',
                    fit: BoxFit.cover,
                    width: screenWidth,
                    height: screenHeight,
                  ),
                ),
                Positioned(
                  top: screenHeight * 0.7,
                  left: 0,
                  child: Container(
                    width: screenWidth,
                    height: screenHeight * 0.3,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10),
                        topRight: Radius.circular(10),
                      ),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(
                              top: 10), // Jarak atas untuk teks pertama
                          child: Text(
                            'Jayanti Beach Explorer',
                            style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                              color: primaryColor,
                            ),
                          ),
                        ),
                        SizedBox(
                            height: 5), // Jarak antara teks pertama dan kedua
                        Padding(
                          padding: EdgeInsets.only(
                              bottom: 10), // Jarak bawah untuk teks kedua
                          child: Text(
                            'Pengalaman Terbaik Berwisata Dipantai Jayanti',
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.black,
                            ),
                          ),
                        ),
                        SizedBox(
                            height: 10), // Jarak antara teks kedua dan tombol
                        ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => LoginScreen()),
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            primary: Color.fromARGB(255, 54, 184, 207),
                            onPrimary: Colors.white,
                            padding: EdgeInsets.symmetric(
                                horizontal: 100, vertical: 15),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(
                                  10.0), // Sesuaikan nilai radius sesuai keinginan Anda.
                            ),
                          ),
                          child: Text('Mulai'),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
