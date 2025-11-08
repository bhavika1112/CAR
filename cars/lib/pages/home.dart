import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'preownedly',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: const Color(0xFFE53935),
        scaffoldBackgroundColor: const Color(0xFFFAFAFA),
        fontFamily: 'Roboto',
      ),
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildHeroSection(),
            _buildHowItWorks(),
            _buildPartnerBrands(),
            _buildBenefits(),
            _buildPopularBrands(context),
            _buildExploreVehicles(),
            _buildPopularCars(),
            _buildSellBuySection(),
            _buildRecommendationCars(),
            _buildTestimonials(),
            _buildCarNews(),
            const SizedBox(height: 20),
          ],
        ),
      ),
      bottomNavigationBar: _buildBottomNav(),
    );
  }

  Widget _buildHeroSection() {
    return Container(
      height: 280,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/Container.png'),
          fit: BoxFit.cover,
          colorFilter: ColorFilter.mode(
            Colors.black.withOpacity(0.3),
            BlendMode.darken,
          ),
        ),
      ),
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'preownedly',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  fontFamily: 'Oswald',
                ),
              ),
              const Spacer(),
              const Text(
                'Buy and Sell Used Cars\nDirectly - Safely and\nSeamlessly',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                  fontWeight: FontWeight.w500,
                  height: 1.2,
                  fontFamily: 'Oswald',
                ),
              ),
              const SizedBox(height: 20),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Row(
                  children: const [
                    Icon(Icons.search, color: Colors.grey),
                    SizedBox(width: 8),
                    Expanded(
                      child: Text(
                        'Search City, Brand, Price Range...',
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 12,
                          fontFamily: 'Oswald',
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 12),
              Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFFE53935),
                        padding: const EdgeInsets.symmetric(vertical: 14),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      child: const Text(
                        'Sell Your Car',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: Colors.white,
                          fontFamily: 'Oswald',
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(vertical: 14),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      child: const Text(
                        'Find Your Car',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: Colors.black87,
                          fontFamily: 'Oswald',
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHowItWorks() {
    return Container(
      padding: const EdgeInsets.all(20),
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'How It Works',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
              fontFamily: 'Oswald',
            ),
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _buildStep(Icons.search, 'Search Cars'),
              _buildStep(Icons.calendar_today, 'Book Visit / Buy Now'),
              _buildStep(Icons.payment, 'Pay via Escrow'),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildStep(IconData icon, String label) {
    return Column(
      children: [
        Container(
          width: 60,
          height: 60,
          decoration: BoxDecoration(
            color: const Color(0xFFFFE4FB),
            shape: BoxShape.circle,
          ),
          child: Icon(icon, color: const Color(0xFFE53935), size: 28),
        ),
        const SizedBox(height: 8),
        SizedBox(
          width: 80,
          child: Text(
            label,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 12,
              fontFamily: 'Poppins',
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildPartnerBrands() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
      color: Colors.white,
      child: Center(
        child: Image.asset(
          'assets/Frame 1984078153.png',
          fit: BoxFit.contain,
        ),
      ),
    );
  }

  Widget _buildBenefits() {
    return Container(
      padding: const EdgeInsets.all(20),
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Benefits',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
              fontFamily: 'Oswald',
            ),
          ),
          const SizedBox(height: 20),
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 3.5,
              crossAxisSpacing: 16,
              mainAxisSpacing: 16,
            ),
            itemCount: 4,
            itemBuilder: (context, index) {
              final benefits = [
                {
                  'icon': Icons.people_alt_outlined,
                  'title': 'Peer to Peer',
                  'color': Color(0xFFE53935),
                },
                {
                  'icon': Icons.security_outlined,
                  'title': 'Escrow Secured\nPayments',
                  'color': Color(0xFF2196F3),
                },
                {
                  'icon': Icons.psychology_outlined,
                  'title': 'AI Trust Score',
                  'color': Color(0xFF4CAF50),
                },
                {
                  'icon': Icons.verified_user_outlined,
                  'title': 'Verified Seller\nProfiles',
                  'color': Color(0xFFFF9800),
                },
              ];
              
              return _buildBenefitItem(
                benefits[index]['icon'] as IconData,
                benefits[index]['title'] as String,
                benefits[index]['color'] as Color,
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _buildBenefitItem(IconData icon, String title, Color color) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: color.withOpacity(0.2)),
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: color,
              shape: BoxShape.circle,
            ),
            child: Icon(icon, color: Colors.white, size: 20),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              title,
              style: const TextStyle(
                fontSize: 10,
                fontWeight: FontWeight.w500,
                fontFamily: 'Inter',
                color: Colors.black87,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPopularBrands(BuildContext context) {
  final brands = [
    {'name': 'Maruti Suzuki', 'count': '60+ Cars', 'image': 'assets/home/image.png'},
    {'name': 'Hyundai', 'count': '45+ Cars', 'image': 'assets/home/hyundai.png'},
    {'name': 'Kia', 'count': '30+ Cars', 'image': 'assets/home/image-1.png'},
    {'name': 'Honda', 'count': '40+ Cars', 'image': 'assets/home/image 12.png'},
    {'name': 'Tata', 'count': '50+ Cars', 'image': 'assets/home/image-2.png'},
    {'name': 'Ford', 'count': '25+ Cars', 'image': 'assets/home/image-3.png'},
    {'name': 'Toyota', 'count': '42+ Cars', 'image': 'assets/home/image-6.png'},
    {'name': 'Volkswagen', 'count': '20+ Cars', 'image': 'assets/home/image-4.png'},
    {'name': 'Renault', 'count': '28+ Cars', 'image': 'assets/home/image-5.png'},
  ];

  return Container(
    padding: const EdgeInsets.all(20),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Explore Car By Popular Brands',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
            fontFamily: 'Oswald',
          ),
        ),
        const SizedBox(height: 16),
        GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 4,
            childAspectRatio: 1,
            crossAxisSpacing: 12,
            mainAxisSpacing: 12,
          ),
          itemCount: brands.length,
          itemBuilder: (context, index) {
            return _buildBrandCard(
              brands[index]['name']!,
              brands[index]['count']!,
              brands[index]['image']!, // Pass the image path
            );
          },
        ),
          const SizedBox(height: 16),
          Row(
            children: [
              Expanded(
                child: OutlinedButton(
                  onPressed: () {},
                  style: OutlinedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 14),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    side: const BorderSide(color: Colors.grey),
                  ),
                  child: const Text(
                    'Via Brand',
                    style: TextStyle(color: Colors.black87),
                  ),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: OutlinedButton(
                  onPressed: () {},
                  style: OutlinedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 14),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    side: const BorderSide(color: Colors.grey),
                  ),
                  child: const Text(
                    'Via Seller',
                    style: TextStyle(color: Colors.black87),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildBrandCard(String name, String count, String imagePath) {
  return Container(
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(8),
      boxShadow: [
        BoxShadow(
          color: Colors.grey.withOpacity(0.1),
          spreadRadius: 1,
          blurRadius: 3,
        ),
      ],
    ),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: 40,
          height: 40,
          decoration: BoxDecoration(
            color: Colors.grey[100],
            borderRadius: BorderRadius.circular(8),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.asset(
              imagePath,
              width: 40,
              height: 40,
              fit: BoxFit.contain,
              errorBuilder: (context, error, stackTrace) {
                return Icon(Icons.directions_car, size: 28, color: Colors.grey[600]);
              },
            ),
          ),
        ),
        const SizedBox(height: 4),
        Text(
          name,
          style: const TextStyle(
            fontSize: 10,
            fontFamily: 'Poppins',
            fontWeight: FontWeight.w500,
          ),
          textAlign: TextAlign.center,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
        ),
        Text(
          count,
          style: const TextStyle(
            fontSize: 7.8,
            fontFamily: 'Inter',
            color: Color(0xFF6F66B0),
          ),
          textAlign: TextAlign.center,
        ),
      ],
    ),
  );
}

  Widget _buildExploreVehicles() {
    return Container(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Center(
              child: Image.asset(
                'assets/vipseller.png',
                fit: BoxFit.contain,
              ),
            ),
          ],
        ),
    


          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Explore All Vehicles',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  fontFamily: 'Oswald',
                ),
              ),
              TextButton(
                onPressed: () {},
                child: const Text(
                  'View All',
                  style: TextStyle(color: Color(0xFFE53935)),
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          SizedBox(
            height: 140,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                _buildVehicleCard(
                  'Tesla Model S',
                  '₹65,00,000',
                  'Electric performance sedan',
                  'assets/Rectangle 24.png',
                ),
                _buildVehicleCard(
                  'Sporty Convertible',
                  '₹65,00,000',
                  'Audi e-tron',
                  'assets/Rectangle 25.png',
                ),
                _buildVehicleCard(
                  'BMW X5',
                  '₹75,00,000',
                  'Luxury SUV',
                  'assets/Rectangle 22.png',
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildVehicleCard(String name, String price, String description, String imagePath) {
    return Container(
      width: 180,
      margin: const EdgeInsets.only(right: 12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        image: DecorationImage(
          image: AssetImage(imagePath),
          fit: BoxFit.cover,
          colorFilter: ColorFilter.mode(
            Colors.black.withOpacity(0.3),
            BlendMode.darken,
          ),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text(
              name,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 9.81,
                fontWeight: FontWeight.w600,
                fontFamily: 'Inter',
              ),
            ),
            Text(
              description,
              style: const TextStyle(
                color: Colors.white70,
                fontSize: 9.81,
                fontWeight: FontWeight.w500,
                fontFamily: 'Inter',
              ),
            ),
            const SizedBox(height: 4),
            Text(
              price,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 9.81,
                fontWeight: FontWeight.w600,
                fontFamily: 'Inter',
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPopularCars() {
    return Container(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Popular Car',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  fontFamily: 'Oswald',
                ),
              ),
              TextButton(
                onPressed: () {},
                child: const Text(
                  'View All',
                  style: TextStyle(color: Color(0xFFE53935)),
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          SizedBox(
            height: 230,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                _buildCarCard(
                  '2018 LEXUS RX350L',
                  'LUXURY',
                  '₹61,990',
                  '45,600 km • Automatic',
                  'est. ₹304/wk based on 10.02% p.a.',
                  'assets/104058_XC_02.jpg.png',
                ),
                _buildCarCard(
                  '2019 TOYOTA RAV4',
                  'GX (2WD) HYBRID NAV',
                  '₹42,990',
                  '54,950 km • Automatic',
                  'est. ₹272/wk based on 10.02% p.a.',
                  'assets/104058_XC_02.jpg (1).png',
                ),
                _buildCarCard(
                  '2020 MITSUBISHI PAJERO',
                  'EXCEED (4X4) 7 SEAT',
                  '₹55,990',
                  '39,695 km • Automatic',
                  'est. ₹282/wk based on 10.02% p.a.',
                  'assets/104058_XC_02.jpg (1).png',
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCarCard(String model, String variant, String price, String details, String emi, String imagePath) {
    return Container(
      width: 160,
      margin: const EdgeInsets.only(right: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.15),
            spreadRadius: 1,
            blurRadius: 4,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 100,
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.vertical(top: Radius.circular(8)),
              image: DecorationImage(
                image: AssetImage(imagePath),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  model,
                  style: const TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.w800,
                    fontFamily: 'Inter',
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                Text(
                  variant,
                  style: const TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.w400,
                    fontFamily: 'Poppins',
                    color: Colors.black87,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 6),
                Text(
                  price,
                  style: const TextStyle(
                    fontSize: 9.81,
                    fontWeight: FontWeight.w800,
                    fontFamily: 'Inter',
                    color: Color(0xFFE53935),
                  ),
                ),
                Text(
                  details,
                  style: const TextStyle(
                    fontSize: 6,
                    fontWeight: FontWeight.w400,
                    fontFamily: 'Poppins',
                    color: Colors.black54,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  emi,
                  style: const TextStyle(
                    fontSize: 6,
                    fontWeight: FontWeight.w500,
                    fontFamily: 'Inter',
                    color: Colors.black54,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSellBuySection() {
    return Container(
      padding: const EdgeInsets.all(20),
      child: Row(
        children: [
          Expanded(
            child: _buildSellBuyCard(
              'Are You Looking For a Car ?',
              'We are committed to providing our customers with exceptional service.',
              'Get Started',
              const Color(0xFFE9F2FF),
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: _buildSellBuyCard(
              'Do You Want to Sell a Car ?',
              'We are committed to providing our customers with exceptional service.',
              'Get Started',
              const Color(0xFFFFE9F3),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSellBuyCard(String title, String description, String buttonText, Color backgroundColor) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w500,
              fontFamily: 'Oswald',
            ),
          ),
          const SizedBox(height: 8),
          Text(
            description,
            style: const TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w400,
              fontFamily: 'Inter',
              color: Colors.black54,
            ),
          ),
          const SizedBox(height: 12),
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFFE53935),
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(6),
              ),
            ),
            child: Text(
              buttonText,
              style: const TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w500,
                fontFamily: 'DMSans',
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildRecommendationCars() {
    final cars = [
      {
        'model': '2018 LEXUS RX350L',
        'variant': 'LUXURY',
        'price': '₹61,990',
        'details': '45,600 km • Automatic',
        'emi': 'est. ₹304/wk based on 10.02% p.a.',
        'image': 'assets/104058_XC_02.jpg.png'
      },
      {
        'model': '2020 MITSUBISHI PAJERO',
        'variant': 'EXCEED (4X4) 7 SEAT',
        'price': '₹55,990',
        'details': '39,695 km • Automatic',
        'emi': 'est. ₹282/wk based on 10.02% p.a.',
        'image': 'assets/104058_XC_02.jpg (1).png'
      },
      {
        'model': '2019 TOYOTA RAV4',
        'variant': 'GX (2WD) HYBRID NAV',
        'price': '₹42,990',
        'details': '54,950 km • Automatic',
        'emi': 'est. ₹272/wk based on 10.02% p.a.',
        'image': 'assets/104058_XC_02.jpg (1).png'
      },
      {
        'model': '2018 LEXUS RX350L',
        'variant': 'LUXURY',
        'price': '₹61,990',
        'details': '45,600 km • Automatic',
        'emi': 'est. ₹304/wk based on 10.02% p.a.',
        'image': 'assets/104058_XC_02.jpg.png'
      },
      {
        'model': '2019 TOYOTA RAV4',
        'variant': 'GX (2WD) HYBRID NAV',
        'price': '₹42,990',
        'details': '54,950 km • Automatic',
        'emi': 'est. ₹272/wk based on 10.02% p.a.',
        'image': 'assets/104058_XC_02.jpg (1).png'
      },
      {
        'model': '2018 LEXUS RX350L',
        'variant': 'LUXURY',
        'price': '₹70,990',
        'details': '45,600 km • Automatic',
        'emi': 'est. ₹348/wk based on 10.02% p.a.',
        'image': 'assets/104058_XC_02.jpg.png'
      },
    ];

    return Container(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Recommendation Car',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
              fontFamily: 'Oswald',
            ),
          ),
          const SizedBox(height: 12),
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              childAspectRatio: 0.7,
              crossAxisSpacing: 12,
              mainAxisSpacing: 12,
            ),
            itemCount: cars.length,
            itemBuilder: (context, index) {
              return _buildRecommendationCard(
                cars[index]['model']!,
                cars[index]['variant']!,
                cars[index]['price']!,
                cars[index]['details']!,
                cars[index]['emi']!,
                cars[index]['image']!,
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _buildRecommendationCard(String model, String variant, String price, String details, String emi, String imagePath) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.15),
            spreadRadius: 1,
            blurRadius: 4,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 80,
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.vertical(top: Radius.circular(8)),
              image: DecorationImage(
                image: AssetImage(imagePath),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  model,
                  style: const TextStyle(
                    fontSize: 9,
                    fontWeight: FontWeight.w800,
                    fontFamily: 'Inter',
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                Text(
                  variant,
                  style: const TextStyle(
                    fontSize: 8,
                    fontWeight: FontWeight.w400,
                    fontFamily: 'Poppins',
                    color: Colors.black87,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 4),
                Text(
                  details,
                  style: const TextStyle(
                    fontSize: 7,
                    fontWeight: FontWeight.w400,
                    fontFamily: 'Poppins',
                    color: Colors.black54,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  price,
                  style: const TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.w800,
                    fontFamily: 'Inter',
                    color: Color(0xFFE53935),
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  emi,
                  style: const TextStyle(
                    fontSize: 6,
                    fontWeight: FontWeight.w500,
                    fontFamily: 'Inter',
                    color: Colors.black54,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTestimonials() {
    final testimonials = [
      {
        'image': 'assets/Component 55.png',
        'name': 'Rohit A',
        'city': 'Pune',
        'rating': '4.8',
        'comment': 'I listed my car and got it sold in just 3 days — no dealer, no hassle. The escrow made it feel super secure.',
      },
      {
        'image': 'assets/Rectangle 23789.png',
        'name': 'Priya S',
        'city': 'Mumbai',
        'rating': '4.9',
        'comment': 'Find your perfect car on Preownedly – inspected, trusted, and ready to drive.',
      },
      {
        'image': 'assets/Rectangle 23789.png',
        'name': 'Amit K',
        'city': 'Delhi',
        'rating': '5.0',
        'comment': 'Amazing platform! Bought my dream car without any hassle. Highly recommended.',
      },
    ];

    return Container(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              'Testimonials',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                fontFamily: 'Oswald',
              ),
            ),
          ),
          const SizedBox(height: 12),
          SizedBox(
            height: 180,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 20),
              itemCount: testimonials.length,
              itemBuilder: (context, index) {
                return _buildTestimonialCard(
                  testimonials[index]['image']!,
                  testimonials[index]['name']!,
                  testimonials[index]['city']!,
                  testimonials[index]['rating']!,
                  testimonials[index]['comment']!,
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTestimonialCard(String imageUrl, String name, String city, String rating, String comment) {
    return Container(
      width: 160,
      margin: const EdgeInsets.only(right: 12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        image: DecorationImage(
          image: AssetImage(imageUrl),
          fit: BoxFit.cover,
          colorFilter: ColorFilter.mode(
            Colors.black.withOpacity(0.2),
            BlendMode.darken,
          ),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '$name | $city',
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 10,
                    fontWeight: FontWeight.w500,
                    fontFamily: 'Oswald',
                  ),
                ),
                const SizedBox(height: 4),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                    color: const Color(0xFFE53935),
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Icon(Icons.star, color: Colors.white, size: 10),
                      const SizedBox(width: 2),
                      Text(
                        '$rating/5.0',
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 8,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const Spacer(),
            Text(
              comment,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 9,
                fontWeight: FontWeight.w500,
                fontFamily: 'Inter',
              ),
              maxLines: 4,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCarNews() {
    return Container(
      margin: const EdgeInsets.all(20),
      height: 160,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/Post Cars Section.png'),
          fit: BoxFit.cover,
          colorFilter: ColorFilter.mode(
            Colors.black.withOpacity(0.4),
            BlendMode.darken,
          ),
        ),
      ),
      );
  }

  Widget _buildBottomNav() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 1,
            blurRadius: 5,
          ),
        ],
      ),
      child: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        selectedItemColor: const Color(0xFFE53935),
        unselectedItemColor: Colors.grey,
        selectedFontSize: 12,
        unselectedFontSize: 12,
        currentIndex: 0,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.directions_car),
            label: 'Buy',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.sell),
            label: 'Sell',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.chat),
            label: 'Chat',
          ),
        ],
      ),
    );
  }
}