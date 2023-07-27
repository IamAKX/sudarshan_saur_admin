import 'package:flutter/material.dart';
import 'package:saur_admin/model/dealer_model.dart';
import 'package:saur_admin/utils/colors.dart';
import 'package:saur_admin/utils/enum.dart';
import 'package:saur_admin/utils/helper_methods.dart';
import 'package:saur_admin/widgets/gaps.dart';

import '../../utils/theme.dart';
import '../../widgets/date_time_formatter.dart';

Card getDealerBusinessCard(BuildContext context, DealerModel? dealerModel) {
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
            '${dealerModel?.dealerId}',
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
            '${dealerModel?.businessName}',
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
            '${dealerModel?.businessAddress}',
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
            '${dealerModel?.gstNumber}',
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
            dealerModel?.status == UserStatus.ACTIVE.name ? 'Yes' : 'No',
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

Card getDealerDetailCard(BuildContext context, DealerModel? dealerModel) {
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
            '${dealerModel?.dealerName}',
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
            DateTimeFormatter.onlyDateShort(dealerModel?.createdOn ?? ''),
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
            DateTimeFormatter.onlyDateShort(dealerModel?.lastLogin ?? ''),
            style: Theme.of(context).textTheme.titleSmall?.copyWith(
                  color: textColorDark,
                  height: 1.8,
                  fontWeight: FontWeight.bold,
                ),
          ),
          verticalGap(defaultPadding),
          Text(
            'Phone',
            style: Theme.of(context).textTheme.titleMedium,
          ),
          Text(
            '${dealerModel?.mobileNo}',
            style: Theme.of(context).textTheme.titleSmall?.copyWith(
                  color: textColorDark,
                  height: 1.8,
                  fontWeight: FontWeight.bold,
                ),
          ),
          verticalGap(defaultPadding),
          Text(
            'Email',
            style: Theme.of(context).textTheme.titleMedium,
          ),
          Text(
            '${dealerModel?.email}',
            style: Theme.of(context).textTheme.titleSmall?.copyWith(
                  color: textColorDark,
                  height: 1.8,
                  fontWeight: FontWeight.bold,
                ),
          ),
          verticalGap(defaultPadding),
          Text(
            'Personal Address',
            style: Theme.of(context).textTheme.titleMedium,
          ),
          Text(
            prepareAddress(dealerModel?.address),
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
