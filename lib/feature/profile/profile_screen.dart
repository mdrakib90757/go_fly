
import 'package:flutter/material.dart';
import '../../core/utils/color.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

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
                decoration: const BoxDecoration(
                  color: AppColors.background,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(40),
                    topRight: Radius.circular(40),
                  ),
                ),
                child: ListView(
                  padding: const EdgeInsets.all(20),
                  children: [
                    _buildProfileCard(),
                    const SizedBox(height: 24),
                    _buildSectionTitle('Settings'),
                    _buildSettingsList(),
                    const SizedBox(height: 24),
                    _buildSectionTitle('Support'),
                    _buildSupportList(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.white),
            onPressed: () => Navigator.of(context).pop(),
          ),
          const Text('Profile', style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold)),
          IconButton(
            icon: const Icon(Icons.more_vert, color: Colors.white),
            onPressed: () {},
          ),
        ],
      ),
    );
  }

  Widget _buildProfileCard() {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        children: const [
          CircleAvatar(
            radius: 40,
            backgroundImage: AssetImage('assets/image/profile.png'),
          ),
          SizedBox(height: 16),
          Text('VIKRAM', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          SizedBox(height: 4),
          Text('vikramtech09@gmail.com', style: TextStyle(color: AppColors.textGrey)),
        ],
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0, left: 8.0),
      child: Text(title, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: AppColors.textGrey)),
    );
  }

  Widget _buildSettingsList() {
    return Card(
      elevation: 0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Column(
        children: [
          _buildSettingsItem(Icons.payment, 'Payment Method'),
          _buildSettingsItem(Icons.language, 'Languages'),
          _buildSettingsItem(Icons.dark_mode, 'Dark Theme', showSwitch: true),
        ],
      ),
    );
  }

  Widget _buildSupportList() {
    return Card(
      elevation: 0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Column(
        children: [
          _buildSettingsItem(Icons.help_center, 'Help Centre'),
          _buildSettingsItem(Icons.logout, 'Log Out', isLogout: true),
        ],
      ),
    );
  }

  Widget _buildSettingsItem(IconData icon, String title, {bool showSwitch = false, bool isLogout = false}) {
    return ListTile(
      leading: Icon(icon, color: AppColors.primary),
      title: Text(title, style: TextStyle(fontWeight: FontWeight.bold, color: isLogout ? Colors.red : AppColors.textDark)),
      trailing: showSwitch
          ? Switch(value: false, onChanged: (val) {}, activeColor: AppColors.primary)
          : (isLogout ? null : const Icon(Icons.arrow_forward_ios, size: 16)),
      onTap: () {},
    );
  }
}
