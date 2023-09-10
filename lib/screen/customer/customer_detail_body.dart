import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:saur_admin/model/customer_model.dart';
import 'package:saur_admin/utils/colors.dart';
import 'package:saur_admin/utils/helper_methods.dart';
import 'package:saur_admin/widgets/date_time_formatter.dart';
import 'package:saur_admin/widgets/gaps.dart';
import 'package:collection/collection.dart';
import '../../utils/theme.dart';

Card getCustomerWarrentyCard(
    BuildContext context, CustomerModel? customerModel) {
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
          // Text(
          //   'Serial Number',
          //   style: Theme.of(context).textTheme.titleMedium,
          // ),
          // Text(
          //   customerModel?.warrantyDetails?.firstOrNull?.warrantySerialNo ??
          //       '-',
          //   style: Theme.of(context).textTheme.titleSmall?.copyWith(
          //         color: textColorDark,
          //         height: 1.8,
          //         fontWeight: FontWeight.bold,
          //       ),
          // ),
          verticalGap(defaultPadding),
          // Text(
          //   'Invoice',
          //   style: Theme.of(context).textTheme.titleMedium,
          // ),
          // Text(
          //   customerModel?.warrantyDetails?.firstOrNull?.invoiceNo ?? '-',
          //   style: Theme.of(context).textTheme.titleSmall?.copyWith(
          //         color: textColorDark,
          //         height: 1.8,
          //         fontWeight: FontWeight.bold,
          //       ),
          // ),
          verticalGap(defaultPadding),
          Text(
            'Installed On',
            style: Theme.of(context).textTheme.titleMedium,
          ),
          // Text(
          //   DateTimeFormatter.onlyDateShort(
          //       customerModel?.warrantyDetails?.firstOrNull?.installationDate ??
          //           ''),
          //   style: Theme.of(context).textTheme.titleSmall?.copyWith(
          //         color: textColorDark,
          //         height: 1.8,
          //         fontWeight: FontWeight.bold,
          //       ),
          // ),
          // verticalGap(defaultPadding),
          // Text(
          //   'System info',
          //   style: Theme.of(context).textTheme.titleMedium,
          // ),
          // Text(
          //   '${customerModel?.warrantyDetails?.firstOrNull?.itemDescription ?? ''} ${customerModel?.warrantyDetails?.firstOrNull?.model ?? ''}}',
          //   style: Theme.of(context).textTheme.titleSmall?.copyWith(
          //         color: textColorDark,
          //         height: 1.8,
          //         fontWeight: FontWeight.bold,
          //       ),
          // ),
          // verticalGap(defaultPadding),
          // Text(
          //   'Valid Till',
          //   style: Theme.of(context).textTheme.titleMedium,
          // ),
          // Text(
          //   DateTimeFormatter.onlyDateShort(
          //       customerModel?.warrantyDetails?.firstOrNull?.guaranteePeriod ??
          //           ''),
          //   style: Theme.of(context).textTheme.titleSmall?.copyWith(
          //         color: textColorDark,
          //         height: 1.8,
          //         fontWeight: FontWeight.bold,
          //       ),
          // ),
        ],
      ),
    ),
  );
}

Card getCustomerDetailCard(BuildContext context, CustomerModel? customerModel) {
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
            prepareAddress(customerModel?.address),
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
            DateTimeFormatter.onlyDateShort(customerModel?.createdOn ?? ''),
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
                customerModel?.lastLogin ?? ''),
            style: Theme.of(context).textTheme.titleSmall?.copyWith(
                  color: textColorDark,
                  height: 1.8,
                  fontWeight: FontWeight.bold,
                ),
          ),
          verticalGap(defaultPadding),
          // Text(
          //   'Last Purchased on',
          //   style: Theme.of(context).textTheme.titleMedium,
          // ),
          // Text(
          //   DateTimeFormatter.onlyDateShort(
          //       customerModel?.lastPurchaseDate ?? ''),
          //   style: Theme.of(context).textTheme.titleSmall?.copyWith(
          //         color: textColorDark,
          //         height: 1.8,
          //         fontWeight: FontWeight.bold,
          //       ),
          // ),
          // verticalGap(defaultPadding),
          // Text(
          //   'Dealer',
          //   style: Theme.of(context).textTheme.titleMedium,
          // ),
          // Text(
          //   '-',
          //   style: Theme.of(context).textTheme.titleSmall?.copyWith(
          //         color: textColorDark,
          //         height: 1.8,
          //         fontWeight: FontWeight.bold,
          //       ),
          // ),
        ],
      ),
    ),
  );
}
