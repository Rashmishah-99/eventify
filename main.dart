import 'package:eventify/bookings_page.dart';
import 'package:eventify/bookvenue.dart';
import 'package:eventify/change_password.dart';
import 'package:eventify/decoration.dart';
import 'package:eventify/edit_profile.dart';
import 'package:eventify/eventify.dart' hide EventifyHome;
import 'package:eventify/favourites_page.dart';
import 'package:eventify/food.dart';
import 'package:eventify/help_support.dart';
import 'package:eventify/homepage.dart';
import 'package:eventify/login.dart';
import 'package:eventify/payments_screen.dart';
import 'package:eventify/personal_information.dart';
import 'package:eventify/privacy_security.dart';
import 'package:eventify/profile.dart';
import 'package:eventify/profile_page.dart';
import 'package:eventify/register.dart';
import 'package:eventify/reset_password.dart';
import 'package:eventify/welcomepage.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a purple toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),

      // home: FlutterApp(),
      debugShowCheckedModeBanner: false,

      // initialRoute: '/login',
      routes: {
        '/login': (context) => const LoginPage(),
        '/signup': (context) => const RegisterPage(),
        // '/forgot_password': (context) => const ForgotPasswordPage(),
        // '/verify_otp': (context) => const VerifyOtpPage(),
        '/reset_password': (context) => const ResetPasswordPage(),
        '/booking': (context) => const BookingsPage(),
        '/welcome': (context) => const WelcomePage(),
        '/home': (context) => const EventifyHome(),
        // '/search': (context) => const SearchScreen(),
        '/favourites': (context) => const FavouritesPage(),
        '/profile': (context) => const ProfilePage(),
        '/edit_profile': (context) => const EditProfilePage(),
        '/venue_booking': (context) => const VenueBookingPage(),
      },
      // home: const SplashToWelcome(),
      // home: EditProfilePage(),
      // home: DecorationsPage(),
      // home: VenueBookingPage(),
      // home: ProfilePages(),
      // home: PersonalInformationScreen(),
      // home: PrivacySecurityScreen(),
      // home: PaymentsScreen(),
      // home: HelpSupportScreen(),
      // home: FavouritesPage(),
      home: FoodPage(),
    );
  }
}

// Add this widget to handle splash -> welcome navigation
class SplashToWelcome extends StatefulWidget {
  const SplashToWelcome({super.key});

  @override
  State<SplashToWelcome> createState() => _SplashToWelcomeState();
}

class _SplashToWelcomeState extends State<SplashToWelcome> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 2), () {
      Navigator.pushReplacementNamed(context, '/welcome');
    });
  }

  @override
  Widget build(BuildContext context) {
    return const WelcomePage(); // Your logo.dart screen
  }
}



      // home: WelcomePage(),
      // home: RegisterPage(),
      // home: ResetPasswordPage(),
      // home: HomePage(),
      // home: LoginPage(),
      // home: EventifyHome(),
      // home: EventifyHome(),
      // home: ChangePasswordPage(),
      // home: EditProfilePage(),

