import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'responsive_helper.dart';

class CarListingBase extends StatelessWidget {
  final List<String> smallImages;
  final String mainImage;
  final List<String> descriptionPoints;
  final bool isVip;

  const CarListingBase({
    super.key,
    required this.smallImages,
    required this.mainImage,
    required this.descriptionPoints,
    this.isVip = false,
  });

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
            fontSize: ResponsiveHelper.responsiveFontSize(context, mobile: 14, tablet: 16, desktop: 18),
            fontWeight: FontWeight.w600,
            color: Colors.black,
          ),
        ),
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          return SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(minHeight: constraints.maxHeight),
              child: IntrinsicHeight(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildImageSection(context),
                    _buildTitleAndPrice(context),
                    _divider(),
                    _buildDescription(context),
                    _divider(),
                    _buildConditionSection(context),
                    _divider(),
                    _buildDocuments(context),
                    _divider(),
                    _buildServiceHistory(context),
                    _divider(),
                    _buildSellerInfo(context),
                    SizedBox(height: ResponsiveHelper.getResponsiveValue(context, mobile: 16, tablet: 24, desktop: 32)),
                    _buildActionButtons(context),
                    SizedBox(height: ResponsiveHelper.getResponsiveValue(context, mobile: 16, tablet: 24, desktop: 32)),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _divider() => Container(height: 8, color: const Color(0xFFF5F5F5));

  Widget _buildImageSection(BuildContext context) {
    final isMobile = ResponsiveHelper.isMobile(context);
    return Padding(
      padding: ResponsiveHelper.responsivePadding(context),
      child: isMobile ? _buildMobileImageSection() : _buildDesktopImageSection(),
    );
  }

  Widget _buildMobileImageSection() {
    return Column(
      children: [
        Container(
          height: 250,
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            image: DecorationImage(image: AssetImage(mainImage), fit: BoxFit.cover),
          ),
        ),
        const SizedBox(height: 12),
        SizedBox(
          height: 80,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: smallImages.length,
            itemBuilder: (context, index) => Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: _smallImage(smallImages[index]),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildDesktopImageSection() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          flex: 1,
          child: Column(
            children: smallImages
                .map((image) => Padding(
                      padding: const EdgeInsets.only(bottom: 8.0),
                      child: _smallImage(image),
                    ))
                .toList(),
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          flex: 2,
          child: Container(
            height: 250,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              image: DecorationImage(image: AssetImage(mainImage), fit: BoxFit.cover),
            ),
          ),
        ),
      ],
    );
  }

  Widget _smallImage(String path) {
    return Container(
      height: 80,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        image: DecorationImage(image: AssetImage(path), fit: BoxFit.cover),
        border: Border.all(color: const Color(0xFFE0E0E0), width: 1),
      ),
    );
  }

  Widget _buildTitleAndPrice(BuildContext context) {
    return Padding(
      padding: ResponsiveHelper.responsivePadding(context),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Aston Martin DB11',
            style: GoogleFonts.oswald(
              fontSize: ResponsiveHelper.responsiveFontSize(context, mobile: 20, tablet: 24, desktop: 28),
              fontWeight: FontWeight.w600,
              color: Colors.black,
            ),
          ),
          const SizedBox(height: 8),
          Wrap(
            spacing: 12,
            crossAxisAlignment: WrapCrossAlignment.center,
            children: [
              Text(
                '₹3.29 Crore',
                style: GoogleFonts.inter(
                  fontSize: ResponsiveHelper.responsiveFontSize(context, mobile: 18, tablet: 20, desktop: 22),
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                decoration: BoxDecoration(
                  color: const Color(0xFFE8F5E8),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Text(
                  'AI Price: Good Deal',
                  style: GoogleFonts.inter(
                    fontSize: ResponsiveHelper.responsiveFontSize(context, mobile: 10, tablet: 12, desktop: 14),
                    fontWeight: FontWeight.w500,
                    color: const Color(0xFF2E7D32),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildDescription(BuildContext context) {
    return _section(
      context,
      title: 'Description',
      useOswald: true,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: descriptionPoints.map((point) => _bulletPoint(context, point)).toList(),
      ),
    );
  }

  Widget _section(BuildContext context, {required String title, required Widget child, bool useOswald = false}) {
    return Padding(
      padding: ResponsiveHelper.responsivePadding(context),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: useOswald
                ? GoogleFonts.oswald(fontSize: ResponsiveHelper.responsiveFontSize(context, mobile: 18, tablet: 20, desktop: 22), fontWeight: FontWeight.w600)
                : GoogleFonts.inter(fontSize: ResponsiveHelper.responsiveFontSize(context, mobile: 16, tablet: 18, desktop: 20), fontWeight: FontWeight.w600),
          ),
          const SizedBox(height: 12),
          child,
        ],
      ),
    );
  }

  Widget _bulletPoint(BuildContext context, String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('• '),
          Expanded(
            child: Text(
              text,
              style: GoogleFonts.poppins(fontSize: ResponsiveHelper.responsiveFontSize(context, mobile: 14, tablet: 15, desktop: 16), height: 1.5),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildConditionSection(BuildContext context) {
    return _section(
      context,
      title: 'Car Condition Overview',
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Based on a 200-point inspection',
            style: GoogleFonts.inter(
              fontSize: ResponsiveHelper.responsiveFontSize(context, mobile: 12, tablet: 14, desktop: 15),
              color: Colors.grey[600],
            ),
          ),
          const SizedBox(height: 16),
          Wrap(spacing: 8, runSpacing: 8, children: _conditionItems(context)),
        ],
      ),
    );
  }

  List<Widget> _conditionItems(BuildContext context) {
    final items = [
      ('Core structure is intact', 'verified'),
      ('Verified odometer', 'verified'),
      ('No flood damage', 'verified'),
      ('Drivetrain', 'verified'),
      ('Engine in good condition', 'verified'),
      ('Interior is in good shape', 'verified'),
      ('Minor scratches present', 'warning'),
      ('Solid body structure', 'verified'),
      ('Mechanical', 'verified'),
      ('Minor dents present', 'warning'),
    ];
    return items.map((item) => _conditionItem(context, item.$1, item.$2)).toList();
  }

  Widget _conditionItem(BuildContext context, String text, String type) {
    final isVerified = type == 'verified';
    final color = isVerified ? const Color(0xFFFFDFE5) : const Color(0xFFEDEDED);
    final icon = isVerified ? Icons.check_circle : Icons.warning;
    final iconColor = isVerified ? Colors.black : Colors.amber[800]!;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: color,
        border: Border.all(color: color),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 16, color: iconColor),
          const SizedBox(width: 6),
          Text(
            text,
            style: GoogleFonts.oswald(
              fontSize: ResponsiveHelper.responsiveFontSize(context, mobile: 13, tablet: 14, desktop: 15),
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDocuments(BuildContext context) {
    return _section(
      context,
      title: 'Uploaded Documents',
      child: Column(
        children: [
          _docItem(context, 'RC (Registration Certificate)', 'Available'),
          const SizedBox(height: 10),
          _docItem(context, 'Insurance', 'Valid till Dec 2024'),
          const SizedBox(height: 10),
          _docItem(context, 'PUC Certificate', 'Valid till Jan 2025'),
        ],
      ),
    );
  }

  Widget _docItem(BuildContext context, String title, String status) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: const Color(0xFFE0E0E0)),
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 6, offset: const Offset(0, 1)),
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
                fontSize: ResponsiveHelper.responsiveFontSize(context, mobile: 14, tablet: 15, desktop: 16),
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
            decoration: BoxDecoration(color: const Color(0xFFE83657), borderRadius: BorderRadius.circular(16)),
            child: Text(
              status,
              style: GoogleFonts.inter(
                fontSize: ResponsiveHelper.responsiveFontSize(context, mobile: 12, tablet: 13, desktop: 14),
                fontWeight: FontWeight.w500,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildServiceHistory(BuildContext context) {
    return Padding(
      padding: ResponsiveHelper.responsivePadding(context),
      child: Container(
        padding: ResponsiveHelper.responsivePadding(context),
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: const Color(0xFFE0E0E0)),
          borderRadius: BorderRadius.circular(12),
          boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.03), blurRadius: 6, offset: const Offset(0, 2))],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Service History',
                style: GoogleFonts.oswald(
                    fontSize: ResponsiveHelper.responsiveFontSize(context, mobile: 18, tablet: 20, desktop: 22),
                    fontWeight: FontWeight.w600)),
            const SizedBox(height: 12),
            Text(
              'Service history will be available once you book a visit or make a purchase.',
              style: GoogleFonts.inter(
                  fontSize: ResponsiveHelper.responsiveFontSize(context, mobile: 14, tablet: 15, desktop: 16),
                  color: const Color(0xFF666666),
                  height: 1.5),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSellerInfo(BuildContext context) {
    return Padding(
      padding: ResponsiveHelper.responsivePadding(context),
      child: Container(
        padding: ResponsiveHelper.responsivePadding(context),
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: const Color(0xFFE0E0E0)),
          borderRadius: BorderRadius.circular(12),
          boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 6, offset: const Offset(0, 2))],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Seller Information',
                style: GoogleFonts.oswald(
                    fontSize: ResponsiveHelper.responsiveFontSize(context, mobile: 18, tablet: 20, desktop: 22),
                    fontWeight: FontWeight.w600)),
            const SizedBox(height: 12),
            Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Rajesh Kumar: Individual',
                          style: GoogleFonts.inter(
                              fontSize: ResponsiveHelper.responsiveFontSize(context, mobile: 16, tablet: 17, desktop: 18),
                              fontWeight: FontWeight.w600)),
                      const SizedBox(height: 8),
                      Row(
                        children: [
                          Icon(Icons.verified_user, color: Colors.green[700], size: 16),
                          const SizedBox(width: 6),
                          Text('Verified Seller',
                              style: GoogleFonts.inter(
                                  fontSize: ResponsiveHelper.responsiveFontSize(context, mobile: 13, tablet: 14, desktop: 15),
                                  fontWeight: FontWeight.w500,
                                  color: Colors.green[700])),
                        ],
                      ),
                      const SizedBox(height: 6),
                      Row(
                        children: [
                          const Icon(Icons.star, size: 16, color: Colors.amber),
                          const SizedBox(width: 4),
                          Text('Trust Score: 4.5/5',
                              style: GoogleFonts.inter(
                                  fontSize: ResponsiveHelper.responsiveFontSize(context, mobile: 13, tablet: 14, desktop: 15))),
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

  Widget _buildActionButtons(BuildContext context) {
    final isMobile = ResponsiveHelper.isMobile(context);
    return Padding(
      padding: ResponsiveHelper.responsivePadding(context),
      child: isMobile
          ? Column(
              children: [
                _actionButton('Book Visit', const Color(0xFFE83657), Colors.white),
                const SizedBox(height: 12),
                _actionButton('Buy Now', Colors.black, Colors.black),
              ],
            )
          : Row(
              children: [
                Expanded(child: _actionButton('Book Visit', const Color(0xFFE83657), Colors.white)),
                const SizedBox(width: 12),
                Expanded(child: _actionButton('Buy Now', Colors.black, Colors.black)),
              ],
            ),
    );
  }

  Widget _actionButton(String text, Color bgColor, Color textColor) {
    return Container(
      height: 56,
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: const Color(0xFFE0E0E0)),
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(12),
          onTap: () {},
          child: Center(
            child: Text(
              text,
              style: GoogleFonts.inter(fontSize: 16, fontWeight: FontWeight.w600, color: textColor == Colors.black ? Colors.white : textColor),
            ),
          ),
        ),
      ),
    );
  }
}
