import 'package:flutter/material.dart';
import 'package:go_fly/core/shared_widget/custom_button.dart';
import 'package:go_fly/core/utils/color.dart';

class BoardingPassScreen extends StatelessWidget {
  const BoardingPassScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary,
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Icon(Icons.arrow_back, color: Colors.white),
                  const Text('Boarding Pass', style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold)),
                  IconButton(
                    icon: const Icon(Icons.more_vert, color: Colors.white),
                    onPressed: () {},
                  ),
                ],
              ),
            ),
            Expanded(
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 20),
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  children: [
                    _buildFlightDetails(),
                    _buildDottedDivider(),
                    _buildPassengerDetails(),
                    const Spacer(),
                    _buildBarcode(),
                    const Spacer(),
                    CustomButton(text: 'Download Receipt', onPressed: () {}),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  Widget _buildFlightDetails() {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: const [
            Text('Air India', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
            Text('AS 501', style: TextStyle(color: AppColors.textGrey)),
          ],
        ),
        const SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _buildRouteColumn('KCH', 'Kochi'),
            const Icon(Icons.airplanemode_active, color: AppColors.primary),
            _buildRouteColumn('TVM', 'Thiru...', isEnd: true),
          ],
        ),
      ],
    );
  }

  Widget _buildRouteColumn(String code, String city, {bool isEnd = false}) {
    return Column(
      crossAxisAlignment: isEnd ? CrossAxisAlignment.end : CrossAxisAlignment.start,
      children: [
        Text(code, style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: AppColors.textDark)),
        Text(city, style: const TextStyle(color: AppColors.textGrey)),
      ],
    );
  }

  Widget _buildPassengerDetails() {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _buildDetailItem('Passenger', 'Vikram'),
            _buildDetailItem('Class', 'Indian', isEnd: true),
          ],
        ),
        const SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _buildDetailItem('Date', '19 August 2024'),
            _buildDetailItem('Time', '03:30 PM', isEnd: true),
          ],
        ),
        const SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _buildDetailItem('Seat', 'B2'),
            _buildDetailItem('Gate', '03', isEnd: true),
          ],
        ),
      ],
    );
  }

  Widget _buildDetailItem(String label, String value, {bool isEnd = false}) {
    return Column(
      crossAxisAlignment: isEnd ? CrossAxisAlignment.end : CrossAxisAlignment.start,
      children: [
        Text(label, style: const TextStyle(color: AppColors.textGrey, fontSize: 12)),
        Text(value, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
      ],
    );
  }

  Widget _buildDottedDivider() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20.0),
      child: Row(
        children: List.generate(30, (index) => Expanded(
          child: Container(
            color: index % 2 == 0 ? Colors.transparent : Colors.grey.shade300,
            height: 1,
          ),
        )),
      ),
    );
  }

  Widget _buildBarcode() {
    return Column(
      children: [
        const Text('Submit at registration', style: TextStyle(color: AppColors.textGrey)),
        const SizedBox(height: 8),
        Image.asset('assets/image/barcode.png', height: 60),
      ],
    );
  }
}
