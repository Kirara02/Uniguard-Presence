import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:unipres/presentation/misc/colors.dart';
import 'package:unipres/presentation/misc/device_info.dart';

class ProfilePage extends ConsumerStatefulWidget {
  const ProfilePage({super.key});

  @override
  ConsumerState<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends ConsumerState<ProfilePage> {
  String _macAddress = "Loading...";

  @override
  void initState() {
    super.initState();
    _getMacAddress();
  }

  Future<void> _getMacAddress() async {
    String? macAddress = await DeviceInfo.getAndroidId();

    setState(() {
      _macAddress = macAddress ?? "Tidak bisa mendapatkan MAC Address";
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      physics: const BouncingScrollPhysics(),
      padding: const EdgeInsets.symmetric(vertical: 36),
      children: [
        const SizedBox(height: 16),
        // section 1 - profile
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ClipOval(
              child: Container(
                width: 124,
                height: 124,
                color: Colors.blue,
                child: Image.network(
                  "https://ui-avatars.com/api/?name=Kirara+Bernstein/",
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 16, bottom: 4),
              child: const Text(
                "Kirara Bernstein",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
              ),
            ),
            Text(
              "Mobile Developer",
              style: TextStyle(color: AppColors.secondarySoft),
            ),
            Text(
              _macAddress,
              style: TextStyle(color: AppColors.secondaryExtraSoft),
            ),
          ],
        ),
        // section 2 - menu
        Container(
          width: MediaQuery.of(context).size.width,
          margin: const EdgeInsets.only(top: 42),
          child: Column(
            children: [
              MenuTile(
                title: 'Update Profile',
                icon: SvgPicture.asset(
                  'assets/icons/profile-1.svg',
                ),
                onTap: () {},
              ),
              MenuTile(
                title: 'Change Password',
                icon: SvgPicture.asset(
                  'assets/icons/password.svg',
                ),
                onTap: () {},
              ),
              MenuTile(
                isDanger: true,
                title: 'Sign Out',
                icon: SvgPicture.asset(
                  'assets/icons/logout.svg',
                ),
                onTap: () {},
              ),
              Container(
                height: 1,
                color: AppColors.primaryExtraSoft,
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class MenuTile extends StatelessWidget {
  final String title;
  final Widget icon;
  final void Function() onTap;
  final bool isDanger;

  const MenuTile({
    super.key,
    required this.title,
    required this.icon,
    required this.onTap,
    this.isDanger = false,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
        decoration: BoxDecoration(
          border: Border(
            top: BorderSide(
              color: AppColors.secondaryExtraSoft,
              width: 1,
            ),
          ),
        ),
        child: Row(
          children: [
            Container(
              width: 42,
              height: 42,
              margin: const EdgeInsets.only(right: 24),
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: AppColors.primaryExtraSoft,
                borderRadius: BorderRadius.circular(100),
              ),
              child: icon,
            ),
            Expanded(
              child: Text(
                title,
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  color: (isDanger == false)
                      ? AppColors.secondary
                      : AppColors.error,
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(left: 24),
              child: SvgPicture.asset(
                'assets/icons/arrow-right.svg',
                theme: SvgTheme(
                  currentColor: (isDanger == false)
                      ? AppColors.secondary
                      : AppColors.error,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
