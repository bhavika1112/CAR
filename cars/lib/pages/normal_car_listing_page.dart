import 'package:flutter/material.dart';
import 'car_listing_base.dart';

class NormalCarListingPage extends StatelessWidget {
  const NormalCarListingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return CarListingBase(
      smallImages: ['assets/View 1.png', 'assets/View 2.png', 'assets/View 3.png'],
      mainImage: "assets/normal.png",
      descriptionPoints: [
        'Beautifully maintained Aston Martin DB11 featuring a petrol-powered 4.0 L twin-turbo V8 engine and 8-speed automatic transmission.',
        'Single owner, driven just 16,000 km, with 2+2 seating (4-seater grand tourer) in excellent condition.',
        'Recently serviced with brand-new tires and battery, and full authorized service history available.',
        'No accident history; interior and exterior meticulously cared for.',
        'Combines luxury and performance, offering a 0-100 km/h time of under 4 seconds and a top speed over 300 km/h.',
        'A perfect grand touring coupe for long drives and refined city cruising.',
      ],
    );
  }
}