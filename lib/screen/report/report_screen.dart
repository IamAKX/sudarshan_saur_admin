import 'dart:convert';
import 'dart:typed_data';

import 'package:file_saver/file_saver.dart';
import 'package:flutter/material.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:saur_admin/model/list/list_customer_model.dart';
import 'package:saur_admin/model/list/list_sdw_model.dart';
import 'package:saur_admin/model/list/list_stockist_model.dart';
import 'package:saur_admin/screen/report/generate_report.dart';
import 'package:saur_admin/utils/colors.dart';
import 'package:saur_admin/utils/dummy/dummy_data.dart';
import 'package:saur_admin/widgets/date_time_formatter.dart';

import '../../model/list/list_dealer_model.dart';
import '../../model/list/list_warranty_model.dart';
import '../../services/api_service.dart';
import '../../utils/theme.dart';
import '../../widgets/gaps.dart';
import '../../widgets/header.dart';

class ReportScreen extends StatefulWidget {
  const ReportScreen({super.key, required this.navigateMenu});
  final Function(int index) navigateMenu;
  @override
  State<ReportScreen> createState() => _ReportScreenState();
}

class _ReportScreenState extends State<ReportScreen> {
  late ApiProvider _api;
  bool isPreparingReport = false;
  ListWarrantyModel? warrantyRequestList;
  ListCustomerModel? customerList;
  ListStockistModel? stockistList;
  ListDealerModel? dealerList;
  ListSdwModel? sdwList;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback(
      (_) => reloadScreen(),
    );
  }

  reloadScreen() async {
    warrantyRequestList = await _api.getAllWarrantyRequest();
    customerList = await _api.getAllCustomer();
    stockistList = await _api.getAllStockist();
    dealerList = await _api.getAllDealers();
    sdwList = await _api.getSdwList();
  }

  @override
  Widget build(BuildContext context) {
    _api = Provider.of<ApiProvider>(context);
    return Padding(
      padding: const EdgeInsets.all(defaultPadding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Header(title: 'Reports'),
          verticalGap(
            defaultPadding * 2,
          ),
          isPreparingReport || _api.status == ApiStatus.loading
              ? Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const CircularProgressIndicator(),
                      verticalGap(defaultPadding),
                      const Text(
                          'Please wait, preparing data can take upto 10 minutes')
                    ],
                  ),
                )
              : Expanded(
                  child: Card(
                      color: Colors.white,
                      child: ListView(
                        children: [
                          ListTile(
                            title: const Text(
                              'CDM Report',
                            ),
                            trailing: IconButton(
                              onPressed: () async {
                                setState(() {
                                  isPreparingReport = true;
                                });

                                String csv = getCDMReport(warrantyRequestList);
                                downloadCSV(csv,
                                    'CDM_Report_${DateTimeFormatter.now()}');
                                setState(() {
                                  isPreparingReport = false;
                                });
                              },
                              icon: const Icon(
                                LineAwesomeIcons.file_download,
                              ),
                            ),
                          ),
                          ListTile(
                            title: const Text(
                              'Customer',
                            ),
                            trailing: IconButton(
                              onPressed: () async {
                                setState(() {
                                  isPreparingReport = true;
                                });

                                String csv = getCustomerReport(
                                    warrantyRequestList, customerList);
                                downloadCSV(
                                    csv, 'Customer_${DateTimeFormatter.now()}');
                                setState(() {
                                  isPreparingReport = false;
                                });
                              },
                              icon: const Icon(
                                LineAwesomeIcons.file_download,
                              ),
                            ),
                          ),
                          ListTile(
                            title: const Text(
                              'Stockist',
                            ),
                            trailing: IconButton(
                              onPressed: () async {
                                setState(() {
                                  isPreparingReport = true;
                                });

                                String csv = getStockistReport(
                                    warrantyRequestList, stockistList, sdwList);
                                downloadCSV(
                                    csv, 'Stockist_${DateTimeFormatter.now()}');
                                setState(() {
                                  isPreparingReport = false;
                                });
                              },
                              icon: const Icon(
                                LineAwesomeIcons.file_download,
                              ),
                            ),
                          ),
                          ListTile(
                            title: const Text(
                              'Dealer',
                            ),
                            trailing: IconButton(
                              onPressed: () async {
                                setState(() {
                                  isPreparingReport = true;
                                });

                                String csv = getDealerReport(
                                    warrantyRequestList,
                                    dealerList,
                                    sdwList,
                                    stockistList);
                                downloadCSV(
                                    csv, 'Dealer_${DateTimeFormatter.now()}');
                                setState(() {
                                  isPreparingReport = false;
                                });
                              },
                              icon: const Icon(
                                LineAwesomeIcons.file_download,
                              ),
                            ),
                          ),
                          ListTile(
                            title: const Text(
                              'Plumber',
                            ),
                            trailing: IconButton(
                              onPressed: () async {
                                setState(() {
                                  isPreparingReport = true;
                                });

                                String csv = getPlumberReport(
                                  warrantyRequestList,
                                );
                                downloadCSV(
                                    csv, 'Plumber_${DateTimeFormatter.now()}');
                                setState(() {
                                  isPreparingReport = false;
                                });
                              },
                              icon: const Icon(
                                LineAwesomeIcons.file_download,
                              ),
                            ),
                          ),
                          ListTile(
                            title: const Text(
                              'Technician',
                            ),
                            trailing: IconButton(
                              onPressed: () async {
                                setState(() {
                                  isPreparingReport = true;
                                });

                                String csv = getTechnicianReport(
                                  warrantyRequestList,
                                );
                                downloadCSV(csv,
                                    'Technician_${DateTimeFormatter.now()}');
                                setState(() {
                                  isPreparingReport = false;
                                });
                              },
                              icon: const Icon(
                                LineAwesomeIcons.file_download,
                              ),
                            ),
                          ),
                          ListTile(
                            title: const Text(
                              'Guarantee',
                            ),
                            trailing: IconButton(
                              onPressed: () async {
                                setState(() {
                                  isPreparingReport = true;
                                });

                                String csv = getWarrantyReport(
                                  warrantyRequestList,
                                  sdwList,stockistList
                                );
                                downloadCSV(csv,
                                    'Guarantee_${DateTimeFormatter.now()}');
                                setState(() {
                                  isPreparingReport = false;
                                });
                              },
                              icon: const Icon(
                                LineAwesomeIcons.file_download,
                              ),
                            ),
                          ),
                        ],
                      )),
                )
        ],
      ),
    );
  }

  downloadCSV(String data, String fileName) async {
    // Convert your CSV string to a Uint8List for downloading.
    Uint8List bytes = Uint8List.fromList(utf8.encode(data));

    // This will download the file on the device.
    await FileSaver.instance.saveFile(
      name: fileName, // you can give the CSV file name here.
      bytes: bytes,
      ext: 'csv',
      mimeType: MimeType.csv,
    );
  }
}
