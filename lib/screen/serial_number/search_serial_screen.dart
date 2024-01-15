import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:saur_admin/services/toast_service.dart';
import 'package:saur_admin/utils/colors.dart';
import 'package:saur_admin/widgets/header.dart';

import '../../model/dashboard_metrics.dart';
import '../../services/api_service.dart';
import '../../utils/theme.dart';
import '../../widgets/gaps.dart';
import '../home_container/home_container.dart';

class SearchSerialScreen extends StatefulWidget {
  final Function(int index) navigateMenu;

  const SearchSerialScreen({super.key, required this.navigateMenu});

  @override
  State<SearchSerialScreen> createState() => _SearchSerialScreenState();
}

class _SearchSerialScreenState extends State<SearchSerialScreen> {
  late ApiProvider _api;
  DashboardMetrics? dashboardMetrics;
  final TextEditingController search = TextEditingController();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback(
      (_) => reloadScreen(),
    );
  }

  reloadScreen() async {
    await _api.getDashboardMetrics().then((value) {
      setState(() {
        dashboardMetrics = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    _api = Provider.of<ApiProvider>(context);
    if (_api.status == ApiStatus.loading) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    }

    return SingleChildScrollView(
      padding: const EdgeInsets.all(defaultPadding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Header(title: 'Search Number'),
          verticalGap(
            defaultPadding * 2,
          ),
          metricGrid(context),
          verticalGap(
            defaultPadding,
          ),
          Row(
            children: [
              SizedBox(
                width: 300,
                child: TextField(
                  decoration: const InputDecoration(
                    hintText: 'Serial Number',
                    labelText: 'Serial Number',
                  ),
                  controller: search,
                ),
              ),
              horizontalGap(defaultPadding),
              ElevatedButton.icon(
                onPressed: () {
                  if (search.text.isEmpty) {
                    ToastService.instance.showSna('Enter serial number');
                    return;
                  }
                  log(search.text);
                  HomeContainer.args = search.text;
                  HomeContainer.isFromSearch = true;
                  widget.navigateMenu(71);
                },
                icon: const Icon(
                  Icons.search,
                  color: Colors.white,
                ),
                label: const Text(
                  'Search',
                  style: TextStyle(color: Colors.white),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }

  Row metricGrid(BuildContext context) {
    return Row(
      children: [
        Card(
          color: Colors.white,
          child: Container(
            width: 200,
            height: 150,
            alignment: Alignment.center,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  '${dashboardMetrics?.warrantyRequestApproved ?? 0}',
                  style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                        color: acceptedColor,
                      ),
                ),
                verticalGap(defaultPadding / 2),
                Text(
                  'Approved Requests',
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(),
                ),
                verticalGap(defaultPadding / 2),
                TextButton.icon(
                  onPressed: () {
                    HomeContainer.warrantyStatus = 'APPROVED';
                    widget.navigateMenu(5);
                  },
                  label: Text(
                    'View',
                    style: Theme.of(context).textTheme.labelMedium?.copyWith(
                          color: primaryColor,
                        ),
                  ),
                  icon: const Icon(
                    Icons.arrow_right_alt,
                    color: primaryColor,
                  ),
                )
              ],
            ),
          ),
        ),
        Card(
          color: Colors.white,
          child: Container(
            width: 200,
            height: 150,
            alignment: Alignment.center,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  '${dashboardMetrics?.warrantyRequestDeclined ?? 0}',
                  style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                        color: rejectedColor,
                      ),
                ),
                verticalGap(defaultPadding / 2),
                Text(
                  'Declined Requests',
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(),
                ),
                verticalGap(defaultPadding / 2),
                TextButton.icon(
                  onPressed: () {
                    HomeContainer.warrantyStatus = 'DECLINED';
                    widget.navigateMenu(5);
                  },
                  label: Text(
                    'View',
                    style: Theme.of(context).textTheme.labelMedium?.copyWith(
                          color: primaryColor,
                        ),
                  ),
                  icon: const Icon(
                    Icons.arrow_right_alt,
                    color: primaryColor,
                  ),
                )
              ],
            ),
          ),
        ),
        Card(
          color: Colors.white,
          child: Container(
            width: 200,
            height: 150,
            alignment: Alignment.center,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                verticalGap(defaultPadding * 1.5),
                Text(
                  '${dashboardMetrics?.warrantyRequestPending ?? 0}',
                  style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                        color: pendingColor,
                      ),
                ),
                verticalGap(defaultPadding / 2),
                Text(
                  'Pending Requests',
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(),
                ),
                verticalGap(defaultPadding / 2),
                TextButton.icon(
                  onPressed: () {
                    widget.navigateMenu(5);
                  },
                  label: Text(
                    'View',
                    style: Theme.of(context).textTheme.labelMedium?.copyWith(
                          color: primaryColor,
                        ),
                  ),
                  icon: const Icon(
                    Icons.arrow_right_alt,
                    color: primaryColor,
                  ),
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}
