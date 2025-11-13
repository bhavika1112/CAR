import 'package:flutter/material.dart';
import 'car_listing_base.dart';

class VipCarListingPage extends StatelessWidget {
  const VipCarListingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return CarListingBase(
      smallImages: ['assets/Car.png', 'assets/View 6.png', 'assets/View 5.png'],
      mainImage: "assets/vip.png",
      descriptionPoints: [
        'Exquisite Aston Martin DB11 featuring a 4.0 L twin-turbo V8 engine paired with an 8-speed automatic transmission.',
        'Single owner, driven only 16,000 km, finished in pristine condition inside and out.',
        '2+2 grand tourer design offering a perfect balance of comfort and performance.',
        '0-100 km/h in around 4.0 seconds with a top speed of up to 300 km/h.',
        'Rear-wheel drive, adaptive suspension, and drive mode selector for dynamic control.',
        'Luxurious hand-crafted interior with premium leather, brushed aluminium trim, and advanced infotainment system.',
        'Recently serviced, with new tyres and a full authorized service record.',
        'No accident history, meticulously maintained and regularly detailed.',
        'A true British luxury GT, ideal for high-speed touring and city cruising alike.',
      ],
      isVip: true,
    );
  }
}