import 'package:flutter/material.dart';
import 'package:go_fly/core/shared_widget/custom_button.dart';
import 'package:go_fly/core/shared_widget/custom_nevbar.dart';
import 'package:go_fly/core/utils/color.dart';
import 'package:go_fly/feature/profile/profile_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: Column(
        children: [
          _buildHeader(context),
          Expanded(child: _buildContent()),
        ],
      ),
     // bottomNavigationBar: const CustomBottomNavBar(),
    );
  }

  Widget _buildHeader(BuildContext context ) {
    return Container(
      padding: const EdgeInsets.fromLTRB(20, 50, 20, 20),
      decoration: const BoxDecoration(
        color: AppColors.primary,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(30),
          bottomRight: Radius.circular(30),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
               Row(
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => ProfileScreen(),));
                    },
                    child: CircleAvatar(
                      // backgroundImage: AssetImage('assets/profile.png'),
                      radius: 24,
                    ),
                  ),
                  SizedBox(width: 12),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Good Morning',
                        style: TextStyle(
                          color: AppColors.textLight,
                          fontSize: 14,
                        ),
                      ),
                      Text(
                        'Vikram',
                        style: TextStyle(
                          color: AppColors.textLight,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: AppColors.textLight.withOpacity(0.1),
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  Icons.notifications_none,
                  color: AppColors.textLight,
                ),
              ),
            ],
          ),
          const SizedBox(height: 24),
          const Text(
            'Securely Book\nYour Flight Ticket',
            style: TextStyle(
              color: AppColors.textLight,
              fontSize: 28,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  // body content
  Widget _buildContent() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        children: [
          _buildBookingCard(),
          const SizedBox(height: 24),
          _buildUpcomingFlights(),
        ],
      ),
    );
  }

  // build widget card
  Widget _buildBookingCard() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.cardBackground,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 5,
            blurRadius: 10,
          ),
        ],
      ),
      child: Column(
        children: [
          _buildRouteInfo('From', 'Kochi, Nedumbassery', Icons.flight_takeoff),
          const Divider(height: 30),
          _buildRouteInfo('To', 'Thiruvananthapuram', Icons.flight_land),
          const SizedBox(height: 20),
          Row(
            children: [
              _buildDateInfo('Departure', '13 August 2024'),
              const SizedBox(width: 16),
              _buildDateInfo('Return', '16 August 2024'),
            ],
          ),
          const SizedBox(height: 20),
          _buildTravelersInfo(),
          const SizedBox(height: 20),
          CustomButton(text: 'Search Flight', onPressed: () {}),
        ],
      ),
    );
  }

  // build route
  Widget _buildRouteInfo(String label, String value, IconData icon) {
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: AppColors.primary.withOpacity(0.1),
            shape: BoxShape.circle,
          ),
          child: Icon(icon, color: AppColors.primary, size: 20),
        ),
        const SizedBox(width: 12),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              label,
              style: const TextStyle(color: AppColors.textGrey, fontSize: 12),
            ),
            Text(
              value,
              style: const TextStyle(
                color: AppColors.textDark,
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
          ],
        ),
      ],
    );
  }

  // build delete widget
  Widget _buildDateInfo(String label, String date) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: AppColors.background,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              label,
              style: const TextStyle(color: AppColors.textGrey, fontSize: 12),
            ),
            Text(
              date,
              style: const TextStyle(
                color: AppColors.textDark,
                fontWeight: FontWeight.bold,
                fontSize: 14,
              ),
            ),
          ],
        ),
      ),
    );
  }

  // build trans TravelersInfo
  Widget _buildTravelersInfo() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Travelers',
              style: TextStyle(color: AppColors.textGrey, fontSize: 12),
            ),
            Text(
              '4 Person',
              style: TextStyle(
                color: AppColors.textDark,
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
          ],
        ),
        Row(
          children: [
            _buildCounterButton(Icons.remove),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: const SizedBox(
                width: 20,
                child: Text(
                  '04',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
              ),
            ),
            _buildCounterButton(Icons.add),
          ],
        ),
      ],
    );
  }

  // build add and remove button
  Widget _buildCounterButton(IconData icon) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.primary.withOpacity(0.1),
        shape: BoxShape.circle,
      ),
      child: Icon(icon, color: AppColors.primary, size: 20),
    );
  }

  // build upcoming flights
  Widget _buildUpcomingFlights() {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              'Upcoming flights',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: AppColors.textDark,
              ),
            ),
            Text(
              'See all',
              style: TextStyle(fontSize: 14, color: AppColors.primary),
            ),
          ],
        ),
        const SizedBox(height: 16),
        ListTile(
          tileColor: AppColors.cardBackground,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          leading: const Icon(
            Icons.airplanemode_active,
            color: AppColors.primary,
          ),
          title: const Text('Qatar Airways'),
          trailing: const Text(
            '₹ 3,517',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
          onTap: () {},
        ),
      ],
    );
  }
}
