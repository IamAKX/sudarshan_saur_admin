import 'dart:developer';

import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:saur_admin/services/api_service.dart';
import 'package:saur_admin/utils/colors.dart';
import 'package:saur_admin/widgets/date_time_formatter.dart';
import 'package:saur_admin/widgets/gaps.dart';

import '../../model/question_answer_model.dart';
import '../../model/question_model.dart';
import '../../model/warranty_request_model.dart';
import '../../services/toast_service.dart';
import '../../utils/api.dart';
import '../../utils/constants.dart';
import '../../utils/theme.dart';
import '../../widgets/build_input_text_question.dart';

void updateGuarantyDetail(BuildContext context,
    WarrantyRequestModel? warrantyModel, Function reload) {
  TextEditingController invoiceNo =
      TextEditingController(text: warrantyModel?.invoiceNumber);
  TextEditingController installedOn =
      TextEditingController(text: warrantyModel?.invoiceDate);
  DateTime date =
      DateTimeFormatter.invoiceDateTime(warrantyModel?.invoiceDate ?? '');
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text('Edit Guarantee Detail'),
        content: SizedBox(
          height: 400,
          width: 300,
          child: ListView(
            shrinkWrap: true,
            children: [
              TextField(
                controller: invoiceNo,
                decoration: const InputDecoration(
                  hintText: 'Invoice Number',
                  labelText: 'Invoice Number',
                ),
              ),
              verticalGap(10),
              TextField(
                controller: installedOn,
                readOnly: true,
                onTap: () async {
                  DateTime? selectedDate = await showDatePicker(
                    context: context,
                    initialDate: date,
                    firstDate: DateTime(1980),
                    lastDate: DateTime(2100),
                  );
                  if (selectedDate != null && selectedDate != date) {
                    // User has selected a date
                    date = selectedDate;
                    installedOn.text =
                        DateTimeFormatter.invoiceDateTimeToString(selectedDate);
                  }
                },
                decoration: const InputDecoration(
                  hintText: 'Installed on',
                  labelText: 'Installed on',
                ),
              ),
            ],
          ),
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop(); // Close the alert dialog
            },
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              Navigator.of(context).pop(); // Close the alert dialog
              ApiProvider().updateWarrantyRequest({
                'invoiceNumber': invoiceNo.text,
                'invoiceDate': installedOn.text,
              }, warrantyModel?.requestId?.toString() ?? '').then((value) {
                if (value) {
                  ToastService.instance.showSuccess('Guarantee detail updated');
                  reload();
                }
              });
            },
            child: const Text('Update'),
          ),
        ],
      );
    },
  );
}

void updateIntallationAddress(BuildContext context,
    WarrantyRequestModel? warrantyModel, Function() reloadScreen) {
  TextEditingController name =
      TextEditingController(text: warrantyModel?.customers?.customerName);
  TextEditingController mobileNumber1 =
      TextEditingController(text: warrantyModel?.warrantyDetails?.model);
  TextEditingController mobileNumber2 =
      TextEditingController(text: warrantyModel?.mobile2);

  final TextEditingController _installationhouseNumberCtrl =
      TextEditingController(text: warrantyModel?.installationAddress?.houseNo);
  final TextEditingController _installationcolonyCtrl =
      TextEditingController(text: warrantyModel?.installationAddress?.area);
  final TextEditingController _installationstreet1Ctrl =
      TextEditingController(text: warrantyModel?.installationAddress?.street1);
  final TextEditingController _installationstreet2Ctrl =
      TextEditingController(text: warrantyModel?.installationAddress?.street2);
  final TextEditingController _installationlandmarkCtrl =
      TextEditingController(text: warrantyModel?.installationAddress?.landmark);
  final TextEditingController _installationtalukaCtrl =
      TextEditingController(text: warrantyModel?.installationAddress?.taluk);
  final TextEditingController _installationplaceCtrl =
      TextEditingController(text: warrantyModel?.installationAddress?.town);
  final TextEditingController _installationzipCodeCtrl =
      TextEditingController(text: warrantyModel?.installationAddress?.zipCode);

  final TextEditingController _ownerhouseNumberCtrl =
      TextEditingController(text: warrantyModel?.ownerAddress?.houseNo);
  final TextEditingController _ownercolonyCtrl =
      TextEditingController(text: warrantyModel?.ownerAddress?.area);
  final TextEditingController _ownerstreet1Ctrl =
      TextEditingController(text: warrantyModel?.ownerAddress?.street1);
  final TextEditingController _ownerstreet2Ctrl =
      TextEditingController(text: warrantyModel?.ownerAddress?.street2);
  final TextEditingController _ownerlandmarkCtrl =
      TextEditingController(text: warrantyModel?.ownerAddress?.landmark);
  final TextEditingController _ownertalukaCtrl =
      TextEditingController(text: warrantyModel?.ownerAddress?.taluk);
  final TextEditingController _ownerplaceCtrl =
      TextEditingController(text: warrantyModel?.ownerAddress?.town);
  final TextEditingController _ownerzipCodeCtrl =
      TextEditingController(text: warrantyModel?.ownerAddress?.zipCode);

  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text('Edit Guarantee Detail'),
        content: SizedBox(
          height: 700,
          width: 400,
          child: ListView(
            shrinkWrap: true,
            children: [
              const Text('Customer Details'),
              TextField(
                controller: name,
                decoration: const InputDecoration(
                  hintText: 'Customer Name',
                  labelText: 'Customer Name',
                ),
              ),
              verticalGap(10),
              TextField(
                controller: mobileNumber1,
                keyboardType: TextInputType.phone,
                decoration: const InputDecoration(
                  hintText: 'Mobile 1',
                  labelText: 'Mobile 1',
                ),
              ),
              verticalGap(10),
              TextField(
                controller: mobileNumber2,
                keyboardType: TextInputType.phone,
                decoration: const InputDecoration(
                  hintText: 'Mobile 2',
                  labelText: 'Mobile 2',
                ),
              ),
              verticalGap(5),
              Divider(
                color: dividerColor,
              ),
              verticalGap(5),
              const Text(
                'Installation Address',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              TextField(
                controller: _installationhouseNumberCtrl,
                decoration: const InputDecoration(
                  hintText: 'House Number',
                  labelText: 'House Number',
                ),
              ),
              verticalGap(10),
              TextField(
                controller: _installationcolonyCtrl,
                decoration: const InputDecoration(
                  hintText: 'Colony',
                  labelText: 'Colony',
                ),
              ),
              verticalGap(10),
              TextField(
                controller: _installationstreet1Ctrl,
                decoration: const InputDecoration(
                  hintText: 'Street 1',
                  labelText: 'Street 1',
                ),
              ),
              verticalGap(10),
              TextField(
                controller: _installationstreet2Ctrl,
                decoration: const InputDecoration(
                  hintText: 'Street 2',
                  labelText: 'Street 2',
                ),
              ),
              verticalGap(10),
              TextField(
                controller: _installationlandmarkCtrl,
                decoration: const InputDecoration(
                  hintText: 'Landmark',
                  labelText: 'Landmark',
                ),
              ),
              verticalGap(10),
              TextField(
                controller: _installationtalukaCtrl,
                decoration: const InputDecoration(
                  hintText: 'Taluka',
                  labelText: 'Taluka',
                ),
              ),
              verticalGap(10),
              TextField(
                controller: _installationplaceCtrl,
                decoration: const InputDecoration(
                  hintText: 'Place',
                  labelText: 'Place',
                ),
              ),
              verticalGap(10),
              TextField(
                controller: _installationzipCodeCtrl,
                decoration: const InputDecoration(
                  hintText: 'Zip Code',
                  labelText: 'Zip Code',
                ),
              ),
              verticalGap(5),
              Divider(
                color: dividerColor,
              ),
              verticalGap(5),
              const Text(
                'Owner Address',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              TextField(
                controller: _ownerhouseNumberCtrl,
                decoration: const InputDecoration(
                  hintText: 'House Number',
                  labelText: 'House Number',
                ),
              ),
              verticalGap(10),
              TextField(
                controller: _ownercolonyCtrl,
                decoration: const InputDecoration(
                  hintText: 'Colony',
                  labelText: 'Colony',
                ),
              ),
              verticalGap(10),
              TextField(
                controller: _ownerstreet1Ctrl,
                decoration: const InputDecoration(
                  hintText: 'Street 1',
                  labelText: 'Street 1',
                ),
              ),
              verticalGap(10),
              TextField(
                controller: _ownerstreet2Ctrl,
                decoration: const InputDecoration(
                  hintText: 'Street 2',
                  labelText: 'Street 2',
                ),
              ),
              verticalGap(10),
              TextField(
                controller: _ownerlandmarkCtrl,
                decoration: const InputDecoration(
                  hintText: 'Landmark',
                  labelText: 'Landmark',
                ),
              ),
              verticalGap(10),
              TextField(
                controller: _ownertalukaCtrl,
                decoration: const InputDecoration(
                  hintText: 'Taluka',
                  labelText: 'Taluka',
                ),
              ),
              verticalGap(10),
              TextField(
                controller: _ownerplaceCtrl,
                decoration: const InputDecoration(
                  hintText: 'Place',
                  labelText: 'Place',
                ),
              ),
              verticalGap(10),
              TextField(
                controller: _ownerzipCodeCtrl,
                decoration: const InputDecoration(
                  hintText: 'Zip Code',
                  labelText: 'Zip Code',
                ),
              ),
            ],
          ),
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop(); // Close the alert dialog
            },
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () async {
              Navigator.of(context).pop(); // Close the alert dialog
              await ApiProvider().updateUser(
                  Api.customer,
                  {
                    'customerName': name.text.trim(),
                    'mobileNo': mobileNumber1.text.trim(),
                  },
                  warrantyModel?.customers?.customerId ?? -1);
              await ApiProvider().updateWarrantyRequest({
                'mobile2': mobileNumber2.text.trim(),
                'installationAddress': {
                  'houseNo': _installationhouseNumberCtrl.text.trim(),
                  'area': _installationcolonyCtrl.text.trim(),
                  'street1': _installationstreet1Ctrl.text.trim(),
                  'street2': _installationstreet2Ctrl.text.trim(),
                  'landmark': _installationlandmarkCtrl.text.trim(),
                  'taluk': _installationtalukaCtrl.text.trim(),
                  'town': _installationplaceCtrl.text.trim(),
                  'zipCode': _installationzipCodeCtrl.text.trim(),
                  'state': warrantyModel?.installationAddress?.state,
                  'country': warrantyModel?.installationAddress?.country,
                  'district': warrantyModel?.installationAddress?.district,
                },
                'ownerAddress': {
                  'houseNo': _ownerhouseNumberCtrl.text.trim(),
                  'area': _ownercolonyCtrl.text.trim(),
                  'street1': _ownerstreet1Ctrl.text.trim(),
                  'street2': _ownerstreet2Ctrl.text.trim(),
                  'landmark': _ownerlandmarkCtrl.text.trim(),
                  'taluk': _ownertalukaCtrl.text.trim(),
                  'town': _ownerplaceCtrl.text.trim(),
                  'zipCode': _ownerzipCodeCtrl.text.trim(),
                  'state': warrantyModel?.ownerAddress?.state,
                  'country': warrantyModel?.ownerAddress?.country,
                  'district': warrantyModel?.ownerAddress?.district,
                },
              }, warrantyModel?.requestId?.toString() ?? '').then((value) {
                if (value) {
                  ToastService.instance.showSuccess('Customer detail updated');
                  reloadScreen();
                }
              });
            },
            child: const Text('Update'),
          ),
        ],
      );
    },
  );
}

void updateDealerTechPlumber(BuildContext context,
    WarrantyRequestModel? warrantyModel, Function() reloadScreen) {
  final TextEditingController dealerNameCtrl =
      TextEditingController(text: warrantyModel?.dealerInfo?.name);
  final TextEditingController dealerPlaceCtrl =
      TextEditingController(text: warrantyModel?.dealerInfo?.place);
  final TextEditingController dealerMobileCtrl =
      TextEditingController(text: warrantyModel?.dealerInfo?.mobile);

  final TextEditingController plumberNameCtrl =
      TextEditingController(text: warrantyModel?.plumberInfo?.name);
  final TextEditingController plumberPlaceCtrl =
      TextEditingController(text: warrantyModel?.plumberInfo?.place);
  final TextEditingController plumberMobileCtrl =
      TextEditingController(text: warrantyModel?.plumberInfo?.mobile);

  final TextEditingController technicianNameCtrl =
      TextEditingController(text: warrantyModel?.technicianInfo?.name);
  final TextEditingController technicianPlaceCtrl =
      TextEditingController(text: warrantyModel?.technicianInfo?.place);
  final TextEditingController technicianMobileCtrl =
      TextEditingController(text: warrantyModel?.technicianInfo?.mobile);

  showDialog(
    context: context,
    builder: (BuildContext context) {
      return StatefulBuilder(
        builder: (context, setState) => AlertDialog(
          title: const Text('Edit'),
          content: SizedBox(
            height: 700,
            width: 400,
            child: ListView(
              shrinkWrap: true,
              children: [
                const Text('Dealer Details'),
                TextField(
                  controller: dealerNameCtrl,
                  decoration: const InputDecoration(
                    hintText: 'Dealer Name',
                    labelText: 'Dealer Name',
                  ),
                ),
                verticalGap(10),
                TextField(
                  controller: dealerPlaceCtrl,
                  keyboardType: TextInputType.phone,
                  decoration: const InputDecoration(
                    hintText: 'Dealer Place',
                    labelText: 'Dealer Place',
                  ),
                ),
                verticalGap(10),
                TextField(
                  controller: dealerMobileCtrl,
                  keyboardType: TextInputType.phone,
                  decoration: const InputDecoration(
                    hintText: 'Dealer Mobile Number',
                    labelText: 'Dealer Mobile Number',
                  ),
                ),
                verticalGap(5),
                Divider(
                  color: dividerColor,
                ),
                verticalGap(5),
                const Text(
                  'Plumber',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                TextField(
                  controller: plumberNameCtrl,
                  decoration: const InputDecoration(
                    hintText: 'Plumber Name',
                    labelText: 'Plumber Name',
                  ),
                ),
                verticalGap(10),
                TextField(
                  controller: plumberPlaceCtrl,
                  decoration: const InputDecoration(
                    hintText: 'Plumber Place',
                    labelText: 'Plumber Place',
                  ),
                ),
                verticalGap(10),
                TextField(
                  controller: plumberMobileCtrl,
                  decoration: const InputDecoration(
                    hintText: 'Plumber Mobile Number',
                    labelText: 'Plumber Mobile Number',
                  ),
                ),
                verticalGap(5),
                Divider(
                  color: dividerColor,
                ),
                verticalGap(5),
                const Text(
                  'Technician',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                TextField(
                  controller: technicianNameCtrl,
                  decoration: const InputDecoration(
                    hintText: 'Technician Name',
                    labelText: 'Technician Name',
                  ),
                ),
                verticalGap(10),
                TextField(
                  controller: technicianPlaceCtrl,
                  decoration: const InputDecoration(
                    hintText: 'Technician Place',
                    labelText: 'Technician Place',
                  ),
                ),
                verticalGap(10),
                TextField(
                  controller: technicianMobileCtrl,
                  decoration: const InputDecoration(
                    hintText: 'Technician Mobile Number',
                    labelText: 'Technician Mobile Number',
                  ),
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the alert dialog
              },
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () async {
                Navigator.of(context).pop(); // Close the alert dialog

                await ApiProvider().updateWarrantyRequest({
                  'dealerInfo': {
                    'name': dealerNameCtrl.text,
                    'mobile': dealerMobileCtrl.text,
                    'place': dealerPlaceCtrl.text,
                  },
                  'technicianInfo': {
                    'name': technicianNameCtrl.text,
                    'mobile': technicianMobileCtrl.text,
                    'place': technicianPlaceCtrl.text,
                  },
                  'plumberInfo': {
                    'name': plumberNameCtrl.text,
                    'mobile': plumberMobileCtrl.text,
                    'place': plumberPlaceCtrl.text,
                  },
                }, warrantyModel?.requestId?.toString() ?? '').then((value) {
                  if (value) {
                    ToastService.instance.showSuccess('Details updated');
                    reloadScreen();
                  }
                });
              },
              child: const Text('Update'),
            ),
          ],
        ),
      );
    },
  );
}

void updateOtherInfo(BuildContext context,
    WarrantyRequestModel? warrantyRequestModel, Function() reloadScreen) {
  String? answer1; // = Constants.option1.first;
  String? answer2; // = Constants.option2.first;
  String? answer3; // = Constants.option3.first;
  final TextEditingController answer4 = TextEditingController();
  String? answer5; //= Constants.option4.first;
  final TextEditingController answer6 = TextEditingController();
  String? answer7; //= Constants.option5.first;
  String? answer8; // = Constants.option1.first;
  final TextEditingController answer9 = TextEditingController();
  String? answer10; // = Constants.option1.first;
  String? answer11; // = Constants.option7.first;
  String? answer12; // = Constants.option8.first;
  String? answer13; // = Constants.option8.first;

  answer1 = warrantyRequestModel?.answers?.elementAt(0).answerText;
  answer2 = warrantyRequestModel?.answers?.elementAt(1).answerText;
  answer3 = warrantyRequestModel?.answers?.elementAt(2).answerText;
  answer4.text = warrantyRequestModel?.answers?.elementAt(3).answerText ?? '';
  answer5 = warrantyRequestModel?.answers?.elementAt(4).answerText;
  answer6.text = warrantyRequestModel?.answers?.elementAt(5).answerText ?? '';
  answer7 = warrantyRequestModel?.answers?.elementAt(6).answerText;
  answer8 = warrantyRequestModel?.answers?.elementAt(7).answerText;
  answer9.text = warrantyRequestModel?.answers?.elementAt(8).answerText ?? '';
  answer10 = warrantyRequestModel?.answers?.elementAt(9).answerText;
  answer11 = warrantyRequestModel?.answers?.elementAt(10).answerText;
  answer12 = warrantyRequestModel?.answers?.elementAt(11).answerText;
  answer13 = warrantyRequestModel?.answers?.elementAt(12).answerText;

  showDialog(
    context: context,
    builder: (BuildContext context) {
      return StatefulBuilder(
        builder: (context, setState) => AlertDialog(
          title: const Text('Edit Guarantee Detail'),
          content: SizedBox(
            height: MediaQuery.of(context).size.height * .8,
            width: MediaQuery.of(context).size.width * .8,
            child: ListView(
              shrinkWrap: true,
              children: [
                Row(
                  children: [
                    Expanded(
                      flex: 5,
                      child: Text(
                        'System installed at south facing',
                        style: Theme.of(context)
                            .textTheme
                            .titleMedium
                            ?.copyWith(fontWeight: FontWeight.bold),
                      ),
                    ),
                    horizontalGap(defaultPadding),
                    Expanded(
                      flex: 3,
                      child: DropdownButtonHideUnderline(
                        child: DropdownButton2<String>(
                          value: answer1,
                          hint: Text(
                            'Select ',
                            style: TextStyle(
                              fontSize: 14,
                              color: Theme.of(context).hintColor,
                            ),
                          ),
                          underline: null,
                          isExpanded: true,
                          items: Constants.option1
                              .map((val) => DropdownMenuItem<String>(
                                    value: val,
                                    child: Text(val),
                                  ))
                              .toList(),
                          onChanged: (value) {
                            setState(() {
                              answer1 = value!;
                            });
                          },
                        ),
                      ),
                    ),
                  ],
                ),
                Card(
                  color: Colors.white,
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: defaultPadding, vertical: defaultPadding),
                    child: Row(
                      children: [
                        Expanded(
                          flex: 5,
                          child: Text(
                            'Hot water application',
                            style: Theme.of(context)
                                .textTheme
                                .titleMedium
                                ?.copyWith(fontWeight: FontWeight.bold),
                          ),
                        ),
                        horizontalGap(defaultPadding),
                        Expanded(
                          flex: 3,
                          child: DropdownButtonHideUnderline(
                            child: DropdownButton2<String>(
                              value: answer2,
                              hint: Text(
                                'Select ',
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Theme.of(context).hintColor,
                                ),
                              ),
                              underline: null,
                              isExpanded: true,
                              items: Constants.option2
                                  .map((val) => DropdownMenuItem<String>(
                                        value: val,
                                        child: Text(val),
                                      ))
                                  .toList(),
                              onChanged: (value) {
                                setState(() {
                                  answer2 = value!;
                                });
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Card(
                  color: Colors.white,
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: defaultPadding, vertical: defaultPadding),
                    child: Row(
                      children: [
                        Expanded(
                          flex: 5,
                          child: Text(
                            'Water source',
                            style: Theme.of(context)
                                .textTheme
                                .titleMedium
                                ?.copyWith(fontWeight: FontWeight.bold),
                          ),
                        ),
                        horizontalGap(defaultPadding),
                        Expanded(
                          flex: 3,
                          child: DropdownButtonHideUnderline(
                            child: DropdownButton2<String>(
                              value: answer3,
                              hint: Text(
                                'Select ',
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Theme.of(context).hintColor,
                                ),
                              ),
                              underline: null,
                              isExpanded: true,
                              items: Constants.option3
                                  ?.map((val) => DropdownMenuItem<String>(
                                        value: val,
                                        child: Text(val),
                                      ))
                                  .toList(),
                              onChanged: (value) {
                                setState(() {
                                  answer3 = value!;
                                });
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                BuildInputTextQuestion(
                  question: 'No of persons to hot water use',
                  answer: answer4,
                ),
                Card(
                  color: Colors.white,
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: defaultPadding, vertical: defaultPadding),
                    child: Row(
                      children: [
                        Expanded(
                          flex: 5,
                          child: Text(
                            'Hot water using mode',
                            style: Theme.of(context)
                                .textTheme
                                .titleMedium
                                ?.copyWith(fontWeight: FontWeight.bold),
                          ),
                        ),
                        horizontalGap(defaultPadding),
                        Expanded(
                          flex: 3,
                          child: DropdownButtonHideUnderline(
                            child: DropdownButton2<String>(
                              value: answer5,
                              hint: Text(
                                'Select ',
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Theme.of(context).hintColor,
                                ),
                              ),
                              underline: null,
                              isExpanded: true,
                              items: Constants.option4
                                  ?.map((val) => DropdownMenuItem<String>(
                                        value: val,
                                        child: Text(val),
                                      ))
                                  .toList(),
                              onChanged: (value) {
                                setState(() {
                                  answer5 = value!;
                                });
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                BuildInputTextQuestion(
                  question: 'No of hot water using points (Bathrooms)',
                  answer: answer6,
                ),
                Card(
                  color: Colors.white,
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: defaultPadding, vertical: defaultPadding),
                    child: Row(
                      children: [
                        Expanded(
                          flex: 5,
                          child: Text(
                            'Hot water using time',
                            style: Theme.of(context)
                                .textTheme
                                .titleMedium
                                ?.copyWith(fontWeight: FontWeight.bold),
                          ),
                        ),
                        horizontalGap(defaultPadding),
                        Expanded(
                          flex: 3,
                          child: DropdownButtonHideUnderline(
                            child: DropdownButton2<String>(
                              value: answer7,
                              hint: Text(
                                'Select ',
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Theme.of(context).hintColor,
                                ),
                              ),
                              underline: null,
                              isExpanded: true,
                              items: Constants.option5
                                  ?.map((val) => DropdownMenuItem<String>(
                                        value: val,
                                        child: Text(val),
                                      ))
                                  .toList(),
                              onChanged: (value) {
                                setState(() {
                                  answer7 = value!;
                                });
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Card(
                  color: Colors.white,
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: defaultPadding, vertical: defaultPadding),
                    child: Row(
                      children: [
                        Expanded(
                          flex: 5,
                          child: Text(
                            'Plumbing completed as per company guidelines',
                            style: Theme.of(context)
                                .textTheme
                                .titleMedium
                                ?.copyWith(fontWeight: FontWeight.bold),
                          ),
                        ),
                        horizontalGap(defaultPadding),
                        Expanded(
                          flex: 3,
                          child: DropdownButtonHideUnderline(
                            child: DropdownButton2<String>(
                              value: answer8,
                              hint: Text(
                                'Select ',
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Theme.of(context).hintColor,
                                ),
                              ),
                              underline: null,
                              isExpanded: true,
                              items: Constants.option1
                                  ?.map((val) => DropdownMenuItem<String>(
                                        value: val,
                                        child: Text(val),
                                      ))
                                  .toList(),
                              onChanged: (value) {
                                setState(() {
                                  answer8 = value!;
                                });
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                BuildInputTextQuestion(
                  question: 'Length of hot water pipeline',
                  answer: answer9,
                ),
                Card(
                  color: Colors.white,
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: defaultPadding, vertical: defaultPadding),
                    child: Row(
                      children: [
                        Expanded(
                          flex: 5,
                          child: Text(
                            'System installed at shadow free area/place',
                            style: Theme.of(context)
                                .textTheme
                                .titleMedium
                                ?.copyWith(fontWeight: FontWeight.bold),
                          ),
                        ),
                        horizontalGap(defaultPadding),
                        Expanded(
                          flex: 3,
                          child: DropdownButtonHideUnderline(
                            child: DropdownButton2<String>(
                              value: answer10,
                              hint: Text(
                                'Select ',
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Theme.of(context).hintColor,
                                ),
                              ),
                              underline: null,
                              isExpanded: true,
                              items: Constants.option1
                                  ?.map((val) => DropdownMenuItem<String>(
                                        value: val,
                                        child: Text(val),
                                      ))
                                  .toList(),
                              onChanged: (value) {
                                setState(() {
                                  answer10 = value!;
                                });
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Card(
                  color: Colors.white,
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: defaultPadding, vertical: defaultPadding),
                    child: Row(
                      children: [
                        Expanded(
                          flex: 5,
                          child: Text(
                            'System amount paid fully or partly',
                            style: Theme.of(context)
                                .textTheme
                                .titleMedium
                                ?.copyWith(fontWeight: FontWeight.bold),
                          ),
                        ),
                        horizontalGap(defaultPadding),
                        Expanded(
                          flex: 3,
                          child: DropdownButtonHideUnderline(
                            child: DropdownButton2<String>(
                              value: answer11,
                              hint: Text(
                                'Select ',
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Theme.of(context).hintColor,
                                ),
                              ),
                              underline: null,
                              isExpanded: true,
                              items: Constants.option7
                                  ?.map((val) => DropdownMenuItem<String>(
                                        value: val,
                                        child: Text(val),
                                      ))
                                  .toList(),
                              onChanged: (value) {
                                setState(() {
                                  answer11 = value!;
                                });
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Card(
                  color: Colors.white,
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: defaultPadding, vertical: defaultPadding),
                    child: Row(
                      children: [
                        Expanded(
                          flex: 5,
                          child: Text(
                            'Dealer/Technician give all using tips and instructions',
                            style: Theme.of(context)
                                .textTheme
                                .titleMedium
                                ?.copyWith(fontWeight: FontWeight.bold),
                          ),
                        ),
                        horizontalGap(defaultPadding),
                        Expanded(
                          flex: 3,
                          child: DropdownButtonHideUnderline(
                            child: DropdownButton2<String>(
                              value: answer12,
                              hint: Text(
                                'Select ',
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Theme.of(context).hintColor,
                                ),
                              ),
                              underline: null,
                              isExpanded: true,
                              items: Constants.option8
                                  ?.map((val) => DropdownMenuItem<String>(
                                        value: val,
                                        child: Text(val),
                                      ))
                                  .toList(),
                              onChanged: (value) {
                                setState(() {
                                  answer12 = value!;
                                });
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Card(
                  color: Colors.white,
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: defaultPadding, vertical: defaultPadding),
                    child: Row(
                      children: [
                        Expanded(
                          flex: 5,
                          child: Text(
                            'Are you satisfied our representative response / work',
                            style: Theme.of(context)
                                .textTheme
                                .titleMedium
                                ?.copyWith(fontWeight: FontWeight.bold),
                          ),
                        ),
                        horizontalGap(defaultPadding),
                        Expanded(
                          flex: 3,
                          child: DropdownButtonHideUnderline(
                            child: DropdownButton2<String>(
                              value: answer13,
                              hint: Text(
                                'Select ',
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Theme.of(context).hintColor,
                                ),
                              ),
                              underline: null,
                              isExpanded: true,
                              items: Constants.option8
                                  ?.map((val) => DropdownMenuItem<String>(
                                        value: val,
                                        child: Text(val),
                                      ))
                                  .toList(),
                              onChanged: (value) {
                                setState(() {
                                  answer13 = value!;
                                });
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the alert dialog
              },
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the alert dialog
                List<QuestionAnswerModel> buildQnAList = [
                  QuestionAnswerModel(
                      answerText: answer1,
                      questions: QuestionModel(questionId: 1)),
                  QuestionAnswerModel(
                      answerText: answer2,
                      questions: QuestionModel(questionId: 2)),
                  QuestionAnswerModel(
                      answerText: answer3,
                      questions: QuestionModel(questionId: 3)),
                  QuestionAnswerModel(
                      answerText: answer4.text,
                      questions: QuestionModel(questionId: 4)),
                  QuestionAnswerModel(
                      answerText: answer5,
                      questions: QuestionModel(questionId: 5)),
                  QuestionAnswerModel(
                      answerText: answer6.text,
                      questions: QuestionModel(questionId: 6)),
                  QuestionAnswerModel(
                      answerText: answer7,
                      questions: QuestionModel(questionId: 7)),
                  QuestionAnswerModel(
                      answerText: answer8,
                      questions: QuestionModel(questionId: 8)),
                  QuestionAnswerModel(
                      answerText: answer9.text,
                      questions: QuestionModel(questionId: 9)),
                  QuestionAnswerModel(
                      answerText: answer10,
                      questions: QuestionModel(questionId: 10)),
                  QuestionAnswerModel(
                      answerText: answer11,
                      questions: QuestionModel(questionId: 11)),
                  QuestionAnswerModel(
                      answerText: answer12,
                      questions: QuestionModel(questionId: 12)),
                  QuestionAnswerModel(
                      answerText: answer13,
                      questions: QuestionModel(questionId: 13)),
                ];
                debugPrint({
                  'answers': buildQnAList?.map((x) => x?.toMap())?.toList(),
                }.toString());

                ApiProvider().updateWarrantyRequest({
                  'answers': buildQnAList?.map((x) => x?.toMap())?.toList(),
                }, warrantyRequestModel?.requestId?.toString() ?? '').then(
                    (value) {
                  if (value) {
                    ToastService.instance.showSuccess('Other detail updated');
                    reloadScreen();
                  }
                });
              },
              child: const Text('Update'),
            ),
          ],
        ),
      );
    },
  );
}
