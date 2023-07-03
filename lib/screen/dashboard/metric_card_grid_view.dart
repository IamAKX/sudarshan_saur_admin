import 'package:flutter/material.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:saur_admin/widgets/gaps.dart';

import '../../utils/theme.dart';

class MetricsCardGridView extends StatelessWidget {
  MetricsCardGridView({
    Key? key,
    required this.crossAxisCount,
    required this.childAspectRatio,
  }) : super(key: key);

  final int crossAxisCount;
  final double childAspectRatio;

  final List<String> metricName = [
    'Customers',
    'Dealers',
    'Stockists',
    'Warranty request',
    'Unapproved Customer',
    'Unapproved Dealer',
    'Unapproved Stockist',
    'Alloted Serial Number'
  ];

  final List<IconData> metricIcons = [
    LineAwesomeIcons.user_1,
    LineAwesomeIcons.user_tie,
    LineAwesomeIcons.user_cog,
    LineAwesomeIcons.identification_card,
    LineAwesomeIcons.user_clock,
    LineAwesomeIcons.user_clock,
    LineAwesomeIcons.user_clock,
    LineAwesomeIcons.stream,
  ];

  final List<String> metricValue = [
    '1532',
    '37',
    '4',
    '20',
    '14',
    '2',
    '0',
    '1291'
  ];

  final List<Color> metricColors = [
    Colors.blue,
    Colors.amber,
    Colors.green,
    Colors.brown,
    Colors.pink,
    Colors.indigo,
    Colors.orange,
    Colors.blueGrey,
  ];

  @override
  Widget build(BuildContext context) {
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
}
