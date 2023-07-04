import 'package:flutter/material.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:saur_admin/utils/colors.dart';
import 'package:saur_admin/utils/dummy/dummy_data.dart';

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
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(defaultPadding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Header(title: 'Reports'),
          verticalGap(
            defaultPadding * 2,
          ),
          Expanded(
            child: Card(
              color: Colors.white,
              child: ListView.separated(
                  shrinkWrap: true,
                  itemBuilder: (context, index) => ListTile(
                        title: Text(
                          reportMenu.elementAt(index),
                        ),
                        trailing: IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            LineAwesomeIcons.file_download,
                          ),
                        ),
                        onTap: () {},
                      ),
                  separatorBuilder: (context, index) => const Divider(
                        color: dividerColor,
                      ),
                  itemCount: reportMenu.length),
            ),
          )
        ],
      ),
    );
  }
}
