import 'package:flutter/material.dart';
import 'package:go_fly/feature/boarding/boarding_pass_pages.dart';
import 'package:go_fly/feature/home/home_pages.dart';
import 'package:go_fly/feature/tickets/ticket_pages.dart';
import '../../feature/payment/payment_method_pages.dart';
import '../../feature/seat_selector/seat_selector_pages/seat_selector_pages.dart';
import '../utils/color.dart';
import 'custom_nav_painter.dart';

class CustomBottomNavBar extends StatefulWidget {
  const CustomBottomNavBar({Key? key}) : super(key: key);

  @override
  _CustomBottomNavBarState createState() => _CustomBottomNavBarState();
}

class _CustomBottomNavBarState extends State<CustomBottomNavBar> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
  final List <Widget> _screen=[
    HomeScreen(),
    MyTicketScreen(),
    BoardingPassScreen(),
    SeatSelectorScreen(),
    PaymentMethodScreen()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screen[_selectedIndex],
      bottomNavigationBar:_buildBottomNavigationBar()
    );
  }

  Widget _buildBottomNavigationBar(){
    return Container(
      height: 88,
      color: AppColors.background,
      child: Stack(
        children: [
          CustomPaint(
            size: Size(MediaQuery.of(context).size.width, 88),
            painter: CustomNavPainter(),
          ),
          Center(
            heightFactor: 0.6,
            child: FloatingActionButton(
              onPressed: () => _onItemTapped(0),
              backgroundColor: AppColors.primary,
              foregroundColor: Colors.white,
              elevation: 4.0,
              shape: const CircleBorder(),
              child: const Icon(Icons.home),
            ),
          ),
          Positioned(
            left: 0,
            right: 0,
            top: 15,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildNavItem(Icons.airplane_ticket_outlined, "Tickets", 1),
                _buildNavItem(Icons.receipt_long_outlined, "Bookings", 2),
                const SizedBox(width: 40),
                _buildNavItem(Icons.airline_seat_recline_normal_sharp, "Sit", 3),
                _buildNavItem(Icons.payment, "Payment", 4),
              ],
            ),
          ),
        ],
      ),
    );
  }


  Widget _buildNavItem(IconData icon, String label, int index) {
    bool isSelected = _selectedIndex == index;

    if (index == 0) {
      return GestureDetector(
        onTap: () => _onItemTapped(index),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(height: 50),
            if (isSelected)
              Text(
                label,
                style: const TextStyle(
                  color: AppColors.primary,
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                ),
              ),
          ],
        ),
      );
    }

    return GestureDetector(
      onTap: () => _onItemTapped(index),
      behavior: HitTestBehavior.translucent,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            icon,
            color: isSelected ? AppColors.primary : AppColors.textGrey,
            size: 24,
          ),
          const SizedBox(height: 4),
          if (isSelected)
            Text(
              label,
              style: const TextStyle(
                color: AppColors.primary,
                fontSize: 12,
                fontWeight: FontWeight.w600,
              ),
            ),
        ],
      ),
    );
  }
}
