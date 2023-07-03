import 'package:flutter/material.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';

import '../../utils/colors.dart';
import '../../utils/responsive.dart';
import '../../utils/theme.dart';
import '../../widgets/gaps.dart';
import '../../widgets/profile_image.dart';

class CustomerDetailHeader extends StatefulWidget {
  const CustomerDetailHeader({
    super.key,
    required this.name,
    required this.email,
    required this.phone,
    required this.isActive,
    required this.isBlocked,
    required this.toggleIsActive,
    required this.toggleIsBlocked,
  });
  final String name;
  final String email;
  final String phone;
  final bool isActive;
  final bool isBlocked;
  final Function(bool) toggleIsActive;
  final Function(bool) toggleIsBlocked;

  @override
  State<CustomerDetailHeader> createState() => _CustomerDetailHeaderState();
}

class _CustomerDetailHeaderState extends State<CustomerDetailHeader> {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          Container(
            width: double.infinity,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  blueGradientDark,
                  blueGradientLight,
                ],
                begin: FractionalOffset.topLeft,
                end: FractionalOffset.bottomRight,
              ),
              borderRadius: BorderRadius.all(
                Radius.circular(4),
              ),
            ),
            child: Responsive(
              mobile: Stack(
                children: [
                  Column(
                    children: [
                      Container(
                        width: double.infinity,
                        height: 100,
                        decoration: const BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              blueGradientDark,
                              blueGradientLight,
                            ],
                            begin: FractionalOffset.topLeft,
                            end: FractionalOffset.bottomRight,
                          ),
                          borderRadius: BorderRadius.all(
                            Radius.circular(4),
                          ),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                horizontalGap(
                                  defaultPadding,
                                ),
                                Text(
                                  'Suspend/Active',
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleSmall
                                      ?.copyWith(
                                        color: Colors.white,
                                      ),
                                ),
                                Switch(
                                    value: widget.isActive,
                                    activeColor: primaryColor,
                                    inactiveTrackColor: hintColor,
                                    onChanged: widget.toggleIsActive)
                              ],
                            ),
                            Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                horizontalGap(
                                  defaultPadding,
                                ),
                                Text(
                                  'Blocked',
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleSmall
                                      ?.copyWith(
                                        color: Colors.white,
                                      ),
                                ),
                                Switch(
                                  value: widget.isBlocked,
                                  activeColor: rejectedColor,
                                  inactiveTrackColor: hintColor,
                                  onChanged: widget.toggleIsBlocked,
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                      Container(
                        width: double.infinity,
                        color: Colors.white,
                        padding: const EdgeInsets.only(left: defaultPadding),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            verticalGap(30),
                            Text(
                              widget.name,
                              style: Theme.of(context)
                                  .textTheme
                                  .headlineMedium
                                  ?.copyWith(
                                    color: primaryColor,
                                  ),
                            ),
                            Row(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                const Icon(
                                  LineAwesomeIcons.envelope,
                                  color: primaryColor,
                                  size: 25,
                                ),
                                horizontalGap(defaultPadding / 2),
                                Text(
                                  widget.email,
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleMedium
                                      ?.copyWith(
                                          color: primaryColor, height: 1.8),
                                ),
                              ],
                            ),
                            Row(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                const Icon(
                                  LineAwesomeIcons.phone,
                                  color: primaryColor,
                                  size: 25,
                                ),
                                horizontalGap(defaultPadding / 2),
                                Text(
                                  widget.phone,
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleMedium
                                      ?.copyWith(
                                          color: primaryColor, height: 1.8),
                                ),
                              ],
                            ),
                            verticalGap(defaultPadding),
                          ],
                        ),
                      )
                    ],
                  ),
                  const Positioned(
                    top: 10,
                    right: defaultPadding,
                    child: Padding(
                      padding: EdgeInsets.all(defaultPadding),
                      child: ProfileImage(),
                    ),
                  ),
                ],
              ),
              desktop: Row(
                children: [
                  const Padding(
                    padding: EdgeInsets.all(defaultPadding),
                    child: ProfileImage(),
                  ),
                  verticalGap(defaultPadding * 2),
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.name,
                        style: Theme.of(context)
                            .textTheme
                            .headlineMedium
                            ?.copyWith(
                              color: Colors.white,
                            ),
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const Icon(
                            LineAwesomeIcons.envelope,
                            color: Colors.white,
                            size: 25,
                          ),
                          horizontalGap(defaultPadding / 2),
                          Text(
                            widget.email,
                            style: Theme.of(context)
                                .textTheme
                                .titleMedium
                                ?.copyWith(color: Colors.white, height: 1.8),
                          ),
                        ],
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const Icon(
                            LineAwesomeIcons.phone,
                            color: Colors.white,
                            size: 25,
                          ),
                          horizontalGap(defaultPadding / 2),
                          Text(
                            widget.phone,
                            style: Theme.of(context)
                                .textTheme
                                .titleMedium
                                ?.copyWith(color: Colors.white, height: 1.8),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const Spacer(),
                  SizedBox(
                    width: 200,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              'Suspend/Active',
                              style: Theme.of(context)
                                  .textTheme
                                  .titleSmall
                                  ?.copyWith(color: Colors.white, height: 1.8),
                            ),
                            const Spacer(),
                            Switch(
                              value: widget.isActive,
                              activeColor: primaryColor,
                              inactiveTrackColor: hintColor,
                              onChanged: widget.toggleIsActive,
                            )
                          ],
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              'Blocked',
                              style: Theme.of(context)
                                  .textTheme
                                  .titleSmall
                                  ?.copyWith(color: Colors.white, height: 1.8),
                            ),
                            const Spacer(),
                            Switch(
                              value: widget.isBlocked,
                              activeColor: rejectedColor,
                              inactiveTrackColor: hintColor,
                              onChanged: widget.toggleIsBlocked,
                            )
                          ],
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
