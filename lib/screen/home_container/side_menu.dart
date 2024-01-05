import 'package:flutter/material.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:saur_admin/screen/home_container/side_menu_item.dart';
import 'package:saur_admin/screen/user_onboarding/login_screen.dart';

import '../../utils/colors.dart';
import '../../utils/theme.dart';

class SideMenu extends StatelessWidget {
  const SideMenu({super.key, required this.navigateMenu});

  final Function(int index) navigateMenu;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      // backgroundColor: sidebar,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: ListView(
              children: [
                DrawerHeader(
                  decoration: const BoxDecoration(color: primaryColor),
                  child: SizedBox(
                    width: double.infinity,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(
                          LineAwesomeIcons.user_shield,
                          color: background,
                          size: 50,
                        ),
                        const SizedBox(
                          height: defaultPadding / 2,
                        ),
                        Image.asset(
                          'assets/logo/logo.png',
                          width: 150,
                        ),
                        Text(
                          'Admin Panel',
                          style: Theme.of(context)
                              .textTheme
                              .titleLarge
                              ?.copyWith(color: background),
                        ),
                      ],
                    ),
                  ),
                ),
                SideMenuItem(
                  title: 'Dashboard',
                  iconData: LineAwesomeIcons.bar_chart_1,
                  press: () {
                    navigateMenu(1);
                    if (Scaffold.of(context).isDrawerOpen) {
                      Navigator.of(context).pop();
                    }
                  },
                ),
                SideMenuItem(
                  title: 'Customer',
                  iconData: LineAwesomeIcons.user_1,
                  press: () {
                    navigateMenu(2);
                    if (Scaffold.of(context).isDrawerOpen) {
                      Navigator.of(context).pop();
                    }
                  },
                ),
                SideMenuItem(
                  title: 'Dealer',
                  iconData: LineAwesomeIcons.user_tie,
                  press: () {
                    navigateMenu(3);
                    if (Scaffold.of(context).isDrawerOpen) {
                      Navigator.of(context).pop();
                    }
                  },
                ),
                SideMenuItem(
                  title: 'Stockist',
                  iconData: LineAwesomeIcons.users_cog,
                  press: () {
                    navigateMenu(4);
                    if (Scaffold.of(context).isDrawerOpen) {
                      Navigator.of(context).pop();
                    }
                  },
                ),
                SideMenuItem(
                  title: 'Pending Request',
                  iconData: LineAwesomeIcons.poll_h,
                  press: () {
                    navigateMenu(5);
                    if (Scaffold.of(context).isDrawerOpen) {
                      Navigator.of(context).pop();
                    }
                  },
                ),
                SideMenuItem(
                  title: 'Report',
                  iconData: LineAwesomeIcons.file_invoice,
                  press: () {
                    navigateMenu(6);
                    if (Scaffold.of(context).isDrawerOpen) {
                      Navigator.of(context).pop();
                    }
                  },
                ),
                SideMenuItem(
                  title: 'Search Serial ID',
                  iconData: LineAwesomeIcons.poll_h,
                  press: () {
                    navigateMenu(7);
                    if (Scaffold.of(context).isDrawerOpen) {
                      Navigator.of(context).pop();
                    }
                  },
                ),
              ],
            ),
          ),
          ListTile(
            horizontalTitleGap: 0,
            leading: const Icon(
              LineAwesomeIcons.alternate_sign_out,
              color: Colors.red,
              size: 20,
            ),
            title: Text(
              'Log out',
              style: Theme.of(context).textTheme.labelLarge?.copyWith(
                    color: Colors.red,
                  ),
            ),
            onTap: () {
              Navigator.of(context).pushNamedAndRemoveUntil(
                  LoginScreen.routePath, (route) => false);
            },
          ),
        ],
      ),
    );
  }
}
