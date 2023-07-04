import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_web_data_table/web_data_table.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:saur_admin/utils/dummy/dummyusers.dart';
import 'package:saur_admin/utils/theme.dart';
import 'package:saur_admin/widgets/input_field_light.dart';

import '../../widgets/gaps.dart';
import '../../widgets/header.dart';

class StockistScreen extends StatefulWidget {
  const StockistScreen({super.key, required this.navigateMenu});
  final Function(int index) navigateMenu;
  @override
  State<StockistScreen> createState() => _StockistScreenState();
}

class _StockistScreenState extends State<StockistScreen> {
  final TextEditingController search = TextEditingController();
  late String _sortColumnName;
  late bool _sortAscending;
  List<String>? _filterTexts;
  bool _willSearch = true;
  Timer? _timer;
  int? _latestTick;
  final List<String> _selectedRowKeys = [];
  int _rowsPerPage = 10;

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
  }

  @override
  void dispose() {
    super.dispose();
    _timer?.cancel();
    _timer = null;
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(defaultPadding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Header(title: 'Stockist'),
          verticalGap(
            defaultPadding * 2,
          ),
          Theme(
            data: ThemeData(cardColor: Colors.white),
            child: WebDataTable(
              columnSpacing: 25,
              header: const Text('All Stockists'),
              source: WebDataTableSource(
                sortColumnName: _sortColumnName,
                sortAscending: _sortAscending,
                filterTexts: _filterTexts,
                columns: [
                  WebDataColumn(
                    name: 'id',
                    label: const Text('ID'),
                    dataCell: (value) => DataCell(Text('$value')),
                  ),
                  WebDataColumn(
                    name: 'name',
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
                    name: 'phone',
                    label: const Text('Phone'),
                    dataCell: (value) => DataCell(Text('$value')),
                  ),
                  WebDataColumn(
                    name: 'onboardingDate',
                    label: const Text('Onboarded'),
                    dataCell: (value) => DataCell(Text('$value')),
                  ),
                  WebDataColumn(
                    name: 'isActive',
                    label: const Text('Active'),
                    dataCell: (value) => value
                        ? const DataCell(Text('Yes'))
                        : const DataCell(Text('No')),
                  ),
                  WebDataColumn(
                      sortable: false,
                      name: 'view',
                      label: const Text('View'),
                      dataCell: (value) {
                        return DataCell(
                          IconButton(
                              onPressed: () {
                                widget.navigateMenu(41);
                              },
                              icon: const Icon(LineAwesomeIcons.eye)),
                        );
                      }),
                  WebDataColumn(
                    name: 'status',
                    label: const Text('Toggle Status'),
                    sortable: false,
                    dataCell: (value) {
                      return DataCell(Switch(
                        value: dummyUserList.elementAt(value - 1)['isActive'],
                        onChanged: (state) {
                          setState(() {
                            dummyUserList.elementAt(value - 1)['isActive'] =
                                state;
                          });
                        },
                      ));
                    },
                  ),
                ],
                rows: dummyUserList,
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
