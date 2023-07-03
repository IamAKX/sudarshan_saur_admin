import 'package:flutter/material.dart';
import 'package:saur_admin/screen/customer/customer_detail.dart';
import 'package:saur_admin/screen/customer/customer_screen.dart';
import 'package:saur_admin/screen/dashboard/dashboard_screen.dart';
import 'package:saur_admin/screen/home_container/side_menu.dart';

import '../../utils/responsive.dart';

class HomeContainer extends StatefulWidget {
  const HomeContainer({super.key});
  static const String routePath = '/homeContainer';
  static GlobalKey<ScaffoldState> scafoldKey = GlobalKey<ScaffoldState>();

  @override
  State<HomeContainer> createState() => _HomeContainerState();
}

class _HomeContainerState extends State<HomeContainer> {
  int selectedIndex = 1;

  navigateMenu(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  Widget getMenuFromIndex() {
    switch (selectedIndex) {
      case 1:
        return DashboardScreen(navigateMenu: navigateMenu);
      case 2:
        return CustomerScreen(navigateMenu: navigateMenu);
      case 21:
        return CustomerDetail(navigateMenu: navigateMenu);
      default:
        return DashboardScreen(navigateMenu: navigateMenu);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: HomeContainer.scafoldKey,
      drawer: SideMenu(
        navigateMenu: (int index) {
          navigateMenu(index);
        },
      ),
      body: SafeArea(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (Responsive.isDesktop(context))
              Expanded(
                child: SideMenu(
                  navigateMenu: (int index) {
                    navigateMenu(index);
                  },
                ),
              ),
            Expanded(
              flex: 5,
              child: getMenuFromIndex(),
            ),
          ],
        ),
      ),
    );
  }
}
