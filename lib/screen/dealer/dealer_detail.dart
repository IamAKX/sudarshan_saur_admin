import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:saur_admin/model/dealer_model.dart';
import 'package:saur_admin/screen/customer/customer_detail_body.dart';
import 'package:saur_admin/screen/customer/customer_detail_header.dart';
import 'package:saur_admin/screen/dealer/dealer_detail_body.dart';
import 'package:saur_admin/utils/responsive.dart';

import '../../services/api_service.dart';
import '../../utils/api.dart';
import '../../utils/enum.dart';
import '../../utils/theme.dart';
import '../../widgets/gaps.dart';
import '../../widgets/header.dart';
import '../home_container/home_container.dart';

class DealerDetail extends StatefulWidget {
  const DealerDetail({
    super.key,
    required this.navigateMenu,
  });
  final Function(int index) navigateMenu;

  @override
  State<DealerDetail> createState() => _DealerDetailState();
}

class _DealerDetailState extends State<DealerDetail> {
  bool isBlocked = false;
  bool isActive = false;
  late ApiProvider _api;
  DealerModel? dealerModel;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback(
      (_) => reloadScreen(),
    );
  }

  reloadScreen() async {
    _api.getDealerById(int.parse(HomeContainer.args)).then((value) {
      setState(() {
        dealerModel = value;
        debugPrint(dealerModel.toString());
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    _api = Provider.of<ApiProvider>(context);
    if (_api.status == ApiStatus.loading) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    }
    return SingleChildScrollView(
      padding: const EdgeInsets.all(defaultPadding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Header(
              title: 'Dealer Detail',
              navigateMenu: widget.navigateMenu,
              navigateToIndex: 3),
          verticalGap(
            defaultPadding * 2,
          ),
          CustomerDetailHeader(
            name: '${dealerModel?.dealerName}',
            email: '${dealerModel?.email}',
            phone: '${dealerModel?.mobileNo}',
            isActive: dealerModel?.status == UserStatus.ACTIVE.name,
            isBlocked: dealerModel?.status == UserStatus.BLOCKED.name,
            toggleIsActive: (val) {
              _api
                  .updateUser(
                      Api.dealers,
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
            toggleIsBlocked: (val) {
              _api
                  .updateUser(
                      Api.dealers,
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
                getDealerDetailCard(context, dealerModel),
                getDealerBusinessCard(context, dealerModel),
              ],
            ),
            desktop: Row(
              children: [
                Expanded(
                  child: getDealerDetailCard(context, dealerModel),
                ),
                Expanded(
                  child: getDealerBusinessCard(context, dealerModel),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
