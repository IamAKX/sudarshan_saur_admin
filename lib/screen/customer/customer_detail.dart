import 'package:flutter/material.dart';
import 'package:saur_admin/screen/customer/customer_detail_body.dart';
import 'package:saur_admin/screen/customer/customer_detail_header.dart';
import 'package:saur_admin/utils/responsive.dart';

import '../../utils/theme.dart';
import '../../widgets/gaps.dart';
import '../../widgets/header.dart';

class CustomerDetail extends StatefulWidget {
  const CustomerDetail({
    super.key,
    required this.navigateMenu,
  });
  final Function(int index) navigateMenu;

  @override
  State<CustomerDetail> createState() => _CustomerDetailState();
}

class _CustomerDetailState extends State<CustomerDetail> {
  bool isBlocked = false;
  bool isActive = false;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(defaultPadding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Header(
              title: 'Customer Detail',
              navigateMenu: widget.navigateMenu,
              navigateToIndex: 2),
          verticalGap(
            defaultPadding * 2,
          ),
          CustomerDetailHeader(
            name: 'John Doe',
            email: 'john.doe@email.com',
            phone: '+91 9841523677',
            isActive: isActive,
            isBlocked: isBlocked,
            toggleIsActive: (val) {
              setState(() {
                isActive = val;
              });
            },
            toggleIsBlocked: (val) {
              setState(() {
                isBlocked = val;
              });
            },
          ),
          verticalGap(defaultPadding),
          Responsive(
            mobile: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                getCustomerDetailCard(context),
                getCustomerWarrentyCard(context)
              ],
            ),
            desktop: Row(
              children: [
                Expanded(
                  child: getCustomerDetailCard(context),
                ),
                Expanded(
                  child: getCustomerWarrentyCard(context),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
