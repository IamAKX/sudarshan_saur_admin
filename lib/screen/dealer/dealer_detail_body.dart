import 'package:flutter/material.dart';
import 'package:saur_admin/utils/colors.dart';
import 'package:saur_admin/widgets/gaps.dart';

import '../../utils/theme.dart';

Card getDealerBusinessCard(BuildContext context) {
  return Card(
    color: Colors.white,
    child: Container(
      width: double.infinity,
      padding: const EdgeInsets.all(defaultPadding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Business Detail',
            style: Theme.of(context)
                .textTheme
                .titleLarge
                ?.copyWith(color: primaryColor),
          ),
          verticalGap(defaultPadding),
          Text(
            'Dealer ID',
            style: Theme.of(context).textTheme.titleMedium,
          ),
          Text(
            '12',
            style: Theme.of(context).textTheme.titleSmall?.copyWith(
                  color: textColorDark,
                  height: 1.8,
                  fontWeight: FontWeight.bold,
                ),
          ),
          verticalGap(defaultPadding),
          Text(
            'Business Name',
            style: Theme.of(context).textTheme.titleMedium,
          ),
          Text(
            'Sujata Pvt. Ltd.',
            style: Theme.of(context).textTheme.titleSmall?.copyWith(
                  color: textColorDark,
                  height: 1.8,
                  fontWeight: FontWeight.bold,
                ),
          ),
          verticalGap(defaultPadding),
          Text(
            'Business Address',
            style: Theme.of(context).textTheme.titleMedium,
          ),
          Text(
            'Flat No 303, Shiva Sai Apts, Nallakunta, Hyderabad, Andhra Pradesh, 500044',
            style: Theme.of(context).textTheme.titleSmall?.copyWith(
                  color: textColorDark,
                  height: 1.8,
                  fontWeight: FontWeight.bold,
                ),
          ),
          verticalGap(defaultPadding),
          Text(
            'GST Number',
            style: Theme.of(context).textTheme.titleMedium,
          ),
          Text(
            '07AAGFF2194N1Z1',
            style: Theme.of(context).textTheme.titleSmall?.copyWith(
                  color: textColorDark,
                  height: 1.8,
                  fontWeight: FontWeight.bold,
                ),
          ),
          verticalGap(defaultPadding),
          Text(
            'Verified Dealer',
            style: Theme.of(context).textTheme.titleMedium,
          ),
          Text(
            'Yes',
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

Card getDealerDetailCard(BuildContext context) {
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
            'Dealer detail',
            style: Theme.of(context)
                .textTheme
                .titleLarge
                ?.copyWith(color: primaryColor),
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
            'Total Serial alloted',
            style: Theme.of(context).textTheme.titleMedium,
          ),
          Text(
            '375',
            style: Theme.of(context).textTheme.titleSmall?.copyWith(
                  color: textColorDark,
                  height: 1.8,
                  fontWeight: FontWeight.bold,
                ),
          ),
          verticalGap(defaultPadding),
          Text(
            'Total Warranty generated',
            style: Theme.of(context).textTheme.titleMedium,
          ),
          Text(
            '37',
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
