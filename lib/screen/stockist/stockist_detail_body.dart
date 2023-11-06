import 'package:flutter/material.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:saur_admin/model/stockist_model.dart';
import 'package:saur_admin/utils/colors.dart';
import 'package:saur_admin/widgets/gaps.dart';
import 'package:saur_admin/widgets/input_field_light.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../utils/api.dart';
import '../../utils/enum.dart';
import '../../utils/helper_methods.dart';
import '../../utils/theme.dart';
import '../../widgets/date_time_formatter.dart';

Card getDealerUnderStockist(
    BuildContext context, StockistModel? stockistModel) {
  return Card(
    color: Colors.white,
    child: Container(
      width: double.infinity,
      padding: const EdgeInsets.all(defaultPadding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Business Detail',
                style: Theme.of(context)
                    .textTheme
                    .titleLarge
                    ?.copyWith(color: primaryColor),
              ),
            ],
          ),
          verticalGap(defaultPadding),
          verticalGap(defaultPadding),
          Text(
            'Dealer ID',
            style: Theme.of(context).textTheme.titleMedium,
          ),
          Text(
            '${stockistModel?.stockistId}',
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
            '${stockistModel?.businessName}',
            style: Theme.of(context).textTheme.titleSmall?.copyWith(
                  color: textColorDark,
                  height: 1.8,
                  fontWeight: FontWeight.bold,
                ),
          ),
          verticalGap(defaultPadding),
          Text(
            'Stockist Code',
            style: Theme.of(context).textTheme.titleMedium,
          ),
          Text(
            '${stockistModel?.stockistCode}',
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
            '${stockistModel?.gstNumber}',
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
            stockistModel?.status == UserStatus.ACTIVE.name ? 'Yes' : 'No',
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

Card getStockistDetailCard(BuildContext context, StockistModel? stockistModel) {
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
            DateTimeFormatter.onlyDateShort(stockistModel?.createdOn ?? ''),
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
            DateTimeFormatter.onlyDateShortWithTime(
                stockistModel?.lastLogin ?? ''),
            style: Theme.of(context).textTheme.titleSmall?.copyWith(
                  color: textColorDark,
                  height: 1.8,
                  fontWeight: FontWeight.bold,
                ),
          ),
          verticalGap(defaultPadding),
          Text(
            'Phone Number',
            style: Theme.of(context).textTheme.titleMedium,
          ),
          Text(
            stockistModel?.mobileNo ?? '',
            style: Theme.of(context).textTheme.titleSmall?.copyWith(
                  color: textColorDark,
                  height: 1.8,
                  fontWeight: FontWeight.bold,
                ),
          ),
          verticalGap(defaultPadding),
          Text(
            'Address',
            style: Theme.of(context).textTheme.titleMedium,
          ),
          Text(
            prepareAddress(stockistModel?.address),
            style: Theme.of(context).textTheme.titleSmall?.copyWith(
                  color: textColorDark,
                  height: 1.8,
                  fontWeight: FontWeight.bold,
                ),
          ),
          verticalGap(defaultPadding),
          TextButton(
            onPressed: () {
              launchUrl(Uri.parse(
                  '${Api.stockistAgreement}${stockistModel?.stockistId}'));
            },
            child: Text('Download Agreement'),
          )
        ],
      ),
    ),
  );
}
