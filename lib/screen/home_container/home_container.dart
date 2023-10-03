import 'package:flutter/material.dart';
import 'package:saur_admin/screen/customer/customer_detail.dart';
import 'package:saur_admin/screen/customer/customer_screen.dart';
import 'package:saur_admin/screen/dashboard/dashboard_screen.dart';
import 'package:saur_admin/screen/dealer/dealer_detail.dart';
import 'package:saur_admin/screen/dealer/dealer_screen.dart';
import 'package:saur_admin/screen/home_container/side_menu.dart';
import 'package:saur_admin/screen/report/report_screen.dart';
import 'package:saur_admin/screen/serial_number/serial_number_screen.dart';
import 'package:saur_admin/screen/stockist/stockist_detail.dart';
import 'package:saur_admin/screen/stockist/stockist_screen.dart';

import '../../utils/responsive.dart';
import '../serial_number/serial_detail.dart';

class HomeContainer extends StatefulWidget {
  const HomeContainer({super.key});
  static const String routePath = '/homeContainer';
  static dynamic args;
  static GlobalKey<ScaffoldState> scafoldKey = GlobalKey<ScaffoldState>();

  @override
  State<HomeContainer> createState() => _HomeContainerState();
}

class _HomeContainerState extends State<HomeContainer> {
  int selectedIndex = 5;

  navigateMenu(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  Widget getMenuFromIndex() {
    switch (selectedIndex) {
      case 1:
        return DashboardScreen(
          navigateMenu: navigateMenu,
        );
      case 2:
        return CustomerScreen(
          navigateMenu: navigateMenu,
        );
      case 21:
        return CustomerDetail(
          navigateMenu: navigateMenu,
        );
      case 3:
        return DealerScreen(navigateMenu: navigateMenu);
      case 31:
        return DealerDetail(navigateMenu: navigateMenu);
      case 4:
        return StockistScreen(navigateMenu: navigateMenu);
      case 41:
        return StockistDetail(navigateMenu: navigateMenu);
      case 5:
        return SerialNumberScreen(navigateMenu: navigateMenu);
      case 51:
        return SerialKeyDetail(navigateMenu: navigateMenu);
      case 6:
        return ReportScreen(navigateMenu: navigateMenu);
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
