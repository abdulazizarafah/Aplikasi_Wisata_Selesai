import 'package:flutter/material.dart';
import 'ticket_page.dart';
import 'location_page.dart';
import 'photo_spots_page.dart';
import 'restaurants_page.dart';
import 'hotel_page.dart';
import 'drawer_widget.dart';
import 'notification_page.dart';
import 'profile_nav_page.dart';
import 'history_page.dart';
import 'ticket_info_page.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;

  final List<Widget> pages = [
    TicketPage(),
    LocationPage(),
    PhotoSpotsPage(),
    RestaurantsPage(),
    HotelPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Halaman Utama',
          style: TextStyle(color: Colors.white),
        ),
        iconTheme: IconThemeData(color: Colors.white),
        backgroundColor: Colors.blue,
      ),
      drawer: DrawerWidget(),
      body: Stack(
        children: [
          // Background image
          Image.asset(
            'assets/images/hal1.jpeg', // Replace with your image path
            fit: BoxFit.cover,
            width: double.infinity,
            height: double.infinity,
          ),
          Container(
            color: Colors.transparent, // Make the container transparent
            child: Column(
              children: [
                // Rest of your content goes here
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Padding(
                    padding: EdgeInsets.all(10),
                    child: Row(
                      children: [
                        _buildHomeButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => TicketPage(),
                              ),
                            );
                          },
                          text: 'Tiket',
                          imagePath: 'images/ticket.png',
                        ),
                        SizedBox(width: 20),
                        _buildHomeButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => LocationPage(),
                              ),
                            );
                          },
                          text: 'Lokasi',
                          imagePath: 'images/location.png',
                        ),
                        SizedBox(width: 20),
                        _buildHomeButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => PhotoSpotsPage(),
                              ),
                            );
                          },
                          text: 'Spot Foto',
                          imagePath: 'images/camera.png',
                        ),
                        SizedBox(width: 20),
                        _buildHomeButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => RestaurantsPage(),
                              ),
                            );
                          },
                          text: 'Restoran',
                          imagePath: 'images/restaurant.png',
                        ),
                        SizedBox(width: 20),
                        _buildHomeButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => HotelPage(),
                              ),
                            );
                          },
                          text: 'Hotel',
                          imagePath: 'images/hotel.png',
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  child: Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          SizedBox(height: 16),
                          RestaurantCard(
                            name: 'Trending Hotel',
                            cuisine: 'Penginapan',
                            rating: 4.5,
                            imagePath: 'images/hotel1.jpg',
                          ),
                          SizedBox(height: 16),
                          RestaurantCard(
                            name: 'Trending Restoran',
                            cuisine: 'Restoran',
                            rating: 4.7,
                            imagePath: 'images/resto1.jpg',
                          ),
                          SizedBox(height: 16),
                          RestaurantCard(
                            name: 'Tranding Spot Foto',
                            cuisine: 'Spot Foto',
                            rating: 4.7,
                            imagePath: 'images/gambar1.jpg',
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.blue,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white,
        elevation: 4,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
          switch (index) {
            case 0:
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => HistoryPage()),
              );
              break;
            case 1:
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => NotificationPage()),
              );
              break;
            case 2:
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => TicketInfoPage()),
              );
              break;
            case 3:
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => ProfileNavPage()),
              );
              break;
          }
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.history),
            label: 'History',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications),
            label: 'Notification',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.confirmation_number),
            label: 'Tiket',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}

Widget _buildHomeButton({
  required VoidCallback onPressed,
  required String text,
  required String imagePath,
}) {
  return Container(
    height: 100,
    width: 75,
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(10), // Set background color to white
    ),
    child: InkWell(
      onTap: onPressed,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ImageFiltered(
            imageFilter: ColorFilter.mode(
              Colors.blue,
              BlendMode.srcIn,
            ),
            child: Image.asset(
              imagePath,
              height: 30, // Set the height of the image as needed
              width: 30, // Set the width of the image as needed
            ),
          ),
          SizedBox(height: 5),
          Text(
            text,
            style: TextStyle(color: Colors.blue),
          ),
        ],
      ),
    ),
  );
}
