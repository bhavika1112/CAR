import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class VipCarListingPage extends StatelessWidget {
  const VipCarListingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          '9:41',
          style: GoogleFonts.inter(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: Colors.black,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
           // Car Image Section
        Container(
          height: 250,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            image: DecorationImage(
              image: AssetImage("assets\vip.png"),
              fit: BoxFit.cover,
            ),
          ),
        ),

            
            // Car Title and Price
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Aston Martin DB11',
                    style: GoogleFonts.inter(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      Text(
                        '13.29 Crore',
                        style: GoogleFonts.inter(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                          color: Colors.black,
                        ),
                      ),
                      const SizedBox(width: 12),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                        decoration: BoxDecoration(
                          color: const Color(0xFFE8F5E8),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Text(
                          'AI Price: Good Deal',
                          style: GoogleFonts.inter(
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                            color: const Color(0xFF2E7D32),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            
            // Divider
            Container(height: 8, color: const Color(0xFFF5F5F5)),
            
            // Description Section
            _buildSection(
              title: 'Description',
              content: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildBulletPoint('Exquisite Aston Martin DB11 featuring a 4.0 L twin-turbo V8 engine paired with an 8-speed automatic transmission.'),
                  _buildBulletPoint('Single owner, driven only 16,000 km, finished in pristine condition inside and out.'),
                  _buildBulletPoint('2+2 grand tourer design offering a perfect balance of comfort and performance.'),
                  _buildBulletPoint('0-100 km/h in around 4.0 seconds with a top speed of up to 300 km/h.'),
                  _buildBulletPoint('Rear-wheel drive, adaptive suspension, and drive mode selector for dynamic control.'),
                  _buildBulletPoint('Luxurious hand-crafted interior with premium leather, brushed aluminium trim, and advanced infotainment system.'),
                  _buildBulletPoint('Recently serviced, with new tyres and a full authorized service record.'),
                  _buildBulletPoint('No accident history, meticulously maintained and regularly detailed.'),
                  _buildBulletPoint('A true British luxury GT, ideal for high-speed touring and city cruising alike.'),
                ],
              ),
            ),
            
            // Divider
            Container(height: 8, color: const Color(0xFFF5F5F5)),
            
            // Car Condition Overview
            _buildCarConditionSection(),
            
            // Divider
            Container(height: 8, color: const Color(0xFFF5F5F5)),
            
            // Uploaded Documents
            _buildUploadedDocumentsSection(),
            
            // Divider
            Container(height: 8, color: const Color(0xFFF5F5F5)),
            
            // Service History
            _buildServiceHistorySection(),
            
            // Divider
            Container(height: 8, color: const Color(0xFFF5F5F5)),
            
            // Seller Information
            _buildSellerInformationSection(),
            
            const SizedBox(height: 32),
            
            // Action Buttons
            _buildActionButtons(),
            
            const SizedBox(height: 32),
          ],
        ),
      ),
    );
  }

  Widget _buildSection({required String title, required Widget content}) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: GoogleFonts.inter(
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: Colors.black,
            ),
          ),
          const SizedBox(height: 12),
          content,
        ],
      ),
    );
  }

  Widget _buildBulletPoint(String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '• ',
            style: GoogleFonts.inter(
              fontSize: 14,
              color: Colors.black87,
            ),
          ),
          Expanded(
            child: Text(
              text,
              style: GoogleFonts.inter(
                fontSize: 14,
                color: Colors.black87,
                height: 1.5,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCarConditionSection() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Car Condition Overview',
            style: GoogleFonts.inter(
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: Colors.black,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            'Based on a 200-point inspection',
            style: GoogleFonts.inter(
              fontSize: 12,
              color: Colors.grey[600],
            ),
          ),
          const SizedBox(height: 16),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: [
              _buildConditionItem('Core structure is intact', 'verified'),
              _buildConditionItem('Verified odometer', 'verified'),
              _buildConditionItem('No flood damage', 'verified'),
              _buildConditionItem('Drivetrain', 'verified'),
              _buildConditionItem('Engine in good condition', 'verified'),
              _buildConditionItem('Interior is in good shape', 'verified'),
              _buildConditionItem('Minor scratches present', 'warning'),
              _buildConditionItem('Solid body structure', 'verified'),
              _buildConditionItem('Mechanical', 'verified'),
              _buildConditionItem('Minor dents present', 'warning'),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildConditionItem(String text, String type) {
    Color borderColor;
    Color bgColor;
    IconData icon;
    Color iconColor;

    if (type == 'verified') {
      borderColor = const Color(0xFFEFEBEB);
      bgColor = const Color(0xFFFDF6F6);
      icon = Icons.check_circle;
      iconColor = Colors.black;
    } else if (type == 'warning') {
      borderColor = const Color(0xFFFFF3E0);
      bgColor = const Color(0xFFFFF8E1);
      icon = Icons.warning;
      iconColor = Colors.amber[800]!;
    } else {
      borderColor = const Color(0xFFE0E0E0);
      bgColor = Colors.white;
      icon = Icons.circle;
      iconColor = Colors.grey;
    }

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: bgColor,
        border: Border.all(color: borderColor),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 16, color: iconColor),
          const SizedBox(width: 6),
          Text(
            text,
            style: GoogleFonts.inter(
              fontSize: 13,
              fontWeight: FontWeight.w500,
              color: Colors.black,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildUploadedDocumentsSection() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Uploaded Documents',
            style: GoogleFonts.inter(
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: Colors.black,
            ),
          ),
          const SizedBox(height: 16),

          // Documents List
          Column(
            children: [
              _buildDocItem('RC (Registration Certificate)', 'Available', Colors.grey[200]!, Colors.black54),
              const SizedBox(height: 10),
              _buildDocItem('Insurance', 'Valid till Dec 2024', const Color(0xFFFFEBEE), const Color(0xFFD32F2F)),
              const SizedBox(height: 10),
              _buildDocItem('PUC Certificate', 'Valid till Jan 2025', const Color(0xFFFFEBEE), const Color(0xFFD32F2F)),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildDocItem(String title, String status, Color bgColor, Color textColor) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: const Color(0xFFE0E0E0)),
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.03),
            blurRadius: 6,
            offset: const Offset(0, 1),
          ),
        ],
      ),
      child: Row(
        children: [
          const Icon(Icons.description_outlined, size: 22, color: Colors.black54),
          const SizedBox(width: 16),
          Expanded(
            child: Text(
              title,
              style: GoogleFonts.inter(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: Colors.black87,
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
            decoration: BoxDecoration(
              color: bgColor,
              borderRadius: BorderRadius.circular(16),
            ),
            child: Text(
              status,
              style: GoogleFonts.inter(
                fontSize: 12,
                fontWeight: FontWeight.w500,
                color: textColor,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildServiceHistorySection() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: const Color(0xFFE0E0E0)),
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.03),
              blurRadius: 6,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Service History',
              style: GoogleFonts.inter(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 12),
            Text(
              'Service history will be available once you book a visit or make a purchase.',
              style: GoogleFonts.inter(
                fontSize: 14,
                color: const Color(0xFF666666),
                height: 1.5,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSellerInformationSection() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: const Color(0xFFE0E0E0)),
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.03),
              blurRadius: 6,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Seller Information',
              style: GoogleFonts.inter(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 12),
            Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Rajesh Kumar: Individual',
                        style: GoogleFonts.inter(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Colors.black,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Row(
                        children: [
                          Icon(Icons.verified_user, color: Colors.green[700], size: 16),
                          const SizedBox(width: 6),
                          Text(
                            'Verified Seller',
                            style: GoogleFonts.inter(
                              fontSize: 13,
                              fontWeight: FontWeight.w500,
                              color: Colors.green[700],
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 6),
                      Row(
                        children: [
                          const Icon(Icons.star, size: 16, color: Colors.amber),
                          const SizedBox(width: 4),
                          Text(
                            'Trust Score: 4.5/5',
                            style: GoogleFonts.inter(
                              fontSize: 13,
                              color: Colors.black87,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildActionButtons() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Row(
        children: [
          Expanded(
            child: MouseRegion(
              cursor: SystemMouseCursors.click,
              child: Container(
                height: 56,
                decoration: BoxDecoration(
                  border: Border.all(color: const Color(0xFFE0E0E0)),
                  borderRadius: BorderRadius.circular(12),
                  color: Colors.white,
                ),
                child: Material(
                  color: Colors.transparent,
                  child: InkWell(
                    borderRadius: BorderRadius.circular(12),
                    onTap: () {},
                    onHover: (hovering) {},
                    child: Center(
                      child: Text(
                        'Book Visit',
                        style: GoogleFonts.inter(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: MouseRegion(
              cursor: SystemMouseCursors.click,
              child: Container(
                height: 56,
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      blurRadius: 8,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                child: Material(
                  color: Colors.transparent,
                  child: InkWell(
                    borderRadius: BorderRadius.circular(12),
                    onTap: () {},
                    onHover: (hovering) {},
                    child: Center(
                      child: Text(
                        'Buy Now',
                        style: GoogleFonts.inter(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}