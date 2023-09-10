import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:saur_admin/model/warranty_model.dart';
import 'package:saur_admin/model/warranty_request_model.dart';
import 'package:saur_admin/screen/customer/customer_detail_body.dart';
import 'package:saur_admin/screen/serial_number/serial_detail_card.dart';
import 'package:saur_admin/services/toast_service.dart';
import 'package:saur_admin/utils/colors.dart';
import 'package:saur_admin/utils/enum.dart';

import '../../services/api_service.dart';
import '../../utils/responsive.dart';
import '../../utils/theme.dart';
import '../../widgets/gaps.dart';
import '../../widgets/header.dart';
import '../home_container/home_container.dart';

class SerialKeyDetail extends StatefulWidget {
  const SerialKeyDetail({
    Key? key,
    required this.navigateMenu,
  }) : super(key: key);
  final Function(int index) navigateMenu;

  @override
  State<SerialKeyDetail> createState() => _SerialKeyDetailState();
}

class _SerialKeyDetailState extends State<SerialKeyDetail> {
  bool isBlocked = false;

  late ApiProvider _api;
  WarrantyRequestModel? warrantyModel;
  final TextEditingController rejectReasonCtrl = TextEditingController();
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback(
      (_) => reloadScreen(),
    );
  }

  reloadScreen() async {
    _api.getWarrantyRequestById(HomeContainer.args).then((value) {
      setState(() {
        warrantyModel = value;
        debugPrint(warrantyModel.toString());
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
              title: 'Request Detail',
              navigateMenu: widget.navigateMenu,
              navigateToIndex: 5),
          verticalGap(
            defaultPadding * 2,
          ),
          verticalGap(defaultPadding),
          Responsive(
            mobile: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                getWarrentyDetailsCard(context, warrantyModel),
                getWarrantyCustomerDetailCard(context, warrantyModel),
                getWarrantyStockistBusinessCard(context, warrantyModel),
                getRequestQuestions(context, warrantyModel),
                verticalGap(defaultPadding),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    controller: rejectReasonCtrl,
                    maxLines: 3,
                    decoration: const InputDecoration(
                      hintText: 'Rejection reason',
                      border: OutlineInputBorder(
                        borderSide: BorderSide(color: primaryColor),
                      ),
                    ),
                  ),
                ),
                verticalGap(defaultPadding / 2),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      rejectedButton(context),
                      horizontalGap(defaultPadding),
                      acceptButton(context)
                    ],
                  ),
                ),
              ],
            ),
            desktop: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                    child: Column(
                  children: [
                    getWarrentyDetailsCard(context, warrantyModel),
                    getWarrantyCustomerDetailCard(context, warrantyModel),
                  ],
                )),
                Expanded(
                  child: Column(
                    children: [
                      getWarrantyStockistBusinessCard(context, warrantyModel),
                      getRequestQuestions(context, warrantyModel),
                      verticalGap(defaultPadding),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextField(
                          controller: rejectReasonCtrl,
                          maxLines: 3,
                          decoration: const InputDecoration(
                            hintText: 'Rejection reason',
                            border: OutlineInputBorder(
                              borderSide: BorderSide(color: primaryColor),
                            ),
                          ),
                        ),
                      ),
                      verticalGap(defaultPadding / 2),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            rejectedButton(context),
                            horizontalGap(defaultPadding),
                            acceptButton(context)
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  ElevatedButton acceptButton(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.green, // Background color
      ),
      onPressed: () async {
        _api.updateWarrantyRequest({'status': AllocationStatus.APPROVED.name},
            warrantyModel?.requestId?.toString() ?? '').then((value) {
          if (value) {
            ToastService.instance.showSuccess('Request approved');
          }
        });
      },
      child: Text(
        'Accept',
        style: Theme.of(context)
            .textTheme
            .labelLarge
            ?.copyWith(color: Colors.white),
      ),
    );
  }

  ElevatedButton rejectedButton(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.red, // Background color
      ),
      onPressed: () {
        if (rejectReasonCtrl.text.isEmpty) {
          ToastService.instance.showError('Add rejection reason');
          return;
        }
        _api.updateWarrantyRequest({
          'status': AllocationStatus.DECLINED.name,
          'rejectReason': rejectReasonCtrl.text
        }, warrantyModel?.requestId?.toString() ?? '').then((value) {
          if (value) {
            ToastService.instance.showSuccess('Request rejected');
            rejectReasonCtrl.text = '';
          }
        });
      },
      child: Text(
        'Reject',
        style: Theme.of(context)
            .textTheme
            .labelLarge
            ?.copyWith(color: Colors.white),
      ),
    );
  }
}
