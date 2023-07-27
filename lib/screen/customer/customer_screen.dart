import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_web_data_table/web_data_table.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:saur_admin/screen/home_container/home_container.dart';
import 'package:saur_admin/utils/api.dart';
import 'package:saur_admin/utils/colors.dart';
import 'package:saur_admin/utils/dummy/dummy_users.dart';
import 'package:saur_admin/utils/enum.dart';
import 'package:saur_admin/utils/theme.dart';
import 'package:saur_admin/widgets/date_time_formatter.dart';
import 'package:saur_admin/widgets/input_field_light.dart';

import '../../model/table/customer_for_table.dart';
import '../../services/api_service.dart';
import '../../widgets/gaps.dart';
import '../../widgets/header.dart';

class CustomerScreen extends StatefulWidget {
  const CustomerScreen({super.key, required this.navigateMenu});
  final Function(int index) navigateMenu;
  @override
  State<CustomerScreen> createState() => _CustomerScreenState();
}

class _CustomerScreenState extends State<CustomerScreen> {
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
    _sortColumnName = 'name';
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
    await _api.getAllCustomer().then((value) {
      setState(() {
        debugPrint(value.toString());
        list.clear();
        value?.data?.forEach((e) {
          var map = {
            'customerId': e.customerId,
            'customerName': e.customerName,
            'email': e.email,
            'mobileNo': e.mobileNo,
            'createdOn': DateTimeFormatter.onlyDateLong(e.createdOn ?? ''),
            'status': e.status,
            'view': e.customerId.toString(),
            'isActive': {
              'id': e.customerId,
              'status': e.status == 'ACTIVE',
            },
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
          const Header(title: 'Customer'),
          verticalGap(
            defaultPadding * 2,
          ),
          Theme(
            data: ThemeData(cardColor: Colors.white),
            child: WebDataTable(
              columnSpacing: 25,
              header: const Text('All Customers'),
              source: WebDataTableSource(
                sortColumnName: _sortColumnName,
                sortAscending: _sortAscending,
                filterTexts: _filterTexts,
                columns: [
                  WebDataColumn(
                    name: 'customerId',
                    label: const Text('ID'),
                    dataCell: (value) => DataCell(Text('$value')),
                  ),
                  WebDataColumn(
                    name: 'customerName',
                    label: const Text('Name'),
                    dataCell: (value) => DataCell(Text('$value')),
                  ),
                  WebDataColumn(
                    name: 'email',
                    label: const Text('Email'),
                    dataCell: (value) => DataCell(Text('$value')),
                    sortable: true,
                  ),
                  WebDataColumn(
                    name: 'mobileNo',
                    label: const Text('Phone'),
                    dataCell: (value) => DataCell(Text('$value')),
                  ),
                  WebDataColumn(
                    name: 'createdOn',
                    label: const Text('Onboarded'),
                    dataCell: (value) => DataCell(Text('$value')),
                  ),
                  WebDataColumn(
                    name: 'status',
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
                        log('view value = $value');
                        return DataCell(
                          IconButton(
                              onPressed: () {
                                HomeContainer.args = value;
                                widget.navigateMenu(21);
                              },
                              icon: const Icon(LineAwesomeIcons.eye)),
                        );
                      }),
                  WebDataColumn(
                    name: 'isActive',
                    label: const Text('Toggle Status'),
                    sortable: false,
                    dataCell: (value) {
                      return DataCell(
                        Switch(
                          value: value['status'],
                          onChanged: (state) async {
                            _api
                                .updateUser(
                                    Api.customer,
                                    {
                                      'status': state
                                          ? UserStatus.ACTIVE.name
                                          : UserStatus.BLOCKED.name
                                    },
                                    value['id'])
                                .then(
                              (value) {
                                //          setState(() {
                                //   list.firstWhere((element) =>
                                //       element['customerId'] ==
                                //       value['id'])['isActive']['status'] = state;
                                // });
                                reloadScreen();
                              },
                            );
                          },
                        ),
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
