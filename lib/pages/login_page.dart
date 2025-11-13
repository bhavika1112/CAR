import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'responsive_helper.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'PreOwnedly',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: const Color(0xFFE94560),
        scaffoldBackgroundColor: Colors.white,
      ),
      home: const SplashScreen(),
    );
  }
}

Widget _buildRoleCard(
  String title, {
  required double titleFontSize,
  required String titleFontFamily,
  required String subtitle,
  required double subtitleFontSize,
  required String subtitleFontFamily,
  required bool isVip,
  required VoidCallback onTap,
}) {
  return GestureDetector(
    onTap: onTap,
    child: Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: isVip ? const Color(0xFFFDB813) : Colors.grey.shade300,
          width: 2,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: GoogleFonts.getFont(
                    titleFontFamily,
                    fontSize: titleFontSize,
                    fontWeight: FontWeight.w500,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 6),
                Text(
                  subtitle,
                  style: GoogleFonts.getFont(
                    subtitleFontFamily,
                    fontSize: subtitleFontSize,
                    fontWeight: FontWeight.w400,
                    color: Colors.black54,
                  ),
                ),
              ],
            ),
          ),
          Icon(
            Icons.arrow_forward_ios,
            color: Colors.grey.shade600,
            size: 18,
          ),
        ],
      ),
    ),
  );
}

Widget _buildTextField(String label, String hint, {
  double labelFontSize = 20,
  String labelFontFamily = 'Oswald',
  double hintFontSize = 14,
  String hintFontFamily = 'Inter',
}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        label,
        style: GoogleFonts.getFont(
          labelFontFamily,
          color: Colors.white,
          fontSize: labelFontSize,
          fontWeight: FontWeight.w400,
        ),
      ),
      const SizedBox(height: 12),
      TextFormField(
        decoration: InputDecoration(
          hintText: hint,
          hintStyle: GoogleFonts.getFont(
            hintFontFamily,
            color: Colors.white54,
            fontSize: hintFontSize,
            fontWeight: FontWeight.w400,
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: const BorderSide(color: Colors.white54, width: 2),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: const BorderSide(color: Colors.white54, width: 2),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: const BorderSide(color: Colors.white, width: 2),
          ),
          contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
        ),
        style: GoogleFonts.getFont(
          hintFontFamily,
          color: Colors.white,
          fontSize: hintFontSize,
          fontWeight: FontWeight.w400,
        ),
      ),
    ],
  );
}

Widget _buildUploadOption(String title, {
  double fontSize = 16,
  String fontFamily = 'Inter',
}) {
  return InkWell(
    onTap: () {},
    child: Container(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.grey.shade300),
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(Icons.upload_file, color: Colors.grey.shade700),
          const SizedBox(width: 16),
          Text(
            title,
            style: GoogleFonts.getFont(
              fontFamily,
              fontSize: fontSize,
              color: Colors.black87,
              fontWeight: FontWeight.w400,
            ),
          ),
        ],
      ),
    ),
  );
}

// Splash Screen
class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 2), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const OnboardingScreen()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 32,
                  height: 32,
                  decoration: BoxDecoration(
                    color: const Color(0xFFE94560),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: const Icon(
                    Icons.check,
                    color: Colors.white,
                    size: 24,
                  ),
                ),
                const SizedBox(width: 6),
                Text(
                  'preownedly',
                  style: GoogleFonts.oswald(
                    fontSize: 48,
                    fontWeight: FontWeight.w400,
                    color: Colors.black,
                    letterSpacing: -1,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

// Onboarding Screen
class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isMobile = ResponsiveHelper.isMobile(context);
    final isTablet = ResponsiveHelper.isTablet(context);
    
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFF1A1A1A),
              Color(0xFF2D1B29),
            ],
          ),
        ),
        child: Stack(
          fit: StackFit.expand,
          children: [
            Container(
              color: const Color(0xFF2D1B29),
            ),
            Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/pexels-garvin-st-villier-3311574 1.png'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SafeArea(
              child: Padding(
                padding: ResponsiveHelper.responsivePadding(context),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Spacer(),
                    RichText(
                      text: TextSpan(
                        style: GoogleFonts.inter(
                          fontSize: ResponsiveHelper.responsiveFontSize(
                            context, 
                            mobile: 32, 
                            tablet: 40, 
                            desktop: 46
                          ),
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                          height: 1.2,
                        ),
                        children: [
                          TextSpan(
                            text: isMobile ? 'Your Trusted Marketplace\nfor Second-Hand ' : 'Your Trusted Marketplace\nfor Second-Hand ',
                          ),
                          TextSpan(
                            text: 'Cars',
                            style: GoogleFonts.oswald(
                              color: const Color(0xFFFDB813),
                              fontSize: ResponsiveHelper.responsiveFontSize(
                                context, 
                                mobile: 30, 
                                tablet: 38, 
                                desktop: 42
                              ),
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          const TextSpan(text: '"'),
                        ],
                      ),
                    ),
                    SizedBox(height: isMobile ? 24 : 48),
                    Text(
                      'Discover the Best Deals\non Pre-Owned Cars',
                      style: GoogleFonts.inter(
                        fontSize: ResponsiveHelper.responsiveFontSize(
                          context, 
                          mobile: 24, 
                          tablet: 30, 
                          desktop: 34
                        ),
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                        height: 1.3,
                      ),
                    ),
                    SizedBox(height: isMobile ? 24 : 36),
                    SizedBox(
                      width: double.infinity,
                      height: ResponsiveHelper.getResponsiveValue(
                        context, 
                        mobile: 56, 
                        tablet: 62, 
                        desktop: 66
                      ),
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const LoginScreen()),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFFE94560),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(32),
                          ),
                          elevation: 0,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Get Started',
                              style: GoogleFonts.inter(
                                fontSize: ResponsiveHelper.responsiveFontSize(
                                  context, 
                                  mobile: 18, 
                                  tablet: 22, 
                                  desktop: 24
                                ),
                                fontWeight: FontWeight.w500,
                                color: Colors.white,
                              ),
                            ),
                            const SizedBox(width: 12),
                            const Icon(Icons.arrow_forward, size: 24),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: isMobile ? 24 : 36),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Login Screen
class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isMobile = ResponsiveHelper.isMobile(context);
    
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFF1A1A1A),
              Color(0xFF2D1B29),
            ],
          ),
        ),
        child: Stack(
          fit: StackFit.expand,
          children: [
            Container(
              color: const Color(0xFF2D1B29),
            ),
            Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/login screen (2).png'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SafeArea(
              child: SingleChildScrollView(
                padding: ResponsiveHelper.responsivePadding(context).copyWith(bottom: 20),
                child: ConstrainedBox(
                  constraints: BoxConstraints(
                    minHeight: MediaQuery.of(context).size.height -
                        MediaQuery.of(context).padding.vertical,
                  ),
                  child: IntrinsicHeight(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        if (!isMobile) const Spacer(),
                        const SizedBox(height: 24),
                        Text(
                          'Hello!',
                          style: GoogleFonts.oswald(
                            fontSize: ResponsiveHelper.responsiveFontSize(context, mobile: 32, tablet: 36, desktop: 40),
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                          ),
                        ),
                        RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: 'Welcome ',
                                style: GoogleFonts.oswald(
                                  color: Colors.white,
                                  fontSize: ResponsiveHelper.responsiveFontSize(context, mobile: 30, tablet: 34, desktop: 38),
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              TextSpan(
                                text: 'back',
                                style: GoogleFonts.oswald(
                                  color: const Color(0xFFFDB813),
                                  fontSize: ResponsiveHelper.responsiveFontSize(context, mobile: 30, tablet: 34, desktop: 38),
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 48),
                        _buildTextField(
                          'Email Address',
                          'Enter your email',
                          labelFontSize: ResponsiveHelper.responsiveFontSize(context, mobile: 20, tablet: 22, desktop: 24),
                          hintFontSize: ResponsiveHelper.responsiveFontSize(context, mobile: 16, tablet: 18, desktop: 20),
                        ),
                        const SizedBox(height: 24),
                        _buildTextField(
                          'Mobile Number',
                          'Enter your Number',
                          labelFontSize: ResponsiveHelper.responsiveFontSize(context, mobile: 20, tablet: 22, desktop: 24),
                          hintFontSize: ResponsiveHelper.responsiveFontSize(context, mobile: 16, tablet: 18, desktop: 20),
                        ),
                        const SizedBox(height: 48),
                        SizedBox(
                          width: double.infinity,
                          height: ResponsiveHelper.getResponsiveValue(context, mobile: 56, tablet: 62, desktop: 66),
                          child: ElevatedButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const SignUpScreen()),
                              );
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xFFE94560),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(32),
                              ),
                              elevation: 0,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'Get Started',
                                  style: GoogleFonts.inter(
                                    fontSize: ResponsiveHelper.responsiveFontSize(context, mobile: 18, tablet: 20, desktop: 22),
                                    fontWeight: FontWeight.w500,
                                    color: Colors.white,
                                  ),
                                ),
                                const SizedBox(width: 12),
                                const Icon(Icons.arrow_forward, size: 24),
                              ],
                            ),
                          ),
                        ),
                        if (!isMobile) const Spacer(),
                        const SizedBox(height: 36),
                        Center(
                          child: RichText(
                            text: TextSpan(
                              children: [
                                TextSpan(
                                  text: 'Create a new ',
                                  style: GoogleFonts.inter(
                                    color: Colors.white,
                                    fontSize: ResponsiveHelper.responsiveFontSize(context, mobile: 16, tablet: 18, desktop: 20),
                                  ),
                                ),
                                TextSpan(
                                  text: 'account',
                                  style: GoogleFonts.inter(
                                    color: const Color(0xFFFDB813),
                                    fontSize: ResponsiveHelper.responsiveFontSize(context, mobile: 16, tablet: 18, desktop: 20),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(height: 24),
                        Center(
                          child: Text(
                            'or',
                            style: GoogleFonts.inter(
                              color: Colors.white,
                              fontSize: ResponsiveHelper.responsiveFontSize(context, mobile: 16, tablet: 18, desktop: 20),
                            ),
                          ),
                        ),
                        const SizedBox(height: 24),
                        Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 28, vertical: 20),
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.white54, width: 2),
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Sign up with',
                                style: GoogleFonts.inter(
                                  color: Colors.white,
                                  fontSize: ResponsiveHelper.responsiveFontSize(context, mobile: 16, tablet: 18, desktop: 20),
                                ),
                              ),
                              const SizedBox(width: 20),
                              Container(
                                padding: const EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Image.asset(
                                  'assets/google.png',
                                  width: 28,
                                  height: 28,
                                  errorBuilder: (context, error, stackTrace) => 
                                    const Icon(Icons.search, size: 28),
                                ),
                              ),
                              const SizedBox(width: 16),
                              Container(
                                padding: const EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: const Icon(Icons.apple, size: 28),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 36),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Sign Up Screen
class SignUpScreen extends StatelessWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isMobile = ResponsiveHelper.isMobile(context);
    
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFF1A1A1A),
              Color(0xFF2D1B29),
            ],
          ),
        ),
        child: Stack(
          fit: StackFit.expand,
          children: [
            Container(
              color: const Color(0xFF2D1B29),
            ),
            Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/Sign Up Screen (1).png'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SafeArea(
              child: SingleChildScrollView(
                padding: ResponsiveHelper.responsivePadding(context).copyWith(bottom: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    if (!isMobile) const Spacer(),
                    const SizedBox(height: 48),
                    Text(
                      'Hello!',
                      style: GoogleFonts.oswald(
                        fontSize: ResponsiveHelper.responsiveFontSize(context, mobile: 32, tablet: 36, desktop: 40),
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                    ),
                    RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: 'Create an ',
                            style: GoogleFonts.oswald(
                              color: Colors.white,
                              fontSize: ResponsiveHelper.responsiveFontSize(context, mobile: 30, tablet: 34, desktop: 38),
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          TextSpan(
                            text: 'account',
                            style: GoogleFonts.oswald(
                              color: const Color(0xFFFDB813),
                              fontSize: ResponsiveHelper.responsiveFontSize(context, mobile: 30, tablet: 34, desktop: 38),
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 36),
                    _buildTextField(
                      'Name',
                      'Type Name',
                      labelFontSize: ResponsiveHelper.responsiveFontSize(context, mobile: 20, tablet: 22, desktop: 24),
                      labelFontFamily: 'Oswald',
                      hintFontSize: ResponsiveHelper.responsiveFontSize(context, mobile: 16, tablet: 18, desktop: 20),
                      hintFontFamily: 'Inter',
                    ),
                    const SizedBox(height: 20),
                    _buildTextField(
                      'Mobile Number',
                      'Enter your number',
                      labelFontSize: ResponsiveHelper.responsiveFontSize(context, mobile: 20, tablet: 22, desktop: 24),
                      labelFontFamily: 'Oswald',
                      hintFontSize: ResponsiveHelper.responsiveFontSize(context, mobile: 16, tablet: 18, desktop: 20),
                      hintFontFamily: 'Inter',
                    ),
                    const SizedBox(height: 20),
                    _buildTextField(
                      'Email Address',
                      'Enter your email',
                      labelFontSize: ResponsiveHelper.responsiveFontSize(context, mobile: 20, tablet: 22, desktop: 24),
                      labelFontFamily: 'Oswald',
                      hintFontSize: ResponsiveHelper.responsiveFontSize(context, mobile: 16, tablet: 18, desktop: 20),
                      hintFontFamily: 'Inter',
                    ),
                    const SizedBox(height: 20),
                    Text(
                      'Upload Aadhaar',
                      style: GoogleFonts.oswald(
                        color: Colors.white,
                        fontSize: ResponsiveHelper.responsiveFontSize(context, mobile: 20, tablet: 22, desktop: 24),
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    const SizedBox(height: 12),
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 20),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.white54, width: 2),
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Row(
                        children: [
                          const Icon(Icons.upload_file, color: Colors.white, size: 24),
                          const SizedBox(width: 16),
                          Text(
                            'Aadhaar',
                            style: GoogleFonts.inter(
                              color: Colors.white,
                              fontSize: ResponsiveHelper.responsiveFontSize(context, mobile: 16, tablet: 18, desktop: 20),
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 20),
                    _buildTextField(
                      'Address',
                      'Enter your Address',
                      labelFontSize: ResponsiveHelper.responsiveFontSize(context, mobile: 20, tablet: 22, desktop: 24),
                      labelFontFamily: 'Oswald',
                      hintFontSize: ResponsiveHelper.responsiveFontSize(context, mobile: 16, tablet: 18, desktop: 20),
                      hintFontFamily: 'Inter',
                    ),
                    const SizedBox(height: 36),
                    SizedBox(
                      width: double.infinity,
                      height: ResponsiveHelper.getResponsiveValue(context, mobile: 56, tablet: 62, desktop: 66),
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const OTPScreen()),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFFE94560),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(32),
                          ),
                          elevation: 0,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Get Started',
                              style: GoogleFonts.inter(
                                fontSize: ResponsiveHelper.responsiveFontSize(context, mobile: 18, tablet: 20, desktop: 22),
                                fontWeight: FontWeight.w500,
                                color: Colors.white,
                              ),
                            ),
                            const SizedBox(width: 12),
                            const Icon(Icons.arrow_forward, size: 24),
                          ],
                        ),
                      ),
                    ),
                    if (!isMobile) const Spacer(),
                    const SizedBox(height: 24),
                    Center(
                      child: RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: 'Already have an account ',
                              style: GoogleFonts.inter(
                                color: Colors.white,
                                fontSize: ResponsiveHelper.responsiveFontSize(context, mobile: 16, tablet: 18, desktop: 20),
                              ),
                            ),
                            TextSpan(
                              text: 'login',
                              style: GoogleFonts.inter(
                                color: const Color(0xFFFDB813),
                                fontSize: ResponsiveHelper.responsiveFontSize(context, mobile: 16, tablet: 18, desktop: 20),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 36),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// OTP Screen
class OTPScreen extends StatelessWidget {
  const OTPScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isMobile = ResponsiveHelper.isMobile(context);
    
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFF1A1A1A),
              Color(0xFF2D1B29),
            ],
          ),
        ),
        child: Stack(
          fit: StackFit.expand,
          children: [
            Container(
              color: const Color(0xFF2D1B29),
            ),
            Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/OTP (1).png'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SafeArea(
              child: SingleChildScrollView(
                padding: ResponsiveHelper.responsivePadding(context).copyWith(bottom: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    if (!isMobile) const Spacer(),
                    const SizedBox(height: 72),
                    Center(
                      child: Text(
                        'OTP',
                        style: GoogleFonts.oswald(
                          fontSize: ResponsiveHelper.responsiveFontSize(context, mobile: 32, tablet: 36, desktop: 40),
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    Center(
                      child: Text(
                        'We have sent the code verification  to your\nmobile number',
                        textAlign: TextAlign.center,
                        style: GoogleFonts.inter(
                          fontSize: ResponsiveHelper.responsiveFontSize(context, mobile: 16, tablet: 20, desktop: 22),
                          color: Colors.white70,
                        ),
                      ),
                    ),
                    const SizedBox(height: 72),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: List.generate(
                        4,
                        (index) => Container(
                          width: ResponsiveHelper.getResponsiveValue(context, mobile: 70, tablet: 80, desktop: 90),
                          height: ResponsiveHelper.getResponsiveValue(context, mobile: 70, tablet: 80, desktop: 90),
                          decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.2),
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(
                              color: Colors.white.withOpacity(0.5),
                              width: 2,
                            ),
                          ),
                          child: Center(
                            child: Text(
                              '1',
                              style: GoogleFonts.inter(
                                fontSize: ResponsiveHelper.responsiveFontSize(context, mobile: 28, tablet: 36, desktop: 40),
                                color: Colors.white,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 72),
                    SizedBox(
                      width: double.infinity,
                      height: ResponsiveHelper.getResponsiveValue(context, mobile: 56, tablet: 62, desktop: 66),
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const ChooseRoleScreen()),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFFE94560),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(32),
                          ),
                          elevation: 0,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Verify',
                              style: GoogleFonts.inter(
                                fontSize: ResponsiveHelper.responsiveFontSize(context, mobile: 18, tablet: 20, desktop: 22),
                                fontWeight: FontWeight.w500,
                                color: Colors.white,
                              ),
                            ),
                            const SizedBox(width: 12),
                            const Icon(Icons.arrow_forward, size: 24),
                          ],
                        ),
                      ),
                    ),
                    if (!isMobile) const Spacer(),
                    const SizedBox(height: 24),
                    Center(
                      child: RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: "Don't receive code? ",
                              style: GoogleFonts.inter(
                                color: Colors.white,
                                fontSize: ResponsiveHelper.responsiveFontSize(context, mobile: 16, tablet: 18, desktop: 20),
                              ),
                            ),
                            TextSpan(
                              text: 'request again',
                              style: GoogleFonts.inter(
                                color: const Color(0xFFFDB813),
                                fontSize: ResponsiveHelper.responsiveFontSize(context, mobile: 16, tablet: 18, desktop: 20),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 36),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Choose Role Screen
class ChooseRoleScreen extends StatelessWidget {
  const ChooseRoleScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isMobile = ResponsiveHelper.isMobile(context);
    
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFF1A1A1A),
              Color(0xFF2D1B29),
            ],
          ),
        ),
        child: Stack(
          fit: StackFit.expand,
          children: [
            Container(
              color: const Color(0xFF2D1B29),
            ),
            Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/Choose Role (1).png'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SafeArea(
              child: SingleChildScrollView(
                padding: ResponsiveHelper.responsivePadding(context).copyWith(bottom: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Choose Role',
                      style: GoogleFonts.inter(
                        color: Colors.grey,
                        fontSize: ResponsiveHelper.responsiveFontSize(context, mobile: 14, tablet: 16, desktop: 18),
                      ),
                    ),
                    const SizedBox(height: 48),
                    Text(
                      'Hello, Sayan',
                      style: GoogleFonts.oswald(
                        fontSize: ResponsiveHelper.responsiveFontSize(context, mobile: 30, tablet: 36, desktop: 42),
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 12),
                    Text(
                      'Here You can sell and buy second-\nhand car',
                      style: GoogleFonts.inter(
                        fontSize: ResponsiveHelper.responsiveFontSize(context, mobile: 16, tablet: 20, desktop: 22),
                        color: Colors.white70,
                      ),
                    ),
                    const SizedBox(height: 48),
                    Text(
                      'what would you like to do?',
                      style: GoogleFonts.oswald(
                        fontSize: ResponsiveHelper.responsiveFontSize(context, mobile: 18, tablet: 20, desktop: 22),
                        color: Colors.white,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    const SizedBox(height: 24),
                    _buildRoleCard(
                      'For buyer',
                      titleFontSize: ResponsiveHelper.responsiveFontSize(context, mobile: 14, tablet: 16, desktop: 18),
                      titleFontFamily: 'Oswald',
                      subtitle: 'Choose from 1000+ MRL\ncertified cars',
                      subtitleFontSize: ResponsiveHelper.responsiveFontSize(context, mobile: 14, tablet: 16, desktop: 18),
                      subtitleFontFamily: 'Inter',
                      isVip: false,
                      onTap: () {},
                    ),
                    const SizedBox(height: 20),
                    _buildRoleCard(
                      'For seller',
                      titleFontSize: ResponsiveHelper.responsiveFontSize(context, mobile: 14, tablet: 16, desktop: 18),
                      titleFontFamily: 'Oswald',
                      subtitle: 'Get the best price for your\ncar instantly',
                      subtitleFontSize: ResponsiveHelper.responsiveFontSize(context, mobile: 14, tablet: 16, desktop: 18),
                      subtitleFontFamily: 'Inter',
                      isVip: false,
                      onTap: () {
                        _showSellerPopup(context);
                      },
                    ),
                    const SizedBox(height: 36),
                    Text(
                      'what would you like to do?',
                      style: GoogleFonts.oswald(
                        fontSize: ResponsiveHelper.responsiveFontSize(context, mobile: 18, tablet: 20, desktop: 22),
                        color: Colors.white,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    const SizedBox(height: 24),
                    _buildRoleCard(
                      'Vip Buyer',
                      titleFontSize: ResponsiveHelper.responsiveFontSize(context, mobile: 14, tablet: 16, desktop: 18),
                      titleFontFamily: 'Oswald',
                      subtitle: 'Choose from 1000+ MRL\ncertified cars',
                      subtitleFontSize: ResponsiveHelper.responsiveFontSize(context, mobile: 14, tablet: 16, desktop: 18),
                      subtitleFontFamily: 'Inter',
                      isVip: true,
                      onTap: () {},
                    ),
                    const SizedBox(height: 20),
                    _buildRoleCard(
                      'Vip Seller',
                      titleFontSize: ResponsiveHelper.responsiveFontSize(context, mobile: 14, tablet: 16, desktop: 18),
                      titleFontFamily: 'Oswald',
                      subtitle: 'Get the best price for your\ncar instantly',
                      subtitleFontSize: ResponsiveHelper.responsiveFontSize(context, mobile: 14, tablet: 16, desktop: 18),
                      subtitleFontFamily: 'Inter',
                      isVip: true,
                      onTap: () {},
                    ),
                    const SizedBox(height: 36),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showSellerPopup(BuildContext context) {
    final isMobile = ResponsiveHelper.isMobile(context);
    
    showDialog(
      context: context,
      barrierColor: Colors.black.withOpacity(0.7),
      builder: (BuildContext context) {
        return Dialog(
          backgroundColor: Colors.transparent,
          insetPadding: EdgeInsets.all(isMobile ? 24 : 48),
          child: Container(
            width: double.infinity,
            padding: EdgeInsets.all(isMobile ? 24 : 40),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(24),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.3),
                  blurRadius: 20,
                  offset: const Offset(0, 10),
                ),
              ],
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'Seller',
                  style: GoogleFonts.oswald(
                    fontSize: ResponsiveHelper.responsiveFontSize(context, mobile: 24, tablet: 28, desktop: 32),
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                  ),
                ),
                SizedBox(height: isMobile ? 20 : 32),
                _buildUploadOption(
                  'KYC Upload',
                  fontSize: ResponsiveHelper.responsiveFontSize(context, mobile: 14, tablet: 16, desktop: 18),
                  fontFamily: 'Inter',
                ),
                SizedBox(height: isMobile ? 16 : 20),
                _buildUploadOption(
                  'Aadhaar or DL',
                  fontSize: ResponsiveHelper.responsiveFontSize(context, mobile: 12, tablet: 14, desktop: 16),
                  fontFamily: 'Inter',
                ),
                SizedBox(height: isMobile ? 16 : 20),
                _buildUploadOption(
                  'Selfie',
                  fontSize: ResponsiveHelper.responsiveFontSize(context, mobile: 12, tablet: 14, desktop: 16),
                  fontFamily: 'Inter',
                ),
                SizedBox(height: isMobile ? 20 : 32),
                SizedBox(
                  width: double.infinity,
                  height: ResponsiveHelper.getResponsiveValue(context, mobile: 52, tablet: 56, desktop: 60),
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const SellerRoleScreen()),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFFE94560),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(28),
                      ),
                      elevation: 0,
                    ),
                    child: Text(
                      'Continue',
                      style: GoogleFonts.inter(
                        fontSize: ResponsiveHelper.responsiveFontSize(context, mobile: 16, tablet: 18, desktop: 20),
                        fontWeight: FontWeight.w500,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

// Seller Role Screen
class SellerRoleScreen extends StatelessWidget {
  const SellerRoleScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isMobile = ResponsiveHelper.isMobile(context);
    
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFF1A1A1A),
              Color(0xFF2D1B29),
            ],
          ),
        ),
        child: Stack(
          fit: StackFit.expand,
          children: [
            Container(
              color: const Color(0xFF2D1B29),
            ),
            Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/normal.png'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SafeArea(
              child: SingleChildScrollView(
                padding: ResponsiveHelper.responsivePadding(context).copyWith(bottom: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Seller Role',
                      style: GoogleFonts.inter(
                        color: Colors.grey,
                        fontSize: ResponsiveHelper.responsiveFontSize(context, mobile: 14, tablet: 16, desktop: 18),
                      ),
                    ),
                    const SizedBox(height: 48),
                    Text(
                      'Hello, Sayan',
                      style: GoogleFonts.oswald(
                        fontSize: ResponsiveHelper.responsiveFontSize(context, mobile: 30, tablet: 36, desktop: 42),
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 12),
                    Text(
                      'Here You can sell and buy second-\nhand car',
                      style: GoogleFonts.inter(
                        fontSize: ResponsiveHelper.responsiveFontSize(context, mobile: 16, tablet: 18, desktop: 20),
                        color: Colors.white70,
                      ),
                    ),
                    const SizedBox(height: 48),
                    Text(
                      'what would you like to do?',
                      style: GoogleFonts.oswald(
                        fontSize: ResponsiveHelper.responsiveFontSize(context, mobile: 16, tablet: 18, desktop: 20),
                        color: Colors.white,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    const SizedBox(height: 24),
                    Container(
                      padding: EdgeInsets.all(isMobile ? 20 : 28),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.1),
                            blurRadius: 8,
                            offset: const Offset(0, 4),
                          ),
                        ],
                      ),
                      child: Row(
                        children: [
                          Container(
                            padding: const EdgeInsets.all(10),
                            decoration: const BoxDecoration(
                              color: Color(0xFFE94560),
                              shape: BoxShape.circle,
                            ),
                            child: const Icon(
                              Icons.favorite_border,
                              color: Colors.white,
                              size: 24,
                            ),
                          ),
                          SizedBox(width: isMobile ? 16 : 20),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'For seller',
                                  style: GoogleFonts.oswald(
                                    fontSize: ResponsiveHelper.responsiveFontSize(context, mobile: 18, tablet: 20, desktop: 22),
                                    fontWeight: FontWeight.w600,
                                    color: Colors.black,
                                  ),
                                ),
                                const SizedBox(height: 6),
                                Text(
                                  'Get the best price for your\ncar instantly',
                                  style: GoogleFonts.inter(
                                    fontSize: ResponsiveHelper.responsiveFontSize(context, mobile: 14, tablet: 16, desktop: 18),
                                    color: Colors.black54,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.all(10),
                            decoration: const BoxDecoration(
                              color: Color(0xFFE94560),
                              shape: BoxShape.circle,
                            ),
                            child: const Icon(
                              Icons.arrow_forward_ios,
                              color: Colors.white,
                              size: 18,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 48),
                    Container(
                      width: double.infinity,
                      padding: EdgeInsets.all(isMobile ? 24 : 36),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(24),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.1),
                            blurRadius: 15,
                            offset: const Offset(0, 5),
                          ),
                        ],
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            'Seller Verification',
                            style: GoogleFonts.oswald(
                              fontSize: ResponsiveHelper.responsiveFontSize(context, mobile: 24, tablet: 28, desktop: 32),
                              fontWeight: FontWeight.w600,
                              color: Colors.black,
                            ),
                          ),
                          SizedBox(height: isMobile ? 20 : 32),
                          _buildUploadOption(
                            'KYC Upload',
                            fontSize: ResponsiveHelper.responsiveFontSize(context, mobile: 14, tablet: 16, desktop: 18),
                            fontFamily: 'Inter',
                          ),
                          SizedBox(height: isMobile ? 16 : 20),
                          _buildUploadOption(
                            'Aadhaar or DL',
                            fontSize: ResponsiveHelper.responsiveFontSize(context, mobile: 12, tablet: 14, desktop: 16),
                            fontFamily: 'Inter',
                          ),
                          SizedBox(height: isMobile ? 16 : 20),
                          _buildUploadOption(
                            'Selfie',
                            fontSize: ResponsiveHelper.responsiveFontSize(context, mobile: 12, tablet: 14, desktop: 16),
                            fontFamily: 'Inter',
                          ),
                          SizedBox(height: isMobile ? 20 : 32),
                          SizedBox(
                            width: double.infinity,
                            height: ResponsiveHelper.getResponsiveValue(context, mobile: 52, tablet: 56, desktop: 60),
                            child: ElevatedButton(
                              onPressed: () {},
                              style: ElevatedButton.styleFrom(
                                backgroundColor: const Color(0xFFE94560),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(28),
                                ),
                                elevation: 0,
                              ),
                              child: Text(
                                'Complete Verification',
                                style: GoogleFonts.inter(
                                  fontSize: ResponsiveHelper.responsiveFontSize(context, mobile: 16, tablet: 18, desktop: 20),
                                  fontWeight: FontWeight.w500,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 36),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}