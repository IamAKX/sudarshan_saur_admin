import 'package:flutter/material.dart';
import 'package:saur_admin/utils/colors.dart';

import '../utils/responsive.dart';

class Header extends StatelessWidget {
  const Header({
    Key? key,
    required this.title,
    this.navigateMenu,
    this.navigateToIndex,
  }) : super(key: key);
  final String title;
  final Function(int index)? navigateMenu;
  final int? navigateToIndex;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        if (!Responsive.isDesktop(context)) ...{
          if (navigateToIndex != null) ...{
            IconButton(
              onPressed: () {
                navigateMenu!(navigateToIndex!);
              },
              icon: const Icon(
                Icons.arrow_back,
                color: primaryColor,
              ),
            ),
          } else ...{
            IconButton(
              onPressed: () {
                if (!Scaffold.of(context).isDrawerOpen) {
                  Scaffold.of(context).openDrawer();
                }
              },
              icon: const Icon(
                Icons.menu,
                color: primaryColor,
              ),
            ),
          },
        },
        Visibility(
          visible: Responsive.isDesktop(context) && navigateToIndex != null,
          child: IconButton(
            onPressed: () {
              navigateMenu!(navigateToIndex!);
            },
            icon: const Icon(
              Icons.arrow_back,
              color: primaryColor,
            ),
          ),
        ),
        Text(
          title,
          style: Theme.of(context)
              .textTheme
              .titleLarge
              ?.copyWith(color: primaryColor),
        ),
        const Spacer(),
        // Expanded(
        //   child: SearchField(),
        // ),
      ],
    );
  }
}
