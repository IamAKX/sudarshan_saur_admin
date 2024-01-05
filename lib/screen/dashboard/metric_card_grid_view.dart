import 'package:flutter/material.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:saur_admin/model/dashboard_metrics.dart';
import 'package:saur_admin/widgets/gaps.dart';

import '../../utils/theme.dart';

class MetricsCardGridView extends StatelessWidget {
  MetricsCardGridView({
    Key? key,
    required this.crossAxisCount,
    required this.childAspectRatio,
    required this.metrics,
  }) : super(key: key);

  final int crossAxisCount;
  final double childAspectRatio;
  final DashboardMetrics? metrics;

  final List<String> metricName = [
    'Customers Created',
    'Customers Active',
    'Customers Suspended',
    'Customers Blocked',
    'Dealers Created',
    'Dealers Active',
    'Dealers Suspended',
    'Dealers Blocked',
    'Stockist Created',
    'Stockist Active',
    'Stockist Suspended',
    'Stockist Blocked',
    // 'Warranty Approved',
    // 'Warranty Pending',
    // 'Warranty Declined',
  ];

  final List<IconData> metricIcons = [
    LineAwesomeIcons.user_1,
    LineAwesomeIcons.user_1,
    LineAwesomeIcons.user_1,
    LineAwesomeIcons.user_1,
    LineAwesomeIcons.user_tie,
    LineAwesomeIcons.user_tie,
    LineAwesomeIcons.user_tie,
    LineAwesomeIcons.user_tie,
    LineAwesomeIcons.user_cog,
    LineAwesomeIcons.user_cog,
    LineAwesomeIcons.user_cog,
    LineAwesomeIcons.user_cog,
    // LineAwesomeIcons.identification_card,
    // LineAwesomeIcons.identification_card,
    // LineAwesomeIcons.identification_card,
  ];

  List<String> metricValue = [];

  final List<Color> metricColors = [
    Colors.blue,
    Colors.green,
    Colors.amber,
    Colors.red,
    Colors.blue,
    Colors.green,
    Colors.amber,
    Colors.red,
    Colors.blue,
    Colors.green,
    Colors.amber,
    Colors.red,
    // Colors.green,
    // Colors.orange,
    // Colors.red,
  ];

  @override
  Widget build(BuildContext context) {
    fillMetricsValue();
    return GridView.builder(
      shrinkWrap: true,
      itemCount: metricName.length,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: crossAxisCount,
        childAspectRatio: childAspectRatio,
        mainAxisSpacing: defaultPadding,
        crossAxisSpacing: defaultPadding,
      ),
      itemBuilder: (context, index) => Card(
        child: Container(
          padding: const EdgeInsets.all(defaultPadding),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(5),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: 40,
                    height: 40,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: metricColors[index].withOpacity(0.3),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Icon(
                      metricIcons[index],
                      size: 20,
                      color: metricColors[index],
                    ),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.keyboard_arrow_right_outlined,
                    ),
                  )
                ],
              ),
              verticalGap(defaultPadding),
              Text(
                metricName[index],
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              Expanded(
                child: Container(
                  alignment: Alignment.center,
                  child: Text(
                    metricValue[index],
                    style: Theme.of(context)
                        .textTheme
                        .displayMedium
                        ?.copyWith(color: metricColors[index]),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void fillMetricsValue() {
    metricValue = [
      '${metrics?.customerCreated ?? 0}',
      '${metrics?.customerActive ?? 0}',
      '${metrics?.customerSuspended ?? 0}',
      '${metrics?.customerBlocked ?? 0}',
      '${metrics?.dealerCreated ?? 0}',
      '${metrics?.dealerActive ?? 0}',
      '${metrics?.dealerSuspended ?? 0}',
      '${metrics?.dealerBlocked ?? 0}',
      '${metrics?.stockistCreated ?? 0}',
      '${metrics?.stockistActive ?? 0}',
      '${metrics?.stockistSuspended ?? 0}',
      '${metrics?.stockistBlocked ?? 0}',
      // '${metrics?.warrantyRequestApproved ?? 0}',
      // '${metrics?.warrantyRequestPending ?? 0}',
      // '${metrics?.warrantyRequestDeclined ?? 0}',
    ];
  }
}
