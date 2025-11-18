import 'package:flutter/material.dart';
import 'package:go_fly/core/utils/color.dart';

class MyTicketScreen extends StatelessWidget {
  const MyTicketScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: Column(
        children: [
          _buildHeader(),
          Expanded(child: _buildTicketList()),
        ],
      ),
    );
  }

  // build header widget
  Widget _buildHeader() {
    return Container(
     padding: const EdgeInsets.fromLTRB( 20,20, 20, 30),
      decoration: const BoxDecoration(
        color: AppColors.primary,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(40),
          bottomRight: Radius.circular(40),
        ),
      ),
      child: Padding(
        padding:EdgeInsets.symmetric(vertical: 25),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const CircleAvatar(
                  backgroundImage: AssetImage('assets/image/profile.png'),
                  radius: 24,
                ),
                const Text(
                  'My Ticket',
                  style: TextStyle(
                      color: AppColors.textLight,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
                Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.1),
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(Icons.tune, color: AppColors.textLight),
                ),
              ],
            ),
            const SizedBox(height: 24),
            _buildFlightRoute(),
          ],
        ),
      ),
    );
  }

  // build flight route widget
  Widget _buildFlightRoute() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Column(
          children: [
            Text('Kochi', style: TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold)),
            Text('KCH', style: TextStyle(color: Colors.white70, fontSize: 14)),
          ],
        ),
        Column(
          children: [
            Row(
              children: [
                const Icon(Icons.circle, color: Colors.white, size: 8),
                Container(width: 80, height: 1, color: Colors.white54),
                const Icon(Icons.airplanemode_active, color: Colors.white, size: 20),
                Container(width: 80, height: 1, color: Colors.white54),
                const Icon(Icons.circle, color: Colors.white, size: 8),
              ],
            ),
            const SizedBox(height: 4),
            const Text('02 hr 00 min', style: TextStyle(color: Colors.white70)),
          ],
        ),
        const Column(
          children: [
            Text('Thiru...', style: TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold)),
            Text('TVM', style: TextStyle(color: Colors.white70, fontSize: 14)),
          ],
        ),
      ],
    );
  }

  // build ticket widget
  Widget _buildTicketList() {
    return ListView(
      padding: const EdgeInsets.all(20.0),
      children: const [
        _TicketCard(airline: 'Air India', price: '₹ 3,517', from: 'KCH', to: 'TVM', departure: '13 August 2024', arrival: '14 August 2024'),
        _TicketCard(airline: 'Indigo Airline', price: '₹ 8,589', from: 'KCH', to: 'TVM', departure: '13 August 2024', arrival: '14 August 2024'),
        _TicketCard(airline: 'Canada Airways', price: '₹ 12,317', from: 'SRP', to: 'RFS', departure: '13 August 2024', arrival: '14 August 2024'),
        _TicketCard(airline: 'Pacific Star Airways', price: '₹ 18,109', from: 'Kochi', to: 'Thiru...', departure: '13 August 2024', arrival: '14 August 2024'),
      ],
    );
  }
}


// ticket card class
class _TicketCard extends StatelessWidget {
  final String airline, price, from, to, departure, arrival;
  const _TicketCard({required this.airline, required this.price, required this.from, required this.to, required this.departure, required this.arrival});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      margin: const EdgeInsets.only(bottom: 16),
      color: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(airline, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                Text(price, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: AppColors.primary)),
              ],
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(from, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: AppColors.textDark)),
                    Text(departure, style: const TextStyle(color: AppColors.textGrey)),
                  ],
                ),
                const Icon(Icons.airplanemode_active, color: AppColors.textGrey),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(to, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: AppColors.textDark)),
                    Text(arrival, style: const TextStyle(color: AppColors.textGrey)),
                  ],
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
