import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:saur_admin/model/stockist_model.dart';
import 'package:saur_admin/model/warranty_model.dart';
import 'dart:html' as html;

import '../../model/customer_model.dart';
import '../../model/warranty_request_model.dart';
import '../../utils/colors.dart';
import '../../utils/enum.dart';
import '../../utils/helper_methods.dart';
import '../../utils/theme.dart';
import '../../widgets/date_time_formatter.dart';
import '../../widgets/gaps.dart';

Card getWarrentyDetailsCard(
    BuildContext context, WarrantyRequestModel? warrantyModel) {
  return Card(
    color: Colors.white,
    child: Container(
      width: double.infinity,
      padding: const EdgeInsets.all(defaultPadding),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Guarantee Detail',
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
                  warrantyModel?.warrantyDetails?.warrantySerialNo ?? '-',
                  style: Theme.of(context).textTheme.titleSmall?.copyWith(
                        color: textColorDark,
                        height: 1.8,
                      ),
                ),
                verticalGap(defaultPadding / 2),
                Text(
                  'Invoice',
                  style: Theme.of(context).textTheme.titleSmall,
                ),
                Text(
                  warrantyModel?.invoiceNumber ?? '-',
                  style: Theme.of(context).textTheme.titleSmall?.copyWith(
                        color: textColorDark,
                        height: 1.8,
                      ),
                ),
                verticalGap(defaultPadding / 2),
                Text(
                  'Installed On',
                  style: Theme.of(context).textTheme.titleSmall,
                ),
                Text(
                  warrantyModel?.installationDate ?? '',
                  style: Theme.of(context).textTheme.titleSmall?.copyWith(
                        color: textColorDark,
                        height: 1.8,
                      ),
                ),
                verticalGap(defaultPadding / 2),
                Text(
                  'System capacity',
                  style: Theme.of(context).textTheme.titleSmall,
                ),
                Text(
                  warrantyModel?.warrantyDetails?.lpd ?? '',
                  style: Theme.of(context).textTheme.titleSmall?.copyWith(
                        color: textColorDark,
                        height: 1.8,
                      ),
                ),
                verticalGap(defaultPadding / 2),
                Text(
                  'Model',
                  style: Theme.of(context).textTheme.titleSmall,
                ),
                Text(
                  warrantyModel?.warrantyDetails?.model ?? '',
                  style: Theme.of(context).textTheme.titleSmall?.copyWith(
                        color: textColorDark,
                        height: 1.8,
                      ),
                ),
                verticalGap(defaultPadding / 2),
                Text(
                  'Guarantee',
                  style: Theme.of(context).textTheme.titleSmall,
                ),
                Text(
                  warrantyModel?.warrantyDetails?.guaranteePeriod ?? '',
                  style: Theme.of(context).textTheme.titleSmall?.copyWith(
                        color: textColorDark,
                        height: 1.8,
                      ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Column(
              children: [
                Text(
                  'Serial Number',
                  style: Theme.of(context).textTheme.titleSmall?.copyWith(
                        color: textColorDark,
                        height: 1.8,
                      ),
                ),
                verticalGap(defaultPadding / 2),
                CachedNetworkImage(
                  imageUrl: warrantyModel?.images?.imgSystemSerialNo ?? '',
                  fit: BoxFit.fitWidth,
                  placeholder: (context, url) =>
                      const CircularProgressIndicator(),
                  errorWidget: (context, url, error) => const Center(
                    child: Text('Image not loaded'),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    ),
  );
}

Card getWarrantyStockistBusinessCard(
    BuildContext context, WarrantyRequestModel? warrantyRequestModel) {
  return Card(
    color: Colors.white,
    child: Container(
      width: double.infinity,
      padding: const EdgeInsets.all(defaultPadding),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
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
                  'Stockist Name',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                Text(
                  warrantyRequestModel?.warrantyDetails?.crmStockistName ?? '',
                  style: Theme.of(context).textTheme.titleSmall?.copyWith(
                        color: textColorDark,
                        height: 1.8,
                      ),
                ),
                verticalGap(defaultPadding / 2),
                Text(
                  'Stockist Phone No',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                Text(
                  warrantyRequestModel?.warrantyDetails?.crmStockistMobileNo ??
                      '',
                  style: Theme.of(context).textTheme.titleSmall?.copyWith(
                        color: textColorDark,
                        height: 1.8,
                      ),
                ),
                verticalGap(defaultPadding / 2),
                Text(
                  'Stockist Email',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                Text(
                  warrantyRequestModel?.warrantyDetails?.crmStockistEmail ?? '',
                  style: Theme.of(context).textTheme.titleSmall?.copyWith(
                        color: textColorDark,
                        height: 1.8,
                      ),
                ),
                verticalGap(defaultPadding),
                Text(
                  'Dealer Detail',
                  style: Theme.of(context)
                      .textTheme
                      .titleLarge
                      ?.copyWith(color: primaryColor),
                ),
                verticalGap(defaultPadding),
                Text(
                  'Dealer Name',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                Text(
                  warrantyRequestModel?.dealerInfo?.name ?? '',
                  style: Theme.of(context).textTheme.titleSmall?.copyWith(
                        color: textColorDark,
                        height: 1.8,
                      ),
                ),
                verticalGap(defaultPadding / 2),
                Text(
                  'Dealer Mobile',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                Text(
                  warrantyRequestModel?.dealerInfo?.mobile ?? '',
                  style: Theme.of(context).textTheme.titleSmall?.copyWith(
                        color: textColorDark,
                        height: 1.8,
                      ),
                ),
                verticalGap(defaultPadding / 2),
                Text(
                  'Dealer Place',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                Text(
                  warrantyRequestModel?.dealerInfo?.place ?? '',
                  style: Theme.of(context).textTheme.titleSmall?.copyWith(
                        color: textColorDark,
                        height: 1.8,
                      ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  'Technician Detail',
                  style: Theme.of(context)
                      .textTheme
                      .titleLarge
                      ?.copyWith(color: primaryColor),
                ),
                verticalGap(defaultPadding),
                Text(
                  'Technician Name',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                Text(
                  warrantyRequestModel?.technicianInfo?.name ?? '',
                  style: Theme.of(context).textTheme.titleSmall?.copyWith(
                        color: textColorDark,
                        height: 1.8,
                      ),
                ),
                verticalGap(defaultPadding / 2),
                Text(
                  'Technician Mobile',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                Text(
                  warrantyRequestModel?.technicianInfo?.mobile ?? '',
                  style: Theme.of(context).textTheme.titleSmall?.copyWith(
                        color: textColorDark,
                        height: 1.8,
                      ),
                ),
                verticalGap(defaultPadding / 2),
                Text(
                  'Technician Place',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                Text(
                  warrantyRequestModel?.technicianInfo?.place ?? '',
                  style: Theme.of(context).textTheme.titleSmall?.copyWith(
                        color: textColorDark,
                        height: 1.8,
                      ),
                ),
                verticalGap(defaultPadding),
                Text(
                  'Plumber Detail',
                  style: Theme.of(context)
                      .textTheme
                      .titleLarge
                      ?.copyWith(color: primaryColor),
                ),
                verticalGap(defaultPadding),
                Text(
                  'Plumber Name',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                Text(
                  warrantyRequestModel?.plumberInfo?.name ?? '',
                  style: Theme.of(context).textTheme.titleSmall?.copyWith(
                        color: textColorDark,
                        height: 1.8,
                      ),
                ),
                verticalGap(defaultPadding / 2),
                Text(
                  'Plumber Mobile',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                Text(
                  warrantyRequestModel?.plumberInfo?.mobile ?? '',
                  style: Theme.of(context).textTheme.titleSmall?.copyWith(
                        color: textColorDark,
                        height: 1.8,
                      ),
                ),
                verticalGap(defaultPadding / 2),
                Text(
                  'Plumber Place',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                Text(
                  warrantyRequestModel?.plumberInfo?.place ?? '',
                  style: Theme.of(context).textTheme.titleSmall?.copyWith(
                        color: textColorDark,
                        height: 1.8,
                      ),
                ),
              ],
            ),
          ),
        ],
      ),
    ),
  );
}

Card getRequestQuestions(
    BuildContext context, WarrantyRequestModel? warrantyRequestModel) {
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
              'Other Information',
              style: Theme.of(context)
                  .textTheme
                  .titleLarge
                  ?.copyWith(color: primaryColor),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: warrantyRequestModel?.answers
                      ?.map(
                        (e) => RichText(
                          text: TextSpan(
                            text: e.questions?.questionText ?? '',
                            style: Theme.of(context)
                                .textTheme
                                .titleSmall
                                ?.copyWith(
                                  color: textColorDark,
                                  height: 1.8,
                                ),
                            children: <TextSpan>[
                              TextSpan(
                                text: '\t${e.answerText}',
                                style: Theme.of(context)
                                    .textTheme
                                    .titleSmall
                                    ?.copyWith(
                                      color: textColorDark,
                                      height: 1.8,
                                      fontWeight: FontWeight.bold,
                                    ),
                              ),
                            ],
                          ),
                        ),
                      )
                      .toList() ??
                  [],
            )
          ]),
    ),
  );
}

Card getWarrantyCustomerDetailCard(
    BuildContext context, WarrantyRequestModel? warrantyRequestModel) {
  return Card(
    color: Colors.white,
    child: Container(
      width: double.infinity,
      padding: const EdgeInsets.all(defaultPadding),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
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
                  'Name',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                Text(
                  warrantyRequestModel?.customers?.customerName ?? '',
                  style: Theme.of(context).textTheme.titleSmall?.copyWith(
                        color: textColorDark,
                        height: 1.8,
                      ),
                ),
                verticalGap(defaultPadding),
                Text(
                  'Address',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                Text(
                  prepareAddress(warrantyRequestModel?.installationAddress),
                  style: Theme.of(context).textTheme.titleSmall?.copyWith(
                        color: textColorDark,
                      ),
                ),
                verticalGap(defaultPadding),
                Text(
                  'Onbarding date',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                Text(
                  DateTimeFormatter.onlyDateShort(
                      warrantyRequestModel?.customers?.createdOn ?? ''),
                  style: Theme.of(context).textTheme.titleSmall?.copyWith(
                        color: textColorDark,
                        height: 1.8,
                      ),
                ),
                verticalGap(defaultPadding),
                Text(
                  'Last logged in',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                Text(
                  DateTimeFormatter.onlyDateShortWithTime(
                      warrantyRequestModel?.customers?.lastLogin ?? ''),
                  style: Theme.of(context).textTheme.titleSmall?.copyWith(
                        color: textColorDark,
                        height: 1.8,
                      ),
                ),
                verticalGap(defaultPadding),
                TextButton.icon(
                    onPressed: () {
                      html.window.open(
                          'https://maps.google.com?q=${warrantyRequestModel?.lat},${warrantyRequestModel?.lon}',
                          'new tab');
                    },
                    icon: Icon(Icons.location_pin),
                    label: Text('Location'))
              ],
            ),
          ),
          Expanded(
              child: Column(
            children: [
              Text(
                'System Live Image',
                style: Theme.of(context).textTheme.titleSmall?.copyWith(
                      color: textColorDark,
                      height: 1.8,
                    ),
              ),
              verticalGap(defaultPadding / 2),
              CachedNetworkImage(
                imageUrl: warrantyRequestModel?.images?.imgLiveSystem ?? '',
                fit: BoxFit.fitWidth,
                height: 250,
                placeholder: (context, url) =>
                    const CircularProgressIndicator(),
                errorWidget: (context, url, error) => const Center(
                  child: Text('Image not loaded'),
                ),
              ),
              verticalGap(defaultPadding),
              Text(
                'Aadhaar Image',
                style: Theme.of(context).textTheme.titleSmall?.copyWith(
                      color: textColorDark,
                      height: 1.8,
                    ),
              ),
              verticalGap(defaultPadding / 2),
              CachedNetworkImage(
                imageUrl: warrantyRequestModel?.images?.imgAadhar ?? '',
                fit: BoxFit.fitWidth,
                height: 250,
                placeholder: (context, url) =>
                    const CircularProgressIndicator(),
                errorWidget: (context, url, error) => const Center(
                  child: Text('Image not loaded'),
                ),
              ),
            ],
          ))
        ],
      ),
    ),
  );
}
