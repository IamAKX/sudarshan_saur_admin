import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:saur_admin/model/stockist_model.dart';
import 'package:saur_admin/screen/customer/customer_detail_body.dart';
import 'package:saur_admin/screen/customer/customer_detail_header.dart';
import 'package:saur_admin/screen/dealer/dealer_detail_body.dart';
import 'package:saur_admin/screen/stockist/stockist_detail_body.dart';
import 'package:saur_admin/utils/responsive.dart';

import '../../model/dealer_model.dart';
import '../../services/api_service.dart';
import '../../utils/enum.dart';
import '../../utils/theme.dart';
import '../../widgets/gaps.dart';
import '../../widgets/header.dart';
import '../home_container/home_container.dart';

class StockistDetail extends StatefulWidget {
  const StockistDetail({
    super.key,
    required this.navigateMenu,
  });
  final Function(int index) navigateMenu;

  @override
  State<StockistDetail> createState() => _StockistDetailState();
}

class _StockistDetailState extends State<StockistDetail> {
  bool isBlocked = false;
  bool isActive = false;

  late ApiProvider _api;
  StockistModel? stockistModel;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback(
      (_) => reloadScreen(),
    );
  }

  reloadScreen() async {
    _api.getStockistById(int.parse(HomeContainer.args)).then((value) {
      setState(() {
        stockistModel = value;
        debugPrint(stockistModel.toString());
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
              title: 'Stockist Detail',
              navigateMenu: widget.navigateMenu,
              navigateToIndex: 4),
          verticalGap(
            defaultPadding * 2,
          ),
          CustomerDetailHeader(
            name: '${stockistModel?.stockistName}',
            email: '${stockistModel?.email}',
            phone: '${stockistModel?.mobileNo}',
            isActive: stockistModel?.status == UserStatus.ACTIVE.name,
            isBlocked: stockistModel?.status == UserStatus.BLOCKED.name,
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
                getStockistDetailCard(context, stockistModel),
                getDealerUnderStockist(context, stockistModel),
              ],
            ),
            desktop: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: getStockistDetailCard(context, stockistModel),
                ),
                Expanded(
                  child: getDealerUnderStockist(context, stockistModel),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
