import 'package:flutter/material.dart';
import 'package:saur_admin/model/stockist_model.dart';
import 'package:saur_admin/model/warranty_model.dart';

import '../../model/customer_model.dart';
import '../../utils/colors.dart';
import '../../utils/enum.dart';
import '../../utils/helper_methods.dart';
import '../../utils/theme.dart';
import '../../widgets/date_time_formatter.dart';
import '../../widgets/gaps.dart';

Card getWarrentyDetailsCard(
    BuildContext context, WarrantyModel? warrantyModel) {
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
            style: Theme.of(context).textTheme.titleSmall,
          ),
          Text(
            warrantyModel?.warrantySerialNo ?? '-',
            style: Theme.of(context).textTheme.titleSmall?.copyWith(
                  color: textColorDark,
                  height: 1.8,
                  fontWeight: FontWeight.bold,
                ),
          ),
          verticalGap(defaultPadding),
          Text(
            'Invoice',
            style: Theme.of(context).textTheme.titleSmall,
          ),
          Text(
            warrantyModel?.invoiceNo ?? '-',
            style: Theme.of(context).textTheme.titleSmall?.copyWith(
                  color: textColorDark,
                  height: 1.8,
                  fontWeight: FontWeight.bold,
                ),
          ),
          verticalGap(defaultPadding),
          Text(
            'Installed On',
            style: Theme.of(context).textTheme.titleSmall,
          ),
          Text(
            DateTimeFormatter.onlyDateShort(
                warrantyModel?.installationDate ?? ''),
            style: Theme.of(context).textTheme.titleSmall?.copyWith(
                  color: textColorDark,
                  height: 1.8,
                  fontWeight: FontWeight.bold,
                ),
          ),
          verticalGap(defaultPadding),
          Text(
            'System info',
            style: Theme.of(context).textTheme.titleSmall,
          ),
          Text(
            '${warrantyModel?.lpd ?? ''} ${warrantyModel?.model ?? ''} ${warrantyModel?.itemDescription ?? ''}',
            style: Theme.of(context).textTheme.titleSmall?.copyWith(
                  color: textColorDark,
                  height: 1.8,
                  fontWeight: FontWeight.bold,
                ),
          ),
          verticalGap(defaultPadding),
          Text(
            'Guarantee',
            style: Theme.of(context).textTheme.titleSmall,
          ),
          Text(
            warrantyModel?.guaranteePeriod ?? '',
            style: Theme.of(context).textTheme.titleSmall?.copyWith(
                  color: textColorDark,
                  height: 1.8,
                  fontWeight: FontWeight.bold,
                ),
          ),
          Text(
            'Place',
            style: Theme.of(context).textTheme.titleSmall,
          ),
          Text(
            warrantyModel?.state ?? '',
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

Card getWarrantyStockistBusinessCard(
    BuildContext context, StockistModel? stockistModel) {
  return Card(
    color: Colors.white,
    child: Container(
      width: double.infinity,
      padding: const EdgeInsets.all(defaultPadding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Stockist Business Detail',
            style: Theme.of(context)
                .textTheme
                .titleLarge
                ?.copyWith(color: primaryColor),
          ),
          verticalGap(defaultPadding),
          Text(
            'Stockist ID',
            style: Theme.of(context).textTheme.titleMedium,
          ),
          Text(
            '${stockistModel?.stockistId ?? ''}',
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
            stockistModel?.businessName ?? '',
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
            '${stockistModel?.businessAddress}',
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

Card getWarrantyStockistBusinessDetailCard(
    BuildContext context, StockistModel? stockistModel) {
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
            'Stockist Detail',
            style: Theme.of(context)
                .textTheme
                .titleLarge
                ?.copyWith(color: primaryColor),
          ),
          verticalGap(defaultPadding),
          Text(
            'Stockist Id',
            style: Theme.of(context).textTheme.titleMedium,
          ),
          Text(
            '${stockistModel?.stockistId}',
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
            DateTimeFormatter.onlyDateShortWithTime(stockistModel?.lastLogin ?? ''),
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
            '${stockistModel?.mobileNo}',
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
            '${stockistModel?.email}',
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
            prepareAddress(stockistModel?.address),
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

Card getWarrantyCustomerDetailCard(
    BuildContext context, CustomerModel? customerModel) {
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
            DateTimeFormatter.onlyDateShortWithTime(customerModel?.lastLogin ?? ''),
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
            DateTimeFormatter.onlyDateShort(
                customerModel?.lastPurchaseDate ?? ''),
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
            '-',
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
