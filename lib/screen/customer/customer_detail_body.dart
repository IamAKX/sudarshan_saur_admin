import 'package:flutter/material.dart';
import 'package:saur_admin/utils/colors.dart';
import 'package:saur_admin/widgets/gaps.dart';

import '../../utils/theme.dart';

Card getCustomerWarrentyCard(BuildContext context) {
  return Card(
    color: Colors.white,
    child: Container(
      width: double.infinity,
      padding: const EdgeInsets.all(defaultPadding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Warranty Detail',
            style: Theme.of(context)
                .textTheme
                .titleLarge
                ?.copyWith(color: primaryColor),
          ),
          verticalGap(defaultPadding),
          Text(
            'Serial Number',
            style: Theme.of(context).textTheme.titleMedium,
          ),
          Text(
            '268899',
            style: Theme.of(context).textTheme.titleSmall?.copyWith(
                  color: textColorDark,
                  height: 1.8,
                  fontWeight: FontWeight.bold,
                ),
          ),
          verticalGap(defaultPadding),
          Text(
            'Invoice',
            style: Theme.of(context).textTheme.titleMedium,
          ),
          Text(
            'C00374/525',
            style: Theme.of(context).textTheme.titleSmall?.copyWith(
                  color: textColorDark,
                  height: 1.8,
                  fontWeight: FontWeight.bold,
                ),
          ),
          verticalGap(defaultPadding),
          Text(
            'Issued On',
            style: Theme.of(context).textTheme.titleMedium,
          ),
          Text(
            '2022-11-15',
            style: Theme.of(context).textTheme.titleSmall?.copyWith(
                  color: textColorDark,
                  height: 1.8,
                  fontWeight: FontWeight.bold,
                ),
          ),
          verticalGap(defaultPadding),
          Text(
            'System info',
            style: Theme.of(context).textTheme.titleMedium,
          ),
          Text(
            '200 WUGL-A 58X2100-10 Guarantee*',
            style: Theme.of(context).textTheme.titleSmall?.copyWith(
                  color: textColorDark,
                  height: 1.8,
                  fontWeight: FontWeight.bold,
                ),
          ),
          verticalGap(defaultPadding),
          Text(
            'Valid Till',
            style: Theme.of(context).textTheme.titleMedium,
          ),
          Text(
            '2037-11-15',
            style: Theme.of(context).textTheme.titleSmall?.copyWith(
                  color: textColorDark,
                  height: 1.8,
                  fontWeight: FontWeight.bold,
                ),
          ),
        ],
      ),
    ),
  );
}

Card getCustomerDetailCard(BuildContext context) {
  return Card(
    color: Colors.white,
    child: Container(
      width: double.infinity,
      padding: const EdgeInsets.all(defaultPadding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'Customer detail',
            style: Theme.of(context)
                .textTheme
                .titleLarge
                ?.copyWith(color: primaryColor),
          ),
          verticalGap(defaultPadding),
          Text(
            'Address',
            style: Theme.of(context).textTheme.titleMedium,
          ),
          Text(
            'C-592, Suncity Manor, North School Road, Hyderabad, Telangana - 105523',
            style: Theme.of(context).textTheme.titleSmall?.copyWith(
                  color: textColorDark,
                  height: 1.8,
                  fontWeight: FontWeight.bold,
                ),
          ),
          verticalGap(defaultPadding),
          Text(
            'Onbarding date',
            style: Theme.of(context).textTheme.titleMedium,
          ),
          Text(
            '27-08-2022',
            style: Theme.of(context).textTheme.titleSmall?.copyWith(
                  color: textColorDark,
                  height: 1.8,
                  fontWeight: FontWeight.bold,
                ),
          ),
          verticalGap(defaultPadding),
          Text(
            'Last logged in',
            style: Theme.of(context).textTheme.titleMedium,
          ),
          Text(
            '03-07-2023 11:53 PM',
            style: Theme.of(context).textTheme.titleSmall?.copyWith(
                  color: textColorDark,
                  height: 1.8,
                  fontWeight: FontWeight.bold,
                ),
          ),
          verticalGap(defaultPadding),
          Text(
            'Last Purchased on',
            style: Theme.of(context).textTheme.titleMedium,
          ),
          Text(
            '13-05-2023 11:53 PM',
            style: Theme.of(context).textTheme.titleSmall?.copyWith(
                  color: textColorDark,
                  height: 1.8,
                  fontWeight: FontWeight.bold,
                ),
          ),
          verticalGap(defaultPadding),
          Text(
            'Dealer',
            style: Theme.of(context).textTheme.titleMedium,
          ),
          Text(
            'Innovation Tech Pvt. Ltd.',
            style: Theme.of(context).textTheme.titleSmall?.copyWith(
                  color: textColorDark,
                  height: 1.8,
                  fontWeight: FontWeight.bold,
                ),
          ),
        ],
      ),
    ),
  );
}
