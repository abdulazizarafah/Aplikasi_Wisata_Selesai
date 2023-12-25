import 'package:flutter/material.dart';
import 'package:tiket/Screens/photo_spot_detail_page.dart';
import 'package:tiket/constants.dart';
import 'package:tiket/models/spot_data.dart';

class PhotoSpotsPage extends StatelessWidget {
  final List<PhotoSpot> photoSpots = photoSpotsData;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tempat Foto', style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.blue,
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/hal1.jpeg'), // Ganti dengan path gambar yang diinginkan
            fit: BoxFit.cover,
          ),
        ),
        child: ListView.builder(
          itemCount: photoSpots.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                _navigateToPhotoSpotDetail(context, photoSpots[index]);
              },
              child: _buildPhotoSpotCard(photoSpots[index]),
            );
          },
        ),
      ),
    );
  }

  Widget _buildPhotoSpotCard(PhotoSpot photoSpot) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.vertical(top: Radius.circular(8)),
            child: Image.asset(
              photoSpot.imagePath,
              width: double.infinity,
              height: 150,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  photoSpot.name,
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 8),
                Text(
                  photoSpot.description,
                  style: TextStyle(fontSize: 16),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void _navigateToPhotoSpotDetail(BuildContext context, PhotoSpot photoSpot) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => PhotoSpotDetailPage(photoSpot),
      ),
    );
  }
}
