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
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    final isMobile = screenWidth < 600;
    final isTablet = screenWidth >= 600 && screenWidth < 1200;

    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          return SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(
                minHeight: constraints.maxHeight,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildHeroSection(context),
                  _buildHowItWorks(context),
                  _buildPartnerBrands(context),
                  _buildBenefits(context),
                  _buildPopularBrands(context),
                  _buildExploreVehicles(context),
                  _buildPopularCars(context),
                  _buildSellBuySection(context),
                  _buildRecommendationCars(context),
                  _buildTestimonials(context),
                  _buildCarNews(context),
                  SizedBox(height: screenHeight * 0.02),
                ],
              ),
            ),
          );
        },
      ),
      bottomNavigationBar: _buildBottomNav(),
    );
  }

  Widget _buildHeroSection(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    final isMobile = screenWidth < 600;

    return Container(
      height: isMobile ? screenHeight * 0.5 : screenHeight * 0.6,
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
          padding: EdgeInsets.all(isMobile ? 16.0 : 28.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'preownedly',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: isMobile ? 16 : 20,
                  fontWeight: FontWeight.w500,
                  fontFamily: 'Oswald',
                ),
              ),
              const Spacer(),
              Text(
                'Buy and Sell Used Cars\nDirectly - Safely and\nSeamlessly',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: isMobile ? 24 : 36,
                  fontWeight: FontWeight.w500,
                  height: 1.2,
                  fontFamily: 'Oswald',
                ),
              ),
              SizedBox(height: isMobile ? 16 : 24),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Row(
                  children: const [
                    Icon(Icons.search, color: Colors.grey),
                    SizedBox(width: 12),
                    Expanded(
                      child: Text(
                        'Search City, Brand, Price Range...',
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 14,
                          fontFamily: 'Oswald',
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: isMobile ? 16 : 20),
              Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFFE53935),
                        padding: EdgeInsets.symmetric(vertical: isMobile ? 14 : 18),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      child: Text(
                        'Sell Your Car',
                        style: TextStyle(
                          fontSize: isMobile ? 14 : 18,
                          fontWeight: FontWeight.w500,
                          color: Colors.white,
                          fontFamily: 'Oswald',
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: isMobile ? 12 : 20),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        padding: EdgeInsets.symmetric(vertical: isMobile ? 14 : 18),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      child: Text(
                        'Find Your Car',
                        style: TextStyle(
                          fontSize: isMobile ? 14 : 18,
                          fontWeight: FontWeight.w500,
                          color: Colors.black87,
                          fontFamily: 'Oswald',
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: isMobile ? 16 : 20),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHowItWorks(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 600;

    return Container(
      padding: EdgeInsets.all(isMobile ? 20 : 28),
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'How It Works',
            style: TextStyle(
              fontSize: isMobile ? 20 : 24,
              fontWeight: FontWeight.w500,
              fontFamily: 'Oswald',
            ),
          ),
          SizedBox(height: isMobile ? 20 : 28),
          LayoutBuilder(
            builder: (context, constraints) {
              final availableWidth = constraints.maxWidth;
              return Wrap(
                spacing: isMobile ? 12 : 20,
                runSpacing: isMobile ? 20 : 28,
                alignment: WrapAlignment.spaceEvenly,
                children: [
                  _buildStep(Icons.search, 'Search Cars', context),
                  _buildStep(Icons.calendar_today, 'Book Visit / Buy Now', context),
                  _buildStep(Icons.payment, 'Pay via Escrow', context),
                ],
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _buildStep(IconData icon, String label, BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 600;

    return Container(
      width: isMobile ? 120 : 140,
      child: Column(
        children: [
          Container(
            width: isMobile ? 60 : 70,
            height: isMobile ? 60 : 70,
            decoration: BoxDecoration(
              color: const Color(0xFFFFE4FB),
              shape: BoxShape.circle,
            ),
            child: Icon(icon, color: const Color(0xFFE53935), size: isMobile ? 28 : 32),
          ),
          SizedBox(height: isMobile ? 8 : 12),
          Text(
            label,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: isMobile ? 12 : 14,
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPartnerBrands(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 600;

    return Container(
      padding: EdgeInsets.symmetric(vertical: isMobile ? 20 : 28, horizontal: isMobile ? 20 : 28),
      color: Colors.white,
      child: Center(
        child: Image.asset(
          'assets/Frame 1984078153.png',
          fit: BoxFit.contain,
          width: double.infinity,
          height: isMobile ? 50 : 70,
        ),
      ),
    );
  }

    Widget _buildBenefits(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 600;

    return Container(
      padding: EdgeInsets.all(isMobile ? 20 : 28),
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Benefits',
            style: TextStyle(
              fontSize: isMobile ? 20 : 24,
              fontWeight: FontWeight.w500,
              fontFamily: 'Oswald',
            ),
          ),
          SizedBox(height: isMobile ? 20 : 28),
          LayoutBuilder(
            builder: (context, constraints) {
              final availableWidth = constraints.maxWidth;
              final crossAxisCount = availableWidth < 400 ? 1 : availableWidth < 800 ? 2 : 4;
              final childAspectRatio = availableWidth < 400 ? 5.5 : availableWidth < 800 ? 4.0 : 3.5;

              return GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: crossAxisCount,
                  childAspectRatio: childAspectRatio,
                  crossAxisSpacing: isMobile ? 12 : 20,
                  mainAxisSpacing: isMobile ? 12 : 20,
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
                    context,
                  );
                },
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _buildBenefitItem(IconData icon, String title, Color color, BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 600;

    return Container(
      padding: EdgeInsets.all(isMobile ? 16 : 20),
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: color.withOpacity(0.3), width: 2),
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: color,
              shape: BoxShape.circle,
            ),
            child: Icon(icon, color: Colors.white, size: isMobile ? 22 : 26),
          ),
          SizedBox(width: isMobile ? 12 : 16),
          Expanded(
            child: Text(
              title,
              style: TextStyle(
                fontSize: isMobile ? 14 : 16,
                fontWeight: FontWeight.w600,
                fontFamily: 'Inter',
                color: Colors.black87,
                height: 1.3,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPopularBrands(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < 600;
    final isTablet = screenWidth >= 600 && screenWidth < 1200;

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
      padding: EdgeInsets.all(isMobile ? 20 : 28),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Explore Car By Popular Brands',
            style: TextStyle(
              fontSize: isMobile ? 20 : 24,
              fontWeight: FontWeight.w500,
              fontFamily: 'Oswald',
            ),
          ),
          SizedBox(height: isMobile ? 16 : 20),
          LayoutBuilder(
            builder: (context, constraints) {
              final availableWidth = constraints.maxWidth;
              final crossAxisCount = availableWidth < 400 ? 3 : 
                                   availableWidth < 600 ? 4 : 
                                   availableWidth < 900 ? 6 : 8;

              return GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: crossAxisCount,
                  childAspectRatio: 1,
                  crossAxisSpacing: isMobile ? 12 : 16,
                  mainAxisSpacing: isMobile ? 12 : 16,
                ),
                itemCount: brands.length,
                itemBuilder: (context, index) {
                  return _buildBrandCard(
                    brands[index]['name']!,
                    brands[index]['count']!,
                    brands[index]['image']!,
                    context,
                  );
                },
              );
            },
          ),
          SizedBox(height: isMobile ? 16 : 20),
          Row(
            children: [
              Expanded(
                child: OutlinedButton(
                  onPressed: () {},
                  style: OutlinedButton.styleFrom(
                    padding: EdgeInsets.symmetric(vertical: isMobile ? 16 : 20),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    side: const BorderSide(color: Colors.grey),
                  ),
                  child: Text(
                    'Via Brand',
                    style: TextStyle(
                      color: Colors.black87,
                      fontSize: isMobile ? 14 : 16,
                    ),
                  ),
                ),
              ),
              SizedBox(width: isMobile ? 12 : 16),
              Expanded(
                child: OutlinedButton(
                  onPressed: () {},
                  style: OutlinedButton.styleFrom(
                    padding: EdgeInsets.symmetric(vertical: isMobile ? 16 : 20),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    side: const BorderSide(color: Colors.grey),
                  ),
                  child: Text(
                    'Via Seller',
                    style: TextStyle(
                      color: Colors.black87,
                      fontSize: isMobile ? 14 : 16,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildBrandCard(String name, String count, String imagePath, BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 600;

    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
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
            width: isMobile ? 40 : 50,
            height: isMobile ? 40 : 50,
            decoration: BoxDecoration(
              color: Colors.grey[100],
              borderRadius: BorderRadius.circular(8),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.asset(
                imagePath,
                width: isMobile ? 40 : 50,
                height: isMobile ? 40 : 50,
                fit: BoxFit.contain,
                errorBuilder: (context, error, stackTrace) {
                  return Icon(Icons.directions_car, size: isMobile ? 24 : 32, color: Colors.grey[600]);
                },
              ),
            ),
          ),
          SizedBox(height: isMobile ? 4 : 6),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 4),
            child: Text(
              name,
              style: TextStyle(
                fontSize: isMobile ? 10 : 12,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w500,
              ),
              textAlign: TextAlign.center,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          Text(
            count,
            style: TextStyle(
              fontSize: isMobile ? 8 : 10,
              fontFamily: 'Inter',
              color: const Color(0xFF6F66B0),
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  Widget _buildExploreVehicles(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 600;

    return Container(
      padding: EdgeInsets.all(isMobile ? 20 : 28),
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
                  width: isMobile ? 140 : 200,
                  height: isMobile ? 35 : 50,
                ),
              ),
            ],
          ),
          SizedBox(height: isMobile ? 16 : 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Explore All Vehicles',
                style: TextStyle(
                  fontSize: isMobile ? 20 : 24,
                  fontWeight: FontWeight.w500,
                  fontFamily: 'Oswald',
                ),
              ),
              TextButton(
                onPressed: () {},
                child: Text(
                  'View All',
                  style: TextStyle(
                    color: const Color(0xFFE53935),
                    fontSize: isMobile ? 14 : 16,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: isMobile ? 12 : 16),
          SizedBox(
            height: isMobile ? 140 : 180,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                _buildVehicleCard('Tesla Model S', '₹65,00,000', 'Electric performance sedan', 'assets/Rectangle 24.png', context),
                SizedBox(width: isMobile ? 12 : 16),
                _buildVehicleCard('Sporty Convertible', '₹65,00,000', 'Audi e-tron', 'assets/Rectangle 25.png', context),
                SizedBox(width: isMobile ? 12 : 16),
                _buildVehicleCard('BMW X5', '₹75,00,000', 'Luxury SUV', 'assets/Rectangle 22.png', context),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildVehicleCard(String name, String price, String description, String imagePath, BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < 600;
    final cardWidth = isMobile ? screenWidth * 0.75 : screenWidth * 0.45;

    return Container(
      width: cardWidth.clamp(200, 350),
      margin: EdgeInsets.only(right: isMobile ? 12 : 16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
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
        padding: EdgeInsets.all(isMobile ? 12 : 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text(
              name,
              style: TextStyle(
                color: Colors.white,
                fontSize: isMobile ? 14 : 16,
                fontWeight: FontWeight.w600,
                fontFamily: 'Inter',
              ),
            ),
            Text(
              description,
              style: TextStyle(
                color: Colors.white70,
                fontSize: isMobile ? 12 : 14,
                fontWeight: FontWeight.w500,
                fontFamily: 'Inter',
              ),
            ),
            SizedBox(height: isMobile ? 4 : 6),
            Text(
              price,
              style: TextStyle(
                color: Colors.white,
                fontSize: isMobile ? 14 : 16,
                fontWeight: FontWeight.w600,
                fontFamily: 'Inter',
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPopularCars(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 600;

    return Container(
      padding: EdgeInsets.all(isMobile ? 20 : 28),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Popular Car',
                style: TextStyle(
                  fontSize: isMobile ? 20 : 24,
                  fontWeight: FontWeight.w500,
                  fontFamily: 'Oswald',
                ),
              ),
              TextButton(
                onPressed: () {},
                child: Text(
                  'View All',
                  style: TextStyle(
                    color: const Color(0xFFE53935),
                    fontSize: isMobile ? 14 : 16,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: isMobile ? 12 : 16),
          SizedBox(
            height: isMobile ? 220 : 280,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                _buildCarCard('2018 LEXUS RX350L', 'LUXURY', '₹61,990', '45,600 km • Automatic', 'est. ₹304/wk based on 10.02% p.a.', 'assets/104058_XC_02.jpg.png', context),
                SizedBox(width: isMobile ? 12 : 16),
                _buildCarCard('2019 TOYOTA RAV4', 'GX (2WD) HYBRID NAV', '₹42,990', '54,950 km • Automatic', 'est. ₹272/wk based on 10.02% p.a.', 'assets/104058_XC_02.jpg (1).png', context),
                SizedBox(width: isMobile ? 12 : 16),
                _buildCarCard('2020 MITSUBISHI PAJERO', 'EXCEED (4X4) 7 SEAT', '₹55,990', '39,695 km • Automatic', 'est. ₹282/wk based on 10.02% p.a.', 'assets/104058_XC_02.jpg (1).png', context),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCarCard(String model, String variant, String price, String details, String emi, String imagePath, BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < 600;
    final cardWidth = isMobile ? screenWidth * 0.65 : screenWidth * 0.35;

    return Container(
      width: cardWidth.clamp(180, 280),
      margin: EdgeInsets.only(right: isMobile ? 12 : 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
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
            height: isMobile ? 100 : 120,
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.vertical(top: Radius.circular(12)),
              image: DecorationImage(
                image: AssetImage(imagePath),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(isMobile ? 12 : 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  model,
                  style: TextStyle(
                    fontSize: isMobile ? 12 : 14,
                    fontWeight: FontWeight.w800,
                    fontFamily: 'Inter',
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                Text(
                  variant,
                  style: TextStyle(
                    fontSize: isMobile ? 11 : 13,
                    fontWeight: FontWeight.w400,
                    fontFamily: 'Poppins',
                    color: Colors.black87,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                SizedBox(height: isMobile ? 6 : 8),
                Text(
                  price,
                  style: TextStyle(
                    fontSize: isMobile ? 12 : 14,
                    fontWeight: FontWeight.w800,
                    fontFamily: 'Inter',
                    color: const Color(0xFFE53935),
                  ),
                ),
                Text(
                  details,
                  style: TextStyle(
                    fontSize: isMobile ? 9 : 11,
                    fontWeight: FontWeight.w400,
                    fontFamily: 'Poppins',
                    color: Colors.black54,
                  ),
                ),
                SizedBox(height: isMobile ? 2 : 4),
                Text(
                  emi,
                  style: TextStyle(
                    fontSize: isMobile ? 8 : 10,
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

  Widget _buildSellBuySection(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 600;

    return Container(
      padding: EdgeInsets.all(isMobile ? 20 : 28),
      child: isMobile
          ? Column(
              children: [
                _buildSellBuyCard('Are You Looking For a Car ?', 'We are committed to providing our customers with exceptional service.', 'Get Started', const Color(0xFFE9F2FF), context),
                SizedBox(height: 16),
                _buildSellBuyCard('Do You Want to Sell a Car ?', 'We are committed to providing our customers with exceptional service.', 'Get Started', const Color(0xFFFFE9F3), context),
              ],
            )
          : Row(
              children: [
                Expanded(
                  child: _buildSellBuyCard('Are You Looking For a Car ?', 'We are committed to providing our customers with exceptional service.', 'Get Started', const Color(0xFFE9F2FF), context),
                ),
                SizedBox(width: 16),
                Expanded(
                  child: _buildSellBuyCard('Do You Want to Sell a Car ?', 'We are committed to providing our customers with exceptional service.', 'Get Started', const Color(0xFFFFE9F3), context),
                ),
              ],
            ),
    );
  }

  Widget _buildSellBuyCard(String title, String description, String buttonText, Color backgroundColor, BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 600;

    return Container(
      padding: EdgeInsets.all(isMobile ? 16 : 20),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: isMobile ? 16 : 20,
              fontWeight: FontWeight.w500,
              fontFamily: 'Oswald',
            ),
          ),
          SizedBox(height: isMobile ? 8 : 12),
          Text(
            description,
            style: TextStyle(
              fontSize: isMobile ? 13 : 15,
              fontWeight: FontWeight.w400,
              fontFamily: 'Inter',
              color: Colors.black54,
            ),
          ),
          SizedBox(height: isMobile ? 12 : 16),
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFFE53935),
              padding: EdgeInsets.symmetric(horizontal: isMobile ? 20 : 24, vertical: isMobile ? 12 : 14),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            child: Text(
              buttonText,
              style: TextStyle(
                fontSize: isMobile ? 13 : 15,
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

  Widget _buildRecommendationCars(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < 600;
    final isTablet = screenWidth >= 600 && screenWidth < 1200;

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
      padding: EdgeInsets.all(isMobile ? 20 : 28),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Recommendation Car',
            style: TextStyle(
              fontSize: isMobile ? 20 : 24,
              fontWeight: FontWeight.w500,
              fontFamily: 'Oswald',
            ),
          ),
          SizedBox(height: isMobile ? 12 : 16),
          LayoutBuilder(
            builder: (context, constraints) {
              final availableWidth = constraints.maxWidth;
              final crossAxisCount = availableWidth < 400 ? 2 : 
                                   availableWidth < 600 ? 3 : 
                                   availableWidth < 900 ? 4 : 5;

              return GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: crossAxisCount,
                  childAspectRatio: 0.7,
                  crossAxisSpacing: isMobile ? 12 : 16,
                  mainAxisSpacing: isMobile ? 12 : 16,
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
                    context,
                  );
                },
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _buildRecommendationCard(String model, String variant, String price, String details, String emi, String imagePath, BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 600;

    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
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
            height: isMobile ? 80 : 100,
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.vertical(top: Radius.circular(12)),
              image: DecorationImage(
                image: AssetImage(imagePath),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(isMobile ? 8 : 12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  model,
                  style: TextStyle(
                    fontSize: isMobile ? 10 : 12,
                    fontWeight: FontWeight.w800,
                    fontFamily: 'Inter',
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                Text(
                  variant,
                  style: TextStyle(
                    fontSize: isMobile ? 9 : 11,
                    fontWeight: FontWeight.w400,
                    fontFamily: 'Poppins',
                    color: Colors.black87,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                SizedBox(height: isMobile ? 4 : 6),
                Text(
                  details,
                  style: TextStyle(
                    fontSize: isMobile ? 8 : 10,
                    fontWeight: FontWeight.w400,
                    fontFamily: 'Poppins',
                    color: Colors.black54,
                  ),
                ),
                SizedBox(height: isMobile ? 4 : 6),
                Text(
                  price,
                  style: TextStyle(
                    fontSize: isMobile ? 11 : 13,
                    fontWeight: FontWeight.w800,
                    fontFamily: 'Inter',
                    color: const Color(0xFFE53935),
                  ),
                ),
                SizedBox(height: isMobile ? 2 : 4),
                Text(
                  emi,
                  style: TextStyle(
                    fontSize: isMobile ? 7 : 9,
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

  Widget _buildTestimonials(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 600;

    final testimonials = [
      {
        'image': 'assets/Component 55.png',
        'name': 'Rohit A',
        'city': 'Pune',
        'rating': '4.8',
        'comment': 'I listed my car and got it sold in just 3 days – no dealer, no hassle. The escrow made it feel super secure.',
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
      padding: EdgeInsets.symmetric(vertical: isMobile ? 20 : 28),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: isMobile ? 20 : 28),
            child: Text(
              'Testimonials',
              style: TextStyle(
                fontSize: isMobile ? 20 : 24,
                fontWeight: FontWeight.w500,
                fontFamily: 'Oswald',
              ),
            ),
          ),
          SizedBox(height: isMobile ? 12 : 16),
          SizedBox(
            height: isMobile ? 180 : 220,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              padding: EdgeInsets.symmetric(horizontal: isMobile ? 20 : 28),
              itemCount: testimonials.length,
              itemBuilder: (context, index) {
                return _buildTestimonialCard(
                  testimonials[index]['image']!,
                  testimonials[index]['name']!,
                  testimonials[index]['city']!,
                  testimonials[index]['rating']!,
                  testimonials[index]['comment']!,
                  context,
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTestimonialCard(String imageUrl, String name, String city, String rating, String comment, BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < 600;
    final cardWidth = isMobile ? screenWidth * 0.75 : screenWidth * 0.45;

    return Container(
      width: cardWidth.clamp(200, 350),
      margin: EdgeInsets.only(right: isMobile ? 12 : 16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
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
        padding: EdgeInsets.all(isMobile ? 12 : 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '$name | $city',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: isMobile ? 12 : 14,
                    fontWeight: FontWeight.w500,
                    fontFamily: 'Oswald',
                  ),
                ),
                SizedBox(height: isMobile ? 4 : 6),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                    color: const Color(0xFFE53935),
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Icon(Icons.star, color: Colors.white, size: 12),
                      const SizedBox(width: 4),
                      Text(
                        '$rating/5.0',
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 10,
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
              style: TextStyle(
                color: Colors.white,
                fontSize: isMobile ? 10 : 12,
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

  Widget _buildCarNews(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 600;

    return Container(
      margin: EdgeInsets.all(isMobile ? 20 : 28),
      height: isMobile ? 140 : 180,
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