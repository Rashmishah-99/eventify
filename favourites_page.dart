import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class FavouritesPage extends StatefulWidget {
  const FavouritesPage({super.key});

  @override
  State<FavouritesPage> createState() => _FavouritesPageState();
}

class _FavouritesPageState extends State<FavouritesPage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  bool isLoggedIn = true;
  List<Map<String, String>> favourites = [];
  bool _isHovering = false;

  @override
  void initState() {
    super.initState();
    checkLoginStatus();
  }

  void checkLoginStatus() async {
    bool loggedIn = await checkIfUserIsLoggedIn();
    setState(() {
      isLoggedIn = loggedIn;
    });

    if (loggedIn) {
      loadFavourites();
    }
  }

  Future<bool> checkIfUserIsLoggedIn() async {
    return true;
  }

  void loadFavourites() {
    setState(() {
      favourites = [];
    });
  }

  void navigateToBrowse() {
    print("Navigate to browse");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: Colors.grey[50],
      body: isLoggedIn
          ? (favourites.isEmpty
                ? _buildEmptyFavourites()
                : _buildFavouritesList())
          : _buildLoginPrompt(),
      bottomNavigationBar: _buildBottomNavigationBar(),
    );
  }

  Widget _buildLoginPrompt() {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _buildHeartWithCalendarIcon(heartSize: 64),
            const SizedBox(height: 20),
            Text(
              'Please login to view your favourites',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w500,
                color: Colors.grey[700],
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 30),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF1CCFCF),
                padding: const EdgeInsets.symmetric(
                  horizontal: 40,
                  vertical: 15,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
              child: const Text(
                'Login',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildEmptyFavourites() {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Heart with calendar icon inside
            _buildHeartWithCalendarIcon(heartSize: 100),
            const SizedBox(height: 16),
            const Text(
              'No favourites yet',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.w600,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 12),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              child: Text(
                'Start browsing and add your favourite venues, mandaps, decorations and more to your list',
                style: TextStyle(fontSize: 16, color: Colors.grey),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(height: 30),
            // Browse Now button with hover effect
            MouseRegion(
              onEnter: (_) => setState(() => _isHovering = true),
              onExit: (_) => setState(() => _isHovering = false),
              child: ElevatedButton(
                onPressed: navigateToBrowse,
                style: ElevatedButton.styleFrom(
                  backgroundColor: _isHovering
                      ? Colors.white
                      : const Color(0xFF8F5CFF),
                  foregroundColor: _isHovering
                      ? const Color(0xFF8F5CFF)
                      : Colors.white,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 40,
                    vertical: 15,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                    side: BorderSide(
                      color: const Color(0xFF8F5CFF),
                      width: _isHovering ? 2 : 0,
                    ),
                  ),
                  elevation: _isHovering ? 0 : 4,
                ),
                child: const Text(
                  'Browse Now',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHeartWithCalendarIcon({required double heartSize}) {
    return SizedBox(
      width: heartSize,
      height: heartSize,
      child: Stack(
        alignment: Alignment.center,
        children: [
          // Thicker heart outline
          FaIcon(
            FontAwesomeIcons.heart,
            size: heartSize,
            color: const Color(0xFFFF4500), // Orange-red color
          ),
          // Calendar icon inside - fixed size regardless of heart size
          const Icon(
            Icons.calendar_month,
            size: 36, // Fixed size that doesn't change with heart size
            color: Color(0xFF8F5CFF), // Purple color
          ),
        ],
      ),
    );
  }

  Widget _buildFavouritesList() {
    return const Center(child: Text("Favourites list would appear here"));
  }

  BottomNavigationBar _buildBottomNavigationBar() {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      selectedItemColor: const Color(0xFF8F5CFF),
      unselectedItemColor: const Color(0xFF757575),
      currentIndex: 3,
      onTap: (index) {
        // Navigation logic
      },
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
    );
  }
}
