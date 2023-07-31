import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:saur_admin/model/customer_model.dart';
import 'package:saur_admin/screen/customer/customer_detail_body.dart';
import 'package:saur_admin/screen/customer/customer_detail_header.dart';
import 'package:saur_admin/screen/home_container/home_container.dart';
import 'package:saur_admin/utils/enum.dart';
import 'package:saur_admin/utils/responsive.dart';

import '../../services/api_service.dart';
import '../../utils/api.dart';
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
  late ApiProvider _api;
  CustomerModel? customerModel;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback(
      (_) => reloadScreen(),
    );
  }

  reloadScreen() async {
    _api.getCustomerById(int.parse(HomeContainer.args)).then((value) {
      setState(() {
        customerModel = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    _api = Provider.of<ApiProvider>(context);
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
            name: '${customerModel?.customerName}',
            email: '${customerModel?.email}',
            phone: '${customerModel?.mobileNo}',
            isActive: customerModel?.status == UserStatus.ACTIVE.name,
            isBlocked: customerModel?.status == UserStatus.BLOCKED.name,
            toggleIsActive: (val) async {
              _api
                  .updateUser(
                      Api.customer,
                      {
                        'status': val
                            ? UserStatus.ACTIVE.name
                            : UserStatus.SUSPENDED.name
                      },
                      int.parse(HomeContainer.args))
                  .then(
                (value) {
                  reloadScreen();
                },
              );
            },
            toggleIsBlocked: (val) async {
              log('${HomeContainer.args.runtimeType}');
              _api
                  .updateUser(
                      Api.customer,
                      {
                        'status': val
                            ? UserStatus.BLOCKED.name
                            : UserStatus.ACTIVE.name
                      },
                      int.parse(HomeContainer.args))
                  .then(
                (value) {
                  reloadScreen();
                },
              );
            },
          ),
          verticalGap(defaultPadding),
          Responsive(
            mobile: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                getCustomerDetailCard(context, customerModel),
                // getCustomerWarrentyCard(context, customerModel)
              ],
            ),
            desktop: Row(
              children: [
                Expanded(
                  child: getCustomerDetailCard(context, customerModel),
                ),
                Expanded(child: Container())
              ],
            ),
          )
        ],
      ),
    );
  }
}
