import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:carousel_slider/carousel_slider.dart';

// Import your new pages
import 'search_page.dart';
import 'bookings_page.dart';
import 'favourites_page.dart';
import 'profile_page.dart';
import 'booking_details_page.dart';

class EventifyHome extends StatefulWidget {
  const EventifyHome({Key? key}) : super(key: key);

  @override
  State<EventifyHome> createState() => _EventifyHomeState();
}

class _EventifyHomeState extends State<EventifyHome> {
  final List<Map<String, String>> _bannerImages = [
    {
      'image': 'assets/images/banner1.jpg',
      'title': 'BOOK YOUR EVENTS',
      'subtitle': 'Your personal event planner in your pocket',
      'button': 'Plan in Ten Minutes',
    },
    {
      'image': 'assets/images/banner2.jpg',
      'title': 'FIND THE BEST VENUES',
      'subtitle': 'Discover top-rated spaces near you',
      'button': 'Browse Venues',
    },
    {
      'image': 'assets/images/banner3.jpg',
      'title': 'MAKE MEMORIES',
      'subtitle': 'Capture every moment of your big day',
      'button': 'Start Planning',
    },
  ];

  int _currentBanner = 0;
  int _selectedIndex = 0;

  bool _isDrawerOpen = false;

  final List<Widget> _pages = const [
    SizedBox(), // Home
    SearchPage(),
    BookingsPage(),
    FavouritesPage(),
    ProfilePage(),
  ];

  void _onBottomNavTap(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void _toggleDrawer() {
    setState(() {
      _isDrawerOpen = !_isDrawerOpen;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: RichText(
          text: const TextSpan(
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            children: [
              TextSpan(
                text: 'E',
                style: TextStyle(color: Color(0xFF23223A)),
              ),
              TextSpan(
                text: 'v',
                style: TextStyle(color: Color(0xFF1CCFCF)),
              ),
              TextSpan(
                text: 'entify',
                style: TextStyle(color: Color(0xFF23223A)),
              ),
            ],
          ),
        ),
        actions: [
          IconButton(
            icon: Icon(
              _isDrawerOpen ? Icons.close : Icons.menu,
              color: Colors.black87,
            ),
            onPressed: _toggleDrawer,
          ),
        ],
      ),

      body: Column(
        children: [
          // ✅ Top Drawer slides down
          AnimatedContainer(
            duration: const Duration(milliseconds: 400),
            curve: Curves.easeInOut,
            height: _isDrawerOpen ? 220 : 0,
            width: double.infinity,
            decoration: const BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.black26,
                  blurRadius: 6,
                  offset: Offset(0, 3),
                ),
              ],
            ),
            child: _isDrawerOpen
                ? Column(
                    children: [
                      _drawerItem(Icons.settings, "Settings", () {}),
                      _drawerItem(Icons.help, "Help", () {}),
                      _drawerItem(Icons.info, "About Us", () {}),
                      _drawerItem(Icons.logout, "Logout", () {}),
                    ],
                  )
                : null,
          ),

          // ✅ Page Content (Home or Other)
          Expanded(
            child: _selectedIndex == 0
                ? _buildHomeBody()
                : _pages[_selectedIndex],
          ),
        ],
      ),

      // ✅ Bottom Navigation
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        selectedItemColor: const Color(0xFF8F5CFF),
        unselectedItemColor: const Color.fromARGB(255, 73, 73, 73),
        currentIndex: _selectedIndex,
        onTap: _onBottomNavTap,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Search'),
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_month),
            label: 'Bookings',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite_border),
            label: 'Favourites',
          ),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
      ),
    );
  }

  /// Drawer Item Builder
  Widget _drawerItem(IconData icon, String title, VoidCallback onTap) {
    return ListTile(
      leading: Icon(icon, color: Colors.black87),
      title: Text(title, style: const TextStyle(fontSize: 16)),
      onTap: () {
        _toggleDrawer();
        onTap();
      },
    );
  }

  /// ---------------- Home Body ----------------
  Widget _buildHomeBody() {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // ✅ Carousel Banner
          CarouselSlider.builder(
            itemCount: _bannerImages.length,
            itemBuilder: (context, index, realIndex) {
              final banner = _bannerImages[index];
              return Stack(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(16),
                    child: Image.asset(
                      banner['image']!,
                      fit: BoxFit.cover,
                      width: double.infinity,
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      gradient: LinearGradient(
                        colors: [
                          Colors.black.withOpacity(0.6),
                          Colors.transparent,
                        ],
                        begin: Alignment.bottomCenter,
                        end: Alignment.topCenter,
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 40,
                    left: 20,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          banner['title']!,
                          style: GoogleFonts.poppins(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 6),
                        Text(
                          banner['subtitle']!,
                          style: GoogleFonts.poppins(
                            color: Colors.white70,
                            fontSize: 14,
                          ),
                        ),
                        const SizedBox(height: 12),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFF8F5CFF),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          onPressed: () {},
                          child: Text(banner['button']!),
                        ),
                      ],
                    ),
                  ),
                ],
              );
            },
            options: CarouselOptions(
              height: 220,
              autoPlay: true,
              enlargeCenterPage: true,
              viewportFraction: 0.9,
              onPageChanged: (index, reason) {
                setState(() => _currentBanner = index);
              },
            ),
          ),

          const SizedBox(height: 10),

          // ✅ Carousel Indicator
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: _bannerImages.asMap().entries.map((entry) {
              return Container(
                width: 8,
                height: 8,
                margin: const EdgeInsets.symmetric(horizontal: 4),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: _currentBanner == entry.key
                      ? const Color(0xFF8F5CFF)
                      : Colors.grey.shade300,
                ),
              );
            }).toList(),
          ),

          const SizedBox(height: 20),

          // ✅ Example Venue Section
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Text(
              "Popular Venues",
              style: GoogleFonts.poppins(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(height: 12),

          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              children: const [
                _CardBase(
                  image: 'assets/images/venue1.jpg',
                  name: 'Royal Palace',
                  location: 'New Delhi',
                  price: '₹50,000',
                  halls: '3 Halls',
                  capacity: '500 People',
                ),
                _CardBase(
                  image: 'assets/images/venue2.jpg',
                  name: 'Grand Banquet',
                  location: 'Mumbai',
                  price: '₹75,000',
                  halls: '5 Halls',
                  capacity: '1000 People',
                ),
              ],
            ),
          ),
          const SizedBox(height: 30),
        ],
      ),
    );
  }
}

// ---------------- Helper Card ----------------
class _CardBase extends StatelessWidget {
  final String image, name, location, price, halls, capacity;
  const _CardBase({
    required this.image,
    required this.name,
    required this.location,
    required this.price,
    required this.halls,
    required this.capacity,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      margin: const EdgeInsets.only(right: 16),
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
        clipBehavior: Clip.antiAlias,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              image,
              width: double.infinity,
              height: 100,
              fit: BoxFit.cover,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                    ),
                  ),
                  Text(
                    location,
                    style: const TextStyle(color: Colors.grey, fontSize: 13),
                  ),
                  const SizedBox(height: 6),
                  Text("Price: $price", style: const TextStyle(fontSize: 13)),
                  Text("Halls: $halls", style: const TextStyle(fontSize: 13)),
                  Text(
                    "Capacity: $capacity",
                    style: const TextStyle(fontSize: 13),
                  ),
                  const SizedBox(height: 10),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFFF48FB1),
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        padding: const EdgeInsets.symmetric(vertical: 8),
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const BookingDetailsPage(),
                          ),
                        );
                      },
                      child: const Text('Book Now'),
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
}
