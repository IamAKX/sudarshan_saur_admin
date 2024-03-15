import 'package:csv/csv.dart';
import 'package:saur_admin/model/customer_model.dart';
import 'package:saur_admin/model/dealer_model.dart';
import 'package:saur_admin/model/list/list_customer_model.dart';
import 'package:saur_admin/model/list/list_dealer_model.dart';
import 'package:saur_admin/model/list/list_sdw_model.dart';
import 'package:saur_admin/model/list/list_stockist_model.dart';
import 'package:saur_admin/model/sdw_model.dart';
import 'package:saur_admin/model/stockist_model.dart';
import 'package:saur_admin/model/warranty_model.dart';
import 'package:saur_admin/model/warranty_request_model.dart';
import 'package:saur_admin/utils/helper_methods.dart';
import 'package:saur_admin/widgets/date_time_formatter.dart';

import '../../model/list/list_warranty_model.dart';

String getCDMReport(ListWarrantyModel? list) {
  List<List<dynamic>> csvList = [];
  csvList.add([
    'CDM Number',
    'Customer\'s Name',
    'Customer\'s Address',
    'Customer\'s Phone No. 1',
    'District',
    'Dealer',
    'Place',
    'State or Union Territory',
    'Capacity (LPD)',
    'Model',
    'Dealer Invoice Number',
    'Dealer Invoice Date',
    'SSSPL Invoice Number',
    'SSSPL Invoice Date',
    'Total Qty',
    'Installation date',
    'System Serial Number',
    'Category',
    'District',
    'Taluka',
    'Pin code',
    'Customer\'s Phone No. 2',
    'Dealer mobile',
    'Google Location'
  ]);

  for (WarrantyRequestModel req in list?.data ?? []) {
    List row = [];
    row.add('');
    row.add(req.customers?.customerName);
    row.add(prepareAddress(req.installationAddress));
    row.add(req.customers?.mobileNo);
    row.add(req.installationAddress?.district);
    row.add(req.warrantyDetails?.crmStockistName);
    row.add(req.warrantyDetails?.crmStockistDistrict);
    row.add(req.installationAddress?.state);
    row.add(req.warrantyDetails?.lpd);
    row.add(req.warrantyDetails?.model);
    row.add(req.invoiceNumber);
    row.add(req.installationDate ?? '');
    row.add(req.warrantyDetails?.invoiceNo);
    row.add(req.installationDate ?? '');
    row.add('1');
    row.add(req.installationDate ?? '');
    row.add(req.warrantyDetails?.warrantySerialNo);
    row.add('');
    row.add(req.installationAddress?.district);
    row.add(req.installationAddress?.taluk);
    row.add(req.installationAddress?.zipCode);
    row.add(req.mobile2);
    row.add(req.dealerInfo?.mobile);
    row.add('https://maps.google.com?q=${req?.lat},${req?.lon}');
    csvList.add(row);
  }

  return ListToCsvConverter().convert(csvList);
}

String getCustomerReport(
    ListWarrantyModel? warrantyReq, ListCustomerModel? customerReq) {
  List<List<dynamic>> csvList = [];
  csvList.add([
    'Sr. No',
    'Name',
    'Mobile Number',
    'System Serial No.',
    'Create Date',
  ]);
  Map<int?, String?> custIdSl = {};
  for (WarrantyRequestModel req in warrantyReq?.data ?? []) {
    custIdSl[req.customers?.customerId] = req.warrantyDetails?.warrantySerialNo;
  }
  int count = 0;
  for (CustomerModel customer in customerReq?.data ?? []) {
    count++;
    List row = [];
    row.add(count);
    row.add(customer.customerName);
    row.add(customer.mobileNo);
    row.add(custIdSl[customer.customerId] ?? '');
    row.add(DateTimeFormatter.onlyDateShort(customer.createdOn ?? ''));
    csvList.add(row);
  }

  return ListToCsvConverter().convert(csvList);
}

String getStockistReport(ListWarrantyModel? warrantyReq,
    ListStockistModel? stockistList, ListSdwModel? sdwlist) {
  List<List<dynamic>> csvList = [];
  csvList.add([
    'Sr. No.',
    'Stockist Code',
    'Business Name (Dealers)',
    'Mobile Number',
    'District',
    'State',
    'System Serial No.',
    'Item Code',
    'Item Description',
    'LPD',
    'Model',
    'Company Invoice Date',
    'Company Invoice Number',
    'Guarantee Period'
  ]);
  Map<int?, String?> custIdSl = {};
  for (SdwModel swd in sdwlist?.data ?? []) {
    custIdSl[swd.stockistId] = swd.warrantySerialNo;
  }
  Map<String?, WarrantyModel?> slMap = {};
  for (WarrantyRequestModel req in warrantyReq?.data ?? []) {
    slMap[req.warrantyDetails?.warrantySerialNo] = req.warrantyDetails;
  }
  int count = 0;
  for (StockistModel stockist in stockistList?.data ?? []) {
    count++;
    List row = [];
    row.add(count);
    row.add(stockist.stockistCode ?? '');
    row.add(stockist.businessName ?? '');
    row.add(stockist.mobileNo ?? '');
    row.add(stockist.address?.district ?? '');
    row.add(stockist.address?.state ?? '');
    row.add(custIdSl[stockist.stockistId] ?? '');
    row.add('');
    row.add(slMap[custIdSl[stockist.stockistId]]?.itemDescription ?? '');
    row.add(slMap[custIdSl[stockist.stockistId]]?.lpd ?? '');
    row.add(slMap[custIdSl[stockist.stockistId]]?.model ?? '');
    row.add(DateTimeFormatter.onlyDateShort(
        slMap[custIdSl[stockist.stockistId]]?.installationDate ?? ''));
    row.add(slMap[custIdSl[stockist.stockistId]]?.invoiceNo ?? '');
    row.add(slMap[custIdSl[stockist.stockistId]]?.guaranteePeriod ?? '');
    csvList.add(row);
  }

  return ListToCsvConverter().convert(csvList);
}

String getDealerReport(
    ListWarrantyModel? warrantyReq,
    ListDealerModel? dealerList,
    ListSdwModel? sdwlist,
    ListStockistModel? stockistList) {
  List<List<dynamic>> csvList = [];
  csvList.add([
    'Sr. No.',
    'Allocated Date',
    'Name',
    'Business Name',
    'Mobile Number',
    'Place',
    'District',
    'State',
    'Stockist Allocated Date',
    'System Serial No.',
    'Item Code',
    'Item Description',
    'LPD',
    'Model',
    'Company Invoice Date',
    'Company Invoice Number',
    'Guarantee Period',
    'Stockist Code',
    'Stockist Firm Name',
    'Stockist District',
    'Stockist State',
    'Guarantee Status',
  ]);
  Map<int?, String?> custIdSl = {};
  Map<int?, String?> allocationDate = {};
  Map<int?, int?> dealerStockist = {};

  for (SdwModel swd in sdwlist?.data ?? []) {
    custIdSl[swd.dealerId] = swd.warrantySerialNo;
    allocationDate[swd.dealerId] =
        DateTimeFormatter.onlyDateShort(swd.createdOn ?? '');
    dealerStockist[swd.dealerId] = swd.stockistId;
  }

  Map<int?, StockistModel?> stockistMap = {};
  for (StockistModel stockist in stockistList?.data ?? []) {
    stockistMap[stockist.stockistId] = stockist;
  }

  Map<String?, WarrantyModel?> slMap = {};
  for (WarrantyRequestModel req in warrantyReq?.data ?? []) {
    slMap[req.warrantyDetails?.warrantySerialNo] = req.warrantyDetails;
  }

  int count = 0;
  for (DealerModel dealer in dealerList?.data ?? []) {
    count++;
    List row = [];
    row.add(count);
    row.add(allocationDate[dealer.dealerId] ?? '');
    row.add(dealer.dealerName ?? '');
    row.add(dealer.businessName ?? '');
    row.add(dealer.mobileNo ?? '');
    row.add(dealer.address?.area ?? '');
    row.add(dealer.address?.district ?? '');
    row.add(dealer.address?.state ?? '');
    row.add(allocationDate[dealer.dealerId] ?? '');
    row.add(custIdSl[dealer.dealerId] ?? '');
    row.add('');
    row.add(slMap[custIdSl[dealer.dealerId]]?.itemDescription ?? '');
    row.add(slMap[custIdSl[dealer.dealerId]]?.lpd ?? '');
    row.add(slMap[custIdSl[dealer.dealerId]]?.model ?? '');
    row.add(DateTimeFormatter.onlyDateShort(
        slMap[custIdSl[dealer.dealerId]]?.installationDate ?? ''));
    row.add(slMap[custIdSl[dealer.dealerId]]?.invoiceNo ?? '');
    row.add(slMap[custIdSl[dealer.dealerId]]?.guaranteePeriod ?? '');
    row.add(dealer.stockistCode ?? '');
    row.add(stockistMap[dealerStockist[dealer.dealerId]]?.businessName ?? '');
    row.add(
        stockistMap[dealerStockist[dealer.dealerId]]?.address?.district ?? '');
    row.add(stockistMap[dealerStockist[dealer.dealerId]]?.address?.state ?? '');
    row.add(slMap[custIdSl[dealer.dealerId]]?.guaranteeStatus ?? '');

    csvList.add(row);
  }

  return ListToCsvConverter().convert(csvList);
}

String getPlumberReport(ListWarrantyModel? list) {
  List<List<dynamic>> csvList = [];
  csvList.add([
    'Sr. No.',
    'Plumber Name',
    'Plumber Mobile No.',
    'Plumber Place',
    'Dealer Name',
    'Dealer Mobile No.',
    'Dealer Place',
  ]);

  int count = 0;

  for (WarrantyRequestModel req in list?.data ?? []) {
    count++;
    List row = [];
    row.add(count);
    row.add(req.plumberInfo?.name ?? '');
    row.add(req.plumberInfo?.mobile ?? '');
    row.add(req.plumberInfo?.place ?? '');
    row.add(req.dealerInfo?.name ?? '');
    row.add(req.dealerInfo?.mobile ?? '');
    row.add(req.dealerInfo?.place ?? '');
    csvList.add(row);
  }

  return ListToCsvConverter().convert(csvList);
}

String getTechnicianReport(ListWarrantyModel? list) {
  List<List<dynamic>> csvList = [];
  csvList.add([
    'Sr. No.',
    'Technician Name',
    'Technician Mobile No.',
    'Technician Place',
    'Dealer Name',
    'Dealer Mobile No.',
    'Dealer Place',
  ]);

  int count = 0;

  for (WarrantyRequestModel req in list?.data ?? []) {
    count++;
    List row = [];
    row.add(count);
    row.add(req.technicianInfo?.name ?? '');
    row.add(req.technicianInfo?.mobile ?? '');
    row.add(req.technicianInfo?.place ?? '');
    row.add(req.dealerInfo?.name ?? '');
    row.add(req.dealerInfo?.mobile ?? '');
    row.add(req.dealerInfo?.place ?? '');
    csvList.add(row);
  }

  return ListToCsvConverter().convert(csvList);
}

String getWarrantyReport(
  ListWarrantyModel? list,
  ListSdwModel? sdwList,
  ListStockistModel? stockistList,
) {
  List<List<dynamic>> csvList = [];
  csvList.add([
    'Sr. No',
    'Create Date',
    'Customer Name',
    'Mobile Number1',
    'Mobile Number2',
    'Full Address',
    'Taluka',
    'District',
    'State',
    'System Serial No.',
    'Item Code',
    'Item Description',
    'LPD',
    'Model',
    'Company Invoice Date',
    'Company Invoice Number',
    'Guarantee Period',
    'Dealer Invoice No.',
    'Dealer Invoice Date',
    'Installation Date',
    'Stockist Code',
    'Business Name (Stockist)',
    'Stockist District',
    'Dealer Name',
    'Dealer Mobile',
    'Dealer Place',
    'Technician Name',
    'Technician Mobile',
    'Technician Place',
    'Plumber Name',
    'Plumber Mobile',
    'Plumber Place',
    'Verification Date',
    'Verify by (Name)',
  ]);

  Map<String?, int?> stockistIdBySerailNo = {};
  for (SdwModel swd in sdwList?.data ?? []) {
    stockistIdBySerailNo[swd.warrantySerialNo] = swd.stockistId;
  }

  Map<int?, StockistModel?> stockistCodeByStockistId = {};
  for (StockistModel stk in stockistList?.data ?? []) {
    stockistCodeByStockistId[stk.stockistId] = stk;
  }

  int count = 0;

  for (WarrantyRequestModel req in list?.data ?? []) {
    count++;
    List row = [];
    row.add(count);
    row.add(DateTimeFormatter.onlyDateShort(req.createdOn ?? ''));
    row.add(req.customers?.customerName ?? '');
    row.add(req.customers?.mobileNo ?? '');
    row.add(req.mobile2 ?? '');
    row.add(prepareAddress(req.installationAddress));
    row.add(req.installationAddress?.taluk ?? '');
    row.add(req.installationAddress?.district ?? '');
    row.add(req.installationAddress?.state ?? '');
    row.add(req.warrantyDetails?.warrantySerialNo ?? '');
    row.add('');
    row.add(req.warrantyDetails?.itemDescription ?? '');
    row.add(req.warrantyDetails?.lpd ?? '');
    row.add(req.warrantyDetails?.model ?? '');
    row.add(req.invoiceDate ?? '');
    row.add(req.invoiceNumber ?? '');
    row.add(req.warrantyDetails?.guaranteePeriod ?? '');
    row.add(req.warrantyDetails?.invoiceNo ?? '');
    row.add(req.invoiceDate ?? '');
    row.add(req.installationDate ?? '');
    row.add(stockistCodeByStockistId[
                stockistIdBySerailNo[req.warrantyDetails?.warrantySerialNo]]
            ?.stockistCode ??
        '');
    row.add(stockistCodeByStockistId[
                stockistIdBySerailNo[req.warrantyDetails?.warrantySerialNo]]
            ?.businessName ??
        '');
    row.add(stockistCodeByStockistId[
                stockistIdBySerailNo[req.warrantyDetails?.warrantySerialNo]]
            ?.address
            ?.district ??
        '');
    row.add(req.dealerInfo?.name ?? '');
    row.add(req.dealerInfo?.mobile ?? '');
    row.add(req.dealerInfo?.place ?? '');
    row.add(req.technicianInfo?.name ?? '');
    row.add(req.technicianInfo?.mobile ?? '');
    row.add(req.technicianInfo?.place ?? '');
    row.add(req.plumberInfo?.name ?? '');
    row.add(req.plumberInfo?.mobile ?? '');
    row.add(req.plumberInfo?.place ?? '');
    row.add(DateTimeFormatter.onlyDateShort(req.verifiedDate ?? ''));
    row.add(req.verifiedBy ?? '');
    csvList.add(row);
  }

  return ListToCsvConverter().convert(csvList);
}
