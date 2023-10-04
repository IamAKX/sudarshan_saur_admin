import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:saur_admin/model/warranty_request_model.dart';
import 'package:saur_admin/screen/serial_number/serial_detail_card.dart';
import 'package:saur_admin/services/toast_service.dart';
import 'package:saur_admin/utils/colors.dart';
import 'package:saur_admin/utils/enum.dart';
import 'package:saur_admin/widgets/date_time_formatter.dart';

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
  bool isPhotoChecked = false;
  bool isOtherInfoChecked = false;

  late ApiProvider _api;
  WarrantyRequestModel? warrantyModel;
  final TextEditingController rejectReasonCtrl = TextEditingController();
  final TextEditingController verifiedByCtrl = TextEditingController();
  String verificationDate = DateTimeFormatter.now();

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
        verifiedByCtrl.text = warrantyModel?.verifiedBy ?? '';
        verificationDate =
            warrantyModel?.verifiedDate ?? DateTimeFormatter.now();
        isPhotoChecked = warrantyModel?.photoChecked ?? false;
        isOtherInfoChecked = warrantyModel?.otherInfoChecked ?? false;
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
                CheckboxListTile(
                  tileColor: Colors.white,
                  value: isPhotoChecked,
                  onChanged: (value) {
                    setState(() {
                      isPhotoChecked = value ?? false;
                    });
                  },
                  title: const Text('Photos Checked'),
                ),
                CheckboxListTile(
                  tileColor: Colors.white,
                  value: isOtherInfoChecked,
                  onChanged: (value) {
                    setState(() {
                      isOtherInfoChecked = value ?? false;
                    });
                  },
                  title: const Text('Other info Checked'),
                ),
                ListTile(
                  tileColor: Colors.white,
                  onTap: () async {
                    DateTime? pickedDate = await showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime(
                          1980), //DateTime.now() - not to allow to choose before today.
                      lastDate: DateTime(2101),
                    );
                    if (pickedDate != null) {
                      setState(() {
                        verificationDate =
                            DateTimeFormatter.toDatebaseFormat(pickedDate);
                      });
                    }
                  },
                  title: Text(
                    DateTimeFormatter.onlyDateShort(verificationDate),
                  ),
                  subtitle: Text(
                    'Verification Date',
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    controller: verifiedByCtrl,
                    maxLines: 1,
                    decoration: const InputDecoration(
                      hintText: 'Verified By (Name)',
                      border: OutlineInputBorder(
                        borderSide: BorderSide(color: primaryColor),
                      ),
                    ),
                  ),
                ),
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
                      Row(
                        children: [
                          Expanded(
                            child: CheckboxListTile(
                              tileColor: Colors.white,
                              value: isPhotoChecked,
                              onChanged: (value) {
                                setState(() {
                                  isPhotoChecked = value ?? false;
                                });
                              },
                              title: const Text('Photos Checked'),
                            ),
                          ),
                          horizontalGap(defaultPadding / 2),
                          Expanded(
                            child: CheckboxListTile(
                              tileColor: Colors.white,
                              value: isOtherInfoChecked,
                              onChanged: (value) {
                                setState(() {
                                  isOtherInfoChecked = value ?? false;
                                });
                              },
                              title: const Text('Other info Checked'),
                            ),
                          )
                        ],
                      ),
                      verticalGap(defaultPadding / 2),
                      Row(
                        children: [
                          Expanded(
                            child: ListTile(
                              tileColor: Colors.white,
                              onTap: () async {
                                DateTime? pickedDate = await showDatePicker(
                                  context: context,
                                  initialDate: DateTime.now(),
                                  firstDate: DateTime(
                                      1980), //DateTime.now() - not to allow to choose before today.
                                  lastDate: DateTime(2101),
                                );
                                if (pickedDate != null) {
                                  setState(() {
                                    verificationDate =
                                        DateTimeFormatter.toDatebaseFormat(
                                            pickedDate);
                                  });
                                }
                              },
                              title: Text(
                                DateTimeFormatter.onlyDateShort(
                                    verificationDate),
                              ),
                              subtitle: Text(
                                'Verification Date',
                                style: Theme.of(context).textTheme.bodyMedium,
                              ),
                            ),
                          ),
                          horizontalGap(defaultPadding / 2),
                          Expanded(
                            child: TextField(
                              controller: verifiedByCtrl,
                              maxLines: 1,
                              decoration: const InputDecoration(
                                hintText: 'Verified By (Name)',
                                border: OutlineInputBorder(
                                  borderSide: BorderSide(color: primaryColor),
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextField(
                          controller: rejectReasonCtrl,
                          maxLines: 1,
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
        if (verifiedByCtrl.text.isEmpty) {
          ToastService.instance.showError('Enter verified by name');
          return;
        }
        if (!isPhotoChecked) {
          ToastService.instance.showError('Please check the photos');
          return;
        }
        if (!isOtherInfoChecked) {
          ToastService.instance.showError('Please check other information');
          return;
        }
        // if (!DateTimeFormatter.isValidInstallationDate(
        //     warrantyModel?.installationDate ?? '', verificationDate)) {
        //   ToastService.instance
        //       .showError('Verification date should be after installation date');
        //   return;
        // }

        _api.updateWarrantyRequest({
          'status': AllocationStatus.APPROVED.name,
          'photoChecked': isPhotoChecked,
          'otherInfoChecked': isOtherInfoChecked,
          'verifiedBy': verifiedByCtrl.text,
          'verifiedDate': verificationDate
        }, warrantyModel?.requestId?.toString() ?? '').then((value) {
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
        if (verifiedByCtrl.text.isEmpty) {
          ToastService.instance.showError('Enter verified by name');
          return;
        }
        if (!isPhotoChecked) {
          ToastService.instance.showError('Please check the photos');
          return;
        }
        if (!isOtherInfoChecked) {
          ToastService.instance.showError('Please check other information');
          return;
        }
        // if (!DateTimeFormatter.isValidInstallationDate(
        //     warrantyModel?.installationDate ?? '', verificationDate)) {
        //   ToastService.instance
        //       .showError('Verification date should be after installation date');
        //   return;
        // }
        _api.updateWarrantyRequest({
          'status': AllocationStatus.DECLINED.name,
          'rejectReason': rejectReasonCtrl.text,
          'photoChecked': isPhotoChecked,
          'otherInfoChecked': isOtherInfoChecked,
          'verifiedBy': verifiedByCtrl.text,
          'verifiedDate': verificationDate
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
