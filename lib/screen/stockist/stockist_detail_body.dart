import 'package:flutter/material.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:saur_admin/utils/colors.dart';
import 'package:saur_admin/widgets/gaps.dart';
import 'package:saur_admin/widgets/input_field_light.dart';

import '../../utils/theme.dart';

Card getDealerUnderStockist(BuildContext context) {
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
                      title: Text('Dealer $index'),
                      subtitle: Text('dealer$index.@gmail.com'),
                      leading: Image.asset(
                        'assets/images/dummy_logo.jpg',
                        width: 60,
                      ),
                    ),
                separatorBuilder: (context, index) => const Divider(
                      color: dividerColor,
                    ),
                itemCount: 20),
          )
        ],
      ),
    ),
  );
}

Card getStockistDetailCard(BuildContext context) {
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
            'Last allotment on',
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
            'Total alloted serial number',
            style: Theme.of(context).textTheme.titleMedium,
          ),
          Text(
            '1000',
            style: Theme.of(context).textTheme.titleSmall?.copyWith(
                  color: textColorDark,
                  height: 1.8,
                  fontWeight: FontWeight.bold,
                ),
          ),
          verticalGap(defaultPadding),
          Text(
            'Last alloted dealer',
            style: Theme.of(context).textTheme.titleMedium,
          ),
          Text(
            'Sham Lal / sham.lal@gmail.com',
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
