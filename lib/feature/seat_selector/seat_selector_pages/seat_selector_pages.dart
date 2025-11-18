import 'package:flutter/material.dart';
import 'package:go_fly/core/shared_widget/custom_button.dart';
import 'package:go_fly/core/utils/color.dart';

class SeatSelectorScreen extends StatefulWidget {
  const SeatSelectorScreen({Key? key}) : super(key: key);

  @override  _SeatSelectorScreenState createState() => _SeatSelectorScreenState();
}

class _SeatSelectorScreenState extends State<SeatSelectorScreen> {
  String? _selectedSeat;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary,
      body: SafeArea(
        child: Column(
          children: [
            _buildHeader(context),
            Expanded(
              child: Container(
               margin: EdgeInsets.symmetric(horizontal: 10),
                padding: const EdgeInsets.all(20),
                decoration: const BoxDecoration(
                  color: AppColors.background,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(40),
                    topRight: Radius.circular(40),
                  ),
                ),
                child: Column(
                  children: [
                    _buildLegend(),
                    const SizedBox(height: 20),
                    _buildSeatLayout(),
                    const Spacer(),
                    CustomButton(
                      text: 'Confirm your seat',
                      onPressed: _selectedSeat != null ? () {} : null,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // build header
  Widget _buildHeader(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // IconButton(
          //   icon: const Icon(Icons.arrow_back, color: Colors.white),
          //   onPressed: () => Navigator.of(context).pop(),
          // ),
          const Text('Select Your Seat', style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold)),
          const SizedBox(width: 48),
        ],
      ),
    );
  }

  // build legend
  Widget _buildLegend() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        _buildLegendItem(AppColors.primary, 'Selected'),
        _buildLegendItem(Colors.white, 'Available'),
        _buildLegendItem(AppColors.background, 'Unavailable', hasBorder: true),
      ],
    );
  }

  // build item
  Widget _buildLegendItem(Color color, String text, {bool hasBorder = false}) {
    return Row(
      children: [
        Container(
          width: 16,
          height: 16,
          decoration: BoxDecoration(
            color: hasBorder ? color : null,
            border: hasBorder ? Border.all(color: Colors.grey.shade400) : null,
            borderRadius: BorderRadius.circular(4),
          ),
          child: hasBorder ? const Icon(Icons.close, size: 12, color: Colors.grey) : null,
        ),
        const SizedBox(width: 8),
        Text(text, style: const TextStyle(color: AppColors.textGrey)),
      ],
    );
  }

  // build seat layout
  Widget _buildSeatLayout() {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
         // margin: EdgeInsets.symmetric(horizontal: 10),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
          ),
          child: const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Business Class', style: TextStyle(fontWeight: FontWeight.bold)),
              Icon(Icons.keyboard_arrow_down),
            ],
          ),
        ),
        const SizedBox(height: 20),
        // Example of a few rows of seats
        _buildSeatRow(['A1', 'B1', 'C1', 'D1'], ['B1']),
        _buildSeatRow(['A2', 'B2', 'C2', 'D2'], ['C2']),
        _buildSeatRow(['A3', 'B3', 'C3', 'D3'], []),
        _buildSeatRow(['A4', 'B4', 'C4', 'D4'], ['B4', 'C4']),
        _buildSeatRow(['A5', 'B5', 'C5', 'D5'], []),
        _buildSeatRow(['A6', 'B6', 'C6', 'D6'], ['A6']),
      ],
    );
  }

  // build seat rom
  Widget _buildSeatRow(List<String> seats, List<String> unavailableSeats) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _buildSeatItem(seats[0], unavailableSeats),
          _buildSeatItem(seats[1], unavailableSeats),
          const SizedBox(width: 24), // Aisle
          _buildSeatItem(seats[2], unavailableSeats),
          _buildSeatItem(seats[3], unavailableSeats),
        ],
      ),
    );
  }

  // build seat item
  Widget _buildSeatItem(String seatId, List<String> unavailableSeats) {
    bool isUnavailable = unavailableSeats.contains(seatId);
    bool isSelected = _selectedSeat == seatId;

    Color color = Colors.white;
    Color textColor = AppColors.textDark;
    if (isUnavailable) {
      color = AppColors.background;
      textColor = AppColors.textGrey;
    } else if (isSelected) {
      color = AppColors.primary;
      textColor = Colors.white;
    }

    return GestureDetector(
      onTap: isUnavailable ? null : () {
        setState(() {
          _selectedSeat = seatId;
        });
      },
      child: Container(
        width: 50,
        height: 50,

        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: Colors.grey.shade300),
        ),
        child: Center(child: Text(seatId, style: TextStyle(color: textColor, fontWeight: FontWeight.bold))),
      ),
    );
  }
}
