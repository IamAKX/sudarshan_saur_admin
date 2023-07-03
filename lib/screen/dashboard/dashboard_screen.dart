import 'package:flutter/material.dart';
import 'package:saur_admin/screen/dashboard/metric_card_grid_view.dart';
import 'package:saur_admin/widgets/gaps.dart';
import 'package:saur_admin/widgets/header.dart';

import '../../utils/responsive.dart';
import '../../utils/theme.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key, required this.navigateMenu});
  final Function(int index) navigateMenu;
  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(defaultPadding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Header(title: 'Dashboard'),
          verticalGap(
            defaultPadding * 2,
          ),
          Responsive(
            desktop: MetricsCardGridView(
              childAspectRatio: Responsive.isDesktop(context) ? 1.2 : 1.1,
              crossAxisCount: 4,
            ),
            mobile: MetricsCardGridView(
              crossAxisCount: Responsive.isMobile(context) ? 2 : 4,
              childAspectRatio: 1,
            ),
            tablet: MetricsCardGridView(
              crossAxisCount: Responsive.isTablet(context) ? 2 : 4,
              childAspectRatio: 2,
            ),
          ),
        ],
      ),
    );
  }
}
