import 'package:flutter/material.dart';
import 'pages/vip_car_listing_page.dart';
import 'pages/normal_car_listing_page.dart';
import 'pages/login_page.dart';
import 'pages/home.dart';
import 'pages/vip_home.dart';
import 'pages/visit_requests_screen.dart';
import 'pages/payment_status_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Car Listings',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const NavigationHomePage(),
    );
  }
}

class NavigationHomePage extends StatelessWidget {
  const NavigationHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Car Listings'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const VipCarListingPage()),
                );
              },
              child: const Text('VIP Car Listing'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const NormalCarListingPage()),
                );
              },
              child: const Text('Normal Car Listing'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const VisitRequestsScreen()),
                );
              },
              child: const Text('Visit Requests'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const PaymentStatusScreen()),
                );
              },
              child: const Text('Payment Status'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const LoginPage()),
                );
              },
              child: const Text('Login'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const HomePage()),
                );
              },
              child: const Text('Home'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const VIPhome()),
                );
              },
              child: const Text('VIP Home'),
            ),
          ],
        ),
      ),
    );
  }
}