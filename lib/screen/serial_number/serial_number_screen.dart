import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_web_data_table/web_data_table.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:saur_admin/utils/theme.dart';
import 'package:saur_admin/widgets/input_field_light.dart';

import '../../services/api_service.dart';
import '../../utils/colors.dart';
import '../../widgets/date_time_formatter.dart';
import '../../widgets/gaps.dart';
import '../../widgets/header.dart';
import '../home_container/home_container.dart';

class SerialNumberScreen extends StatefulWidget {
  const SerialNumberScreen({super.key, required this.navigateMenu});
  final Function(int index) navigateMenu;
  @override
  State<SerialNumberScreen> createState() => _SerialNumberScreenState();
}

class _SerialNumberScreenState extends State<SerialNumberScreen> {
  final TextEditingController search = TextEditingController();
  late String _sortColumnName;
  late bool _sortAscending;
  List<String>? _filterTexts;
  bool _willSearch = true;
  Timer? _timer;
  int? _latestTick;
  final List<String> _selectedRowKeys = [];
  int _rowsPerPage = 10;

  late ApiProvider _api;
  List<Map<String, dynamic>> list = [];

  @override
  void initState() {
    super.initState();
    _sortColumnName = 'id';
    _sortAscending = false;
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (!_willSearch) {
        if (_latestTick != null && timer.tick > _latestTick!) {
          _willSearch = true;
        }
      }
      if (_willSearch) {
        _willSearch = false;
        _latestTick = null;
        setState(() {
          if (_filterTexts != null && _filterTexts!.isNotEmpty) {
            _filterTexts = _filterTexts;
          }
        });
      }
    });

    WidgetsBinding.instance.addPostFrameCallback(
      (_) => reloadScreen(),
    );
  }

  reloadScreen() async {
    await _api.getAllWarrantyRequest().then((value) {
      setState(() {
        list.clear();
        value?.data?.forEach((e) {
          var map = {
            'warrantySerialNo': e.warrantySerialNo,
            'customerId': e.customer?.customerId,
            'customerName': e.customer?.customerName,
            'stockistId': e.stockists?.stockistId,
            'stockistName': e.stockists?.stockistName,
            'initUserType': e.initUserType,
            'createdOn': DateTimeFormatter.onlyDateLong(e.createdOn ?? ''),
            'allocationStatus': e.allocationStatus ?? '',
            'view': e.warrantySerialNo.toString(),
          };
          list.add(map);
        });
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
    _timer?.cancel();
    _timer = null;
  }

  @override
  Widget build(BuildContext context) {
    _api = Provider.of<ApiProvider>(context);
    return SingleChildScrollView(
      padding: const EdgeInsets.all(defaultPadding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Header(title: 'Serial Number'),
          verticalGap(
            defaultPadding * 2,
          ),
          Theme(
            data: ThemeData(cardColor: Colors.white),
            child: WebDataTable(
              columnSpacing: 25,
              header: const Text('All Assigned Serial Numbers'),
              source: WebDataTableSource(
                sortColumnName: _sortColumnName,
                sortAscending: _sortAscending,
                filterTexts: _filterTexts,
                columns: [
                  WebDataColumn(
                    name: 'warrantySerialNo',
                    label: const Text('Serial'),
                    dataCell: (value) => DataCell(Text('$value')),
                  ),
                  WebDataColumn(
                    name: 'customerId',
                    label: const Text('Cust. Id'),
                    dataCell: (value) => DataCell(Text('$value')),
                  ),
                  WebDataColumn(
                    name: 'customerName',
                    label: const Text('Customer Name'),
                    dataCell: (value) => DataCell(Text('$value')),
                    sortable: true,
                  ),
                  WebDataColumn(
                    name: 'stockistId',
                    label: const Text('Stockist Id'),
                    dataCell: (value) => DataCell(Text('$value')),
                  ),
                  WebDataColumn(
                    name: 'stockistName',
                    label: const Text('Stockist Name'),
                    dataCell: (value) => DataCell(Text('$value')),
                  ),
                  WebDataColumn(
                    name: 'initUserType',
                    label: const Text('Initiator'),
                    dataCell: (value) => DataCell(Text('$value')),
                  ),
                  WebDataColumn(
                    sortable: false,
                    name: 'createdOn',
                    label: const Text('Created On'),
                    dataCell: (value) => DataCell(Text('$value')),
                  ),
                  WebDataColumn(
                    name: 'allocationStatus',
                    label: const Text('Status'),
                    dataCell: (value) => DataCell(
                      Text(
                        '$value',
                        style: Theme.of(context).textTheme.titleSmall?.copyWith(
                              color: getColorByStatus(value),
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                    ),
                  ),
                  WebDataColumn(
                    sortable: false,
                    name: 'view',
                    label: const Text('View'),
                    dataCell: (value) {
                      return DataCell(
                        IconButton(
                            onPressed: () {
                              HomeContainer.args = value;
                              widget.navigateMenu(51);
                            },
                            icon: const Icon(LineAwesomeIcons.eye)),
                      );
                    },
                  ),
                ],
                rows: list,
                selectedRowKeys: _selectedRowKeys,
                onTapRow: (rows, index) {
                  log('onTapRow(): index = $index, row = ${rows[index]}');
                },
                primaryKeyName: 'id',
              ),
              onSort: (columnName, ascending) {
                log('onSort(): columnName = $columnName, ascending = $ascending');
                setState(() {
                  _sortColumnName = columnName;
                  _sortAscending = ascending;
                });
              },
              onRowsPerPageChanged: (rowsPerPage) {
                log('onRowsPerPageChanged(): rowsPerPage = $rowsPerPage');
                setState(() {
                  if (rowsPerPage != null) {
                    _rowsPerPage = rowsPerPage;
                  }
                });
              },
              rowsPerPage: _rowsPerPage,
              onPageChanged: (value) {},
              actions: [
                SizedBox(
                  width: 300,
                  child: InputFieldLight(
                    hint: 'Search',
                    controller: search,
                    keyboardType: TextInputType.text,
                    obscure: false,
                    icon: LineAwesomeIcons.search,
                    onChange: (text) {
                      _filterTexts = text.trim().split(' ');
                      _willSearch = false;
                      _latestTick = _timer?.tick;
                    },
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
