import 'package:flutter/material.dart';
import 'package:tiket/screens/dashboard_screen.dart';
import 'edit_profile.dart';

class ProfileNavPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile',style: TextStyle(color: Colors.white),),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => HomePage(),
              ),
            );
          },
        ),
        backgroundColor: Colors.blue,
      ),
      body: Container(
        color: Colors.blue,
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                CircleAvatar(
                  radius: 50,
                  backgroundImage: AssetImage('images/user.png'),
                ),
                SizedBox(height: 16),
                _buildTitle('Nama Pengguna'),
                _buildInfoItem('Reka Tea'),
                SizedBox(height: 8),
                _buildTitle('Email'),
                _buildInfoItem('rekatea@gmail.com'),
                SizedBox(height: 8),
                _buildTitle('Kontak'),
                _buildInfoItem('123-456-789'),
                SizedBox(height: 24),
                ElevatedButton.icon(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => EditProfilePage(),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Colors.white,
                    onPrimary: Colors.blue,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                  icon: Icon(Icons.edit),
                  label: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text(
                      'Edit Profile',
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTitle(String title) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Padding(
        padding: const EdgeInsets.only(bottom: 4),
        child: Text(
          title,
          style: TextStyle(fontSize: 16, color: Colors.white),
        ),
      ),
    );
  }

  Widget _buildInfoItem(String value) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.white),
        borderRadius: BorderRadius.circular(8),
      ),
      padding: EdgeInsets.all(8),
      margin: EdgeInsets.symmetric(vertical: 8),
      child: Text(
        value,
        style: TextStyle(fontSize: 14),
      ),
    );
  }
}
