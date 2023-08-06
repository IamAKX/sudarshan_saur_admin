import 'dart:math';

import 'package:flutter/material.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:otp_text_field/otp_field_style.dart';
import 'package:otp_text_field/style.dart';
import 'package:provider/provider.dart';
import 'package:saur_admin/screen/home_container/home_container.dart';
import 'package:saur_admin/services/toast_service.dart';
import 'package:saur_admin/utils/theme.dart';
import 'package:saur_admin/widgets/gaps.dart';
import 'package:saur_admin/widgets/input_field_light.dart';
import 'package:saur_admin/widgets/primary_button_dark.dart';

import '../../services/api_service.dart';
import '../../utils/colors.dart';
import '../../utils/responsive.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});
  static const String routePath = '/login';

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late ApiProvider _api;
  final TextEditingController _phoneCtrl = TextEditingController();
  final TextEditingController _otpCtrl = TextEditingController();
  String code = '';
  @override
  Widget build(BuildContext context) {
    _api = Provider.of<ApiProvider>(context);
    return Scaffold(
      body: getBody(context),
    );
  }

  getBody(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [
            blueGradientDark,
            blueGradientLight,
          ],
          begin: FractionalOffset.topLeft,
          end: FractionalOffset.bottomRight,
        ),
      ),
      child: Stack(
        children: [
          Center(
            child: Card(
              color: const Color.fromRGBO(255, 255, 255, 1),
              elevation: defaultPadding * 2,
              child: SizedBox(
                width: Responsive.isDesktop(context)
                    ? MediaQuery.of(context).size.width * 0.25
                    : MediaQuery.of(context).size.width * 0.8,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(defaultPadding / 2),
                      child: ListTile(
                        leading: const Icon(
                          LineAwesomeIcons.user_shield,
                          color: primaryColor,
                        ),
                        title: Text(
                          'Admin Authentication',
                          style: Theme.of(context)
                              .textTheme
                              .headlineSmall
                              ?.copyWith(fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    const Divider(
                      color: primaryColor,
                      height: 1,
                    ),
                    verticalGap(defaultPadding),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: defaultPadding * 2),
                      child: InputFieldLight(
                        hint: 'Phone Number',
                        controller: _phoneCtrl,
                        keyboardType: TextInputType.phone,
                        obscure: false,
                        icon: LineAwesomeIcons.phone,
                      ),
                    ),
                    verticalGap(defaultPadding / 2),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: defaultPadding * 2),
                      child: Align(
                        alignment: Alignment.centerRight,
                        child: TextButton(
                          child: const Text('Send OTP'),
                          onPressed: () async {
                            _api.checkAdminPhone(_phoneCtrl.text).then((value) {
                              if (value) {
                                code =
                                    (Random().nextInt(9000) + 1000).toString();
                                _api.sendOtp(_phoneCtrl.text, code);
                              }
                            });
                          },
                        ),
                      ),
                    ),
                    verticalGap(defaultPadding),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: defaultPadding * 2),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Enter the OTP',
                          style: Theme.of(context)
                              .textTheme
                              .bodyLarge
                              ?.copyWith(color: hintColor),
                        ),
                      ),
                    ),
                    OTPTextField(
                      length: 4,
                      width: Responsive.isDesktop(context)
                          ? MediaQuery.of(context).size.width * 0.25 -
                              (defaultPadding * 3)
                          : MediaQuery.of(context).size.width * 0.8 -
                              (defaultPadding * 3),
                      fieldWidth: 40,
                      style: Theme.of(context).textTheme.titleLarge!.copyWith(
                            color: textColorDark,
                          ),
                      otpFieldStyle: OtpFieldStyle(
                        enabledBorderColor: dividerColor,
                        borderColor: dividerColor,
                        focusBorderColor: hintColor.withOpacity(0.1),
                      ),
                      textFieldAlignment: MainAxisAlignment.spaceAround,
                      fieldStyle: FieldStyle.underline,
                      onCompleted: (pin) {
                        _otpCtrl.text = pin;
                      },
                    ),
                    verticalGap(defaultPadding * 2),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: defaultPadding * 2),
                      child: PrimaryButtonDark(
                          onPressed: () {
                            if (code != '' && _otpCtrl.text == code) {
                              Navigator.pushNamedAndRemoveUntil(context,
                                  HomeContainer.routePath, (route) => false);
                            } else {
                              ToastService.instance.showError('Invalid OTP');
                            }
                          },
                          label: 'Login',
                          isDisabled: false,
                          isLoading: false),
                    ),
                    verticalGap(defaultPadding),
                  ],
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: defaultPadding),
              child: Image.asset(
                'assets/logo/logo.png',
                width: 200,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
