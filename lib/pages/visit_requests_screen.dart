import 'package:flutter/material.dart';
import 'responsive_helper.dart';

class VisitRequestsScreen extends StatefulWidget {
  const VisitRequestsScreen({Key? key}) : super(key: key);

  @override
  State<VisitRequestsScreen> createState() => _VisitRequestsScreenState();
}

class _VisitRequestsScreenState extends State<VisitRequestsScreen> {
  int selectedTab = 0;
  String selectedFilter = 'All';

  final List<VisitRequest> visitRequests = [
    VisitRequest(
      buyerName: 'Amit Patel',
      carModel: 'Honda City 2019',
      date: 'Dec 15, 2024',
      time: '2:00 PM',
      phone: '+91 98765 43210',
      bookingFee: '₹99',
      documents: ['RC', 'Insurance', 'PUC'],
      status: 'pending',
    ),
    VisitRequest(
      buyerName: 'Amit Patel',
      carModel: 'Honda City 2019',
      date: 'Dec 15, 2024',
      time: '2:00 PM',
      phone: '+91 98765 43210',
      bookingFee: '₹99',
      documents: ['RC', 'Insurance', 'PUC'],
      status: 'confirmed',
    ),
    VisitRequest(
      buyerName: 'Amit Patel',
      carModel: 'Honda City 2019',
      date: 'Dec 15, 2024',
      time: '2:00 PM',
      phone: '+91 98765 43210',
      bookingFee: '₹99',
      documents: ['RC', 'Insurance', 'PUC'],
      status: 'completed',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final isMobile = ResponsiveHelper.isMobile(context);
    
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Seller Dashboard',
              style: TextStyle(
                color: Colors.black,
                fontSize: ResponsiveHelper.responsiveFontSize(context, mobile: 14, tablet: 16, desktop: 18),
                fontWeight: FontWeight.w600,
                fontFamily: 'Poppins',
              ),
            ),
            const SizedBox(height: 2),
            Text(
              'Manage your car listings and track performance',
              style: TextStyle(
                color: Colors.grey[600],
                fontSize: ResponsiveHelper.responsiveFontSize(context, mobile: 10, tablet: 12, desktop: 14),
                fontWeight: FontWeight.w400,
                fontFamily: 'Poppins',
              ),
            ),
          ],
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16),
            child: Row(
              children: [
                const Icon(Icons.person_outline, color: Colors.black, size: 16),
                const SizedBox(width: 4),
                Text(
                  'John Seller',
                  style: TextStyle(
                    color: Colors.grey[700],
                    fontSize: ResponsiveHelper.responsiveFontSize(context, mobile: 10, tablet: 12, desktop: 14),
                    fontWeight: FontWeight.w500,
                    fontFamily: 'Poppins',
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          // Stats Cards
          Container(
            color: Colors.white,
            padding: ResponsiveHelper.responsivePadding(context),
            child: isMobile
                ? SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: _buildStatCards(),
                    ),
                  )
                : Wrap(
                    spacing: 12,
                    runSpacing: 12,
                    children: _buildStatCards(),
                  ),
          ),
          
          // Navigation Tabs
          Container(
            color: const Color(0xFFF1F5F9),
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  _buildNavTab('My Listings', false),
                  _buildNavTab('Add New Car', false),
                  _buildNavTab('Visit Requests', true),
                  _buildNavTab('Payment Status', false),
                  _buildNavTab('Profile / KYC', false),
                ],
              ),
            ),
          ),
          
          // Content
          Expanded(
            child: SingleChildScrollView(
              padding: ResponsiveHelper.responsivePadding(context),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Visit Requests Management',
                    style: TextStyle(
                      fontSize: ResponsiveHelper.responsiveFontSize(context, mobile: 16, tablet: 18, desktop: 20),
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                      fontFamily: 'Poppins',
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    'Accept or reject visit requests, view booking details, and confirm successful visits',
                    style: TextStyle(
                      fontSize: ResponsiveHelper.responsiveFontSize(context, mobile: 10, tablet: 12, desktop: 14),
                      color: Colors.grey[600],
                      fontFamily: 'Poppins',
                    ),
                  ),
                  const SizedBox(height: 16),
                  
                  // Filter Tabs
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        _buildFilterTab('All', 3),
                        const SizedBox(width: 8),
                        _buildFilterTab('Pending', 1),
                        const SizedBox(width: 8),
                        _buildFilterTab('Confirmed', 1),
                        const SizedBox(width: 8),
                        _buildFilterTab('Completed', 1),
                      ],
                    ),
                  ),
                  const SizedBox(height: 16),
                  
                  // Visit Request Cards
                  ...visitRequests.map((request) => Padding(
                    padding: const EdgeInsets.only(bottom: 16),
                    child: _buildVisitRequestCard(request, context),
                  )),
                ],
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: _buildBottomNavBar(2),
      floatingActionButton: isMobile ? Stack(
        children: [
          Positioned(
            left: 30,
            bottom: 0,
            child: FloatingActionButton(
              onPressed: () {},
              backgroundColor: Colors.red,
              mini: true,
              child: const Icon(Icons.close, color: Colors.white, size: 20),
            ),
          ),
          Positioned(
            right: 0,
            bottom: 0,
            child: FloatingActionButton(
              onPressed: () {},
              backgroundColor: Colors.red,
              mini: true,
              child: const Icon(Icons.add, color: Colors.white, size: 20),
            ),
          ),
        ],
      ) : null,
      floatingActionButtonLocation: isMobile ? FloatingActionButtonLocation.centerDocked : null,
    );
  }

  List<Widget> _buildStatCards() {
    return [
      _buildStatCard('Active Listings', '3', Icons.list_alt_outlined),
      const SizedBox(width: 12),
      _buildStatCard('Total Views', '468', Icons.remove_red_eye_outlined),
      const SizedBox(width: 12),
      _buildStatCard('Visit Requests', '2', Icons.calendar_today_outlined),
      const SizedBox(width: 12),
      _buildStatCard('Cars Sold', '1', Icons.check_circle_outline),
    ];
  }

  Widget _buildStatCard(String label, String value, IconData icon) {
    return Container(
      width: ResponsiveHelper.getResponsiveValue(
        context, 
        mobile: 100, 
        tablet: 120, 
        desktop: 140
      ),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: const Color(0xFFF8F8F8),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(icon, size: 14, color: Colors.grey[600]),
              const SizedBox(width: 4),
              Expanded(
                child: Text(
                  label,
                  style: TextStyle(
                    fontSize: ResponsiveHelper.responsiveFontSize(context, mobile: 10, tablet: 12, desktop: 14),
                    color: Colors.grey[600],
                    fontWeight: FontWeight.w500,
                    fontFamily: 'Poppins',
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
          const SizedBox(height: 4),
          Text(
            value,
            style: TextStyle(
              fontSize: ResponsiveHelper.responsiveFontSize(context, mobile: 16, tablet: 18, desktop: 20),
              fontWeight: FontWeight.w700,
              color: Colors.black,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildNavTab(String label, bool isActive) {
    return Container(
      margin: const EdgeInsets.only(right: 8),
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: isActive ? Colors.white : const Color(0xFFF1F5F9),
        borderRadius: BorderRadius.circular(6),
      ),
      child: Text(
        label,
        style: TextStyle(
          fontSize: ResponsiveHelper.responsiveFontSize(context, mobile: 10, tablet: 12, desktop: 14),
          fontWeight: isActive ? FontWeight.w600 : FontWeight.w500,
          color: isActive ? Colors.blue : Colors.grey[600],
          fontFamily: 'Poppins',
        ),
      ),
    );
  }

  Widget _buildFilterTab(String label, int count) {
    final isSelected = selectedFilter == label;
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedFilter = label;
        });
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          color: isSelected ? Colors.blue : Colors.white,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: isSelected ? Colors.blue : Colors.grey[300]!,
          ),
        ),
        child: Text(
          '$label ($count)',
          style: TextStyle(
            fontSize: ResponsiveHelper.responsiveFontSize(context, mobile: 10, tablet: 12, desktop: 14),
            fontWeight: FontWeight.w500,
            color: isSelected ? Colors.white : Colors.grey[700],
            fontFamily: 'Poppins',
          ),
        ),
      ),
    );
  }

  Widget _buildVisitRequestCard(VisitRequest request, BuildContext context) {
    final isMobile = ResponsiveHelper.isMobile(context);
    final isExpanded = true;
    
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header
          Padding(
            padding: EdgeInsets.all(isMobile ? 12 : 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      request.buyerName,
                      style: TextStyle(
                        fontSize: ResponsiveHelper.responsiveFontSize(context, mobile: 14, tablet: 16, desktop: 18),
                        fontWeight: FontWeight.w600,
                        color: Colors.black,
                        fontFamily: 'Poppins',
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                      decoration: BoxDecoration(
                        color: _getStatusColor(request.status).withOpacity(0.1),
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: Text(
                        request.status,
                        style: TextStyle(
                          fontSize: ResponsiveHelper.responsiveFontSize(context, mobile: 10, tablet: 12, desktop: 14),
                          fontWeight: FontWeight.w500,
                          color: _getStatusColor(request.status),
                          fontFamily: 'Poppins',
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                Text(
                  request.carModel,
                  style: TextStyle(
                    fontSize: ResponsiveHelper.responsiveFontSize(context, mobile: 12, tablet: 14, desktop: 16),
                    color: Colors.grey[700],
                    fontFamily: 'Poppins',
                  ),
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    Icon(Icons.calendar_today, size: 14, color: Colors.grey[600]),
                    const SizedBox(width: 4),
                    Text(
                      request.date,
                      style: TextStyle(
                        fontSize: ResponsiveHelper.responsiveFontSize(context, mobile: 10, tablet: 12, desktop: 14),
                        color: Colors.grey[600],
                        fontFamily: 'Poppins',
                      ),
                    ),
                    const SizedBox(width: 16),
                    Icon(Icons.access_time, size: 14, color: Colors.grey[600]),
                    const SizedBox(width: 4),
                    Text(
                      request.time,
                      style: TextStyle(
                        fontSize: ResponsiveHelper.responsiveFontSize(context, mobile: 10, tablet: 12, desktop: 14),
                        color: Colors.grey[600],
                        fontFamily: 'Poppins',
                      ),
                    ),
                    const Spacer(),
                    Icon(
                      isExpanded ? Icons.keyboard_arrow_up : Icons.keyboard_arrow_down,
                      color: Colors.grey[600],
                    ),
                  ],
                ),
              ],
            ),
          ),
          
          // Expandable Details
          if (isExpanded) ...[
            const Divider(height: 1),
            Padding(
              padding: EdgeInsets.all(isMobile ? 12 : 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Buyer Contact',
                    style: TextStyle(
                      fontSize: ResponsiveHelper.responsiveFontSize(context, mobile: 12, tablet: 14, desktop: 16),
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                      fontFamily: 'Poppins',
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    request.buyerName,
                    style: TextStyle(
                      fontSize: ResponsiveHelper.responsiveFontSize(context, mobile: 12, tablet: 14, desktop: 16),
                      color: Colors.grey[700],
                      fontFamily: 'Poppins',
                    ),
                  ),
                  Text(
                    request.phone,
                    style: TextStyle(
                      fontSize: ResponsiveHelper.responsiveFontSize(context, mobile: 10, tablet: 12, desktop: 14),
                      color: Colors.grey[600],
                      fontFamily: 'Poppins',
                    ),
                  ),
                  const SizedBox(height: 12),
                  Row(
                    children: [
                      Expanded(
                        child: OutlinedButton.icon(
                          onPressed: () {},
                          icon: const Icon(Icons.phone, size: 16),
                          label: Text(
                            'Call',
                            style: TextStyle(
                              fontSize: ResponsiveHelper.responsiveFontSize(context, mobile: 12, tablet: 14, desktop: 16),
                            ),
                          ),
                          style: OutlinedButton.styleFrom(
                            foregroundColor: Colors.black,
                            side: BorderSide(color: Colors.grey[300]!),
                            padding: const EdgeInsets.symmetric(vertical: 12),
                          ),
                        ),
                      ),
                      const SizedBox(width: 8),
                      Expanded(
                        child: OutlinedButton.icon(
                          onPressed: () {},
                          icon: const Icon(Icons.chat_bubble_outline, size: 16),
                          label: Text(
                            'Chat',
                            style: TextStyle(
                              fontSize: ResponsiveHelper.responsiveFontSize(context, mobile: 12, tablet: 14, desktop: 16),
                            ),
                          ),
                          style: OutlinedButton.styleFrom(
                            foregroundColor: Colors.black,
                            side: BorderSide(color: Colors.grey[300]!),
                            padding: const EdgeInsets.symmetric(vertical: 12),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'Booking Details',
                    style: TextStyle(
                      fontSize: ResponsiveHelper.responsiveFontSize(context, mobile: 12, tablet: 14, desktop: 16),
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                      fontFamily: 'Poppins',
                    ),
                  ),
                  const SizedBox(height: 8),
                  isMobile 
                      ? Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Booking Fee Paid:',
                                  style: TextStyle(
                                    fontSize: ResponsiveHelper.responsiveFontSize(context, mobile: 10, tablet: 12, desktop: 14),
                                    color: Colors.grey[600],
                                    fontFamily: 'Poppins',
                                  ),
                                ),
                                const SizedBox(height: 4),
                                Text(
                                  request.bookingFee,
                                  style: TextStyle(
                                    fontSize: ResponsiveHelper.responsiveFontSize(context, mobile: 14, tablet: 16, desktop: 18),
                                    fontWeight: FontWeight.w600,
                                    color: Colors.black,
                                    fontFamily: 'Poppins',
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 12),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Documents Uploaded:',
                                  style: TextStyle(
                                    fontSize: ResponsiveHelper.responsiveFontSize(context, mobile: 10, tablet: 12, desktop: 14),
                                    color: Colors.grey[600],
                                    fontFamily: 'Poppins',
                                  ),
                                ),
                                const SizedBox(height: 4),
                                Wrap(
                                  spacing: 4,
                                  runSpacing: 4,
                                  children: request.documents.map((doc) => 
                                    Container(
                                      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                                      decoration: BoxDecoration(
                                        color: Colors.grey[200],
                                        borderRadius: BorderRadius.circular(4),
                                      ),
                                      child: Text(
                                        doc,
                                        style: TextStyle(
                                          fontSize: ResponsiveHelper.responsiveFontSize(context, mobile: 8, tablet: 10, desktop: 12),
                                          fontWeight: FontWeight.w500,
                                          color: Colors.black,
                                          fontFamily: 'Poppins',
                                        ),
                                      ),
                                    ),
                                  ).toList(),
                                ),
                              ],
                            ),
                          ],
                        )
                      : Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Booking Fee Paid:',
                                    style: TextStyle(
                                      fontSize: ResponsiveHelper.responsiveFontSize(context, mobile: 10, tablet: 12, desktop: 14),
                                      color: Colors.grey[600],
                                      fontFamily: 'Poppins',
                                    ),
                                  ),
                                  const SizedBox(height: 4),
                                  Text(
                                    request.bookingFee,
                                    style: TextStyle(
                                      fontSize: ResponsiveHelper.responsiveFontSize(context, mobile: 14, tablet: 16, desktop: 18),
                                      fontWeight: FontWeight.w600,
                                      color: Colors.black,
                                      fontFamily: 'Poppins',
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Documents Uploaded:',
                                    style: TextStyle(
                                      fontSize: ResponsiveHelper.responsiveFontSize(context, mobile: 10, tablet: 12, desktop: 14),
                                      color: Colors.grey[600],
                                      fontFamily: 'Poppins',
                                    ),
                                  ),
                                  const SizedBox(height: 4),
                                  Wrap(
                                    spacing: 4,
                                    runSpacing: 4,
                                    children: request.documents.map((doc) => 
                                      Container(
                                        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                                        decoration: BoxDecoration(
                                          color: Colors.grey[200],
                                          borderRadius: BorderRadius.circular(4),
                                        ),
                                        child: Text(
                                          doc,
                                          style: TextStyle(
                                            fontSize: ResponsiveHelper.responsiveFontSize(context, mobile: 8, tablet: 10, desktop: 12),
                                            fontWeight: FontWeight.w500,
                                            color: Colors.black,
                                            fontFamily: 'Poppins',
                                          ),
                                        ),
                                      ),
                                    ).toList(),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                  const SizedBox(height: 16),
                  
                  // Action Buttons based on status
                  if (request.status == 'pending') ...[
                    Row(
                      children: [
                        Expanded(
                          child: ElevatedButton.icon(
                            onPressed: () {},
                            icon: const Icon(Icons.check, size: 18),
                            label: Text(
                              'Accept',
                              style: TextStyle(
                                fontSize: ResponsiveHelper.responsiveFontSize(context, mobile: 12, tablet: 14, desktop: 16),
                              ),
                            ),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.green,
                              foregroundColor: Colors.white,
                              padding: const EdgeInsets.symmetric(vertical: 14),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: 8),
                        Expanded(
                          child: OutlinedButton.icon(
                            onPressed: () {},
                            icon: const Icon(Icons.close, size: 18),
                            label: Text(
                              'Reject',
                              style: TextStyle(
                                fontSize: ResponsiveHelper.responsiveFontSize(context, mobile: 12, tablet: 14, desktop: 16),
                              ),
                            ),
                            style: OutlinedButton.styleFrom(
                              foregroundColor: Colors.red,
                              side: const BorderSide(color: Colors.red),
                              padding: const EdgeInsets.symmetric(vertical: 14),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ] else if (request.status == 'confirmed') ...[
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blue,
                          foregroundColor: Colors.white,
                          padding: const EdgeInsets.symmetric(vertical: 14),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        child: Text(
                          'Mark as Completed',
                          style: TextStyle(
                            fontSize: ResponsiveHelper.responsiveFontSize(context, mobile: 12, tablet: 14, desktop: 16),
                            fontWeight: FontWeight.w600,
                            fontFamily: 'Poppins',
                          ),
                        ),
                      ),
                    ),
                  ] else if (request.status == 'completed') ...[
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton.icon(
                        onPressed: () {},
                        icon: const Icon(Icons.check_circle, size: 18),
                        label: Text(
                          'Visit Completed',
                          style: TextStyle(
                            fontSize: ResponsiveHelper.responsiveFontSize(context, mobile: 12, tablet: 14, desktop: 16),
                          ),
                        ),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.green,
                          foregroundColor: Colors.white,
                          padding: const EdgeInsets.symmetric(vertical: 14),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                      ),
                    ),
                  ],
                ],
              ),
            ),
          ],
        ],
      ),
    );
  }

  Color _getStatusColor(String status) {
    switch (status.toLowerCase()) {
      case 'pending':
        return Colors.orange;
      case 'confirmed':
        return Colors.blue;
      case 'completed':
        return Colors.green;
      default:
        return Colors.grey;
    }
  }

  Widget _buildBottomNavBar(int currentIndex) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, -2),
          ),
        ],
      ),
      child: BottomNavigationBar(
        currentIndex: currentIndex,
        selectedItemColor: Colors.red,
        unselectedItemColor: Colors.grey,
        type: BottomNavigationBarType.fixed,
        selectedFontSize: 12,
        unselectedFontSize: 12,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home_outlined), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.shopping_bag_outlined), label: 'Buy'),
          BottomNavigationBarItem(icon: Icon(Icons.sell_outlined), label: 'Sell'),
          BottomNavigationBarItem(icon: Icon(Icons.chat_bubble_outline), label: 'Chat'),
        ],
        onTap: (index) {
          // Handle navigation
        },
      ),
    );
  }
}

class VisitRequest {
  final String buyerName;
  final String carModel;
  final String date;
  final String time;
  final String phone;
  final String bookingFee;
  final List<String> documents;
  final String status;

  VisitRequest({
    required this.buyerName,
    required this.carModel,
    required this.date,
    required this.time,
    required this.phone,
    required this.bookingFee,
    required this.documents,
    required this.status,
  });
}