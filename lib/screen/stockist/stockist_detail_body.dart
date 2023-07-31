import 'package:flutter/material.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:saur_admin/model/stockist_model.dart';
import 'package:saur_admin/utils/colors.dart';
import 'package:saur_admin/widgets/gaps.dart';
import 'package:saur_admin/widgets/input_field_light.dart';

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
                'Assigned Dealer',
                style: Theme.of(context)
                    .textTheme
                    .titleLarge
                    ?.copyWith(color: primaryColor),
              ),
              TextButton(
                onPressed: () {
                  showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        TextEditingController dealerIdCtrl =
                            TextEditingController();
                        return AlertDialog(
                          title: const Text('Assign new dealer'),
                          content: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              const Text('Enter dealer id'),
                              verticalGap(defaultPadding / 2),
                              InputFieldLight(
                                  hint: 'Dealer ID',
                                  controller: dealerIdCtrl,
                                  keyboardType: TextInputType.number,
                                  obscure: false,
                                  icon: LineAwesomeIcons.user_tie)
                            ],
                          ),
                          actions: [
                            TextButton(
                              child: const Text('Cancel'),
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                            ),
                            TextButton(
                              child: const Text('Assign'),
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                            ),
                          ],
                        );
                      });
                },
                child: const Text('Assign Dealer'),
              )
            ],
          ),
          verticalGap(defaultPadding),
          SizedBox(
            height: MediaQuery.of(context).size.height -
                (defaultPadding * 15 + 100),
            child: ListView.separated(
                shrinkWrap: true,
                itemBuilder: (context, index) => ListTile(
                      title: Text(stockistModel?.dealers
                              ?.elementAt(index)
                              .businessName ??
                          ''),
                      subtitle: Text(
                          stockistModel?.dealers?.elementAt(index).dealerName ??
                              ''),
                      leading: Image.asset(
                        'assets/images/dummy_logo.jpg',
                        width: 60,
                      ),
                    ),
                separatorBuilder: (context, index) => const Divider(
                      color: dividerColor,
                    ),
                itemCount: stockistModel?.dealers?.length ?? 0),
          )
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
            'Last allotment on',
            style: Theme.of(context).textTheme.titleMedium,
          ),
          Text(
            DateTimeFormatter.onlyDateShort(stockistModel?.updatedOn ?? ''),
            style: Theme.of(context).textTheme.titleSmall?.copyWith(
                  color: textColorDark,
                  height: 1.8,
                  fontWeight: FontWeight.bold,
                ),
          ),
          verticalGap(defaultPadding),
          Text(
            'Total alloted serial number',
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
          verticalGap(defaultPadding),
          Text(
            'Total assigned dealer',
            style: Theme.of(context).textTheme.titleMedium,
          ),
          Text(
            stockistModel?.dealers?.length.toString() ?? '',
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
