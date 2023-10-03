import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_web_data_table/web_data_table.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:saur_admin/utils/dummy/dummy_users.dart';
import 'package:saur_admin/utils/theme.dart';
import 'package:saur_admin/widgets/input_field_light.dart';

import '../../services/api_service.dart';
import '../../utils/api.dart';
import '../../utils/colors.dart';
import '../../utils/enum.dart';
import '../../widgets/date_time_formatter.dart';
import '../../widgets/gaps.dart';
import '../../widgets/header.dart';
import '../home_container/home_container.dart';

class DealerScreen extends StatefulWidget {
  const DealerScreen({super.key, required this.navigateMenu});
  final Function(int index) navigateMenu;
  @override
  State<DealerScreen> createState() => _DealerScreenState();
}

class _DealerScreenState extends State<DealerScreen> {
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
    _sortAscending = true;
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
    await _api.getAllDealers().then((value) {
      setState(() {
        list.clear();
        value?.data?.forEach((e) {
          var map = {
            'dealerId': e.dealerId,
            'dealerName': e.dealerName,
            'businessName': e.businessName,
            'mobileNo': e.mobileNo,
            'createdOn': DateTimeFormatter.onlyDateLong(e.createdOn ?? ''),
            'status': e.status,
            'view': e.dealerId.toString(),
            'isActive': {
              'id': e.dealerId,
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
          const Header(title: 'Dealer'),
          verticalGap(
            defaultPadding * 2,
          ),
          Theme(
            data: ThemeData(cardColor: Colors.white),
            child: WebDataTable(
              columnSpacing: 25,
              header: const Text('All Dealers'),
              source: WebDataTableSource(
                sortColumnName: _sortColumnName,
                sortAscending: _sortAscending,
                filterTexts: _filterTexts,
                columns: [
                  WebDataColumn(
                    name: 'dealerId',
                    label: const Text('ID'),
                    dataCell: (value) => DataCell(Text('$value')),
                  ),
                  WebDataColumn(
                    name: 'dealerName',
                    label: const Text('Name'),
                    dataCell: (value) => DataCell(Text('$value')),
                  ),
                  WebDataColumn(
                    name: 'businessName',
                    label: const Text('Business Name'),
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
                    dataCell: (value) {
                      return DataCell(
                        Text(
                          '$value',
                          style:
                              Theme.of(context).textTheme.titleSmall?.copyWith(
                                    color: getColorByStatus(value),
                                    fontWeight: FontWeight.bold,
                                  ),
                        ),
                      );
                    },
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
                                widget.navigateMenu(31);
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
                                    Api.dealers,
                                    {
                                      'status': state
                                          ? UserStatus.ACTIVE.name
                                          : UserStatus.BLOCKED.name
                                    },
                                    value['id'])
                                .then(
                              (value) {
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
