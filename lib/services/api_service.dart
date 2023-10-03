import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:saur_admin/model/customer_model.dart';
import 'package:saur_admin/model/dashboard_metrics.dart';
import 'package:saur_admin/model/dealer_model.dart';
import 'package:saur_admin/model/list/list_customer_model.dart';
import 'package:saur_admin/model/list/list_dealer_model.dart';
import 'package:saur_admin/model/list/list_warranty_model.dart';
import 'package:saur_admin/model/stockist_model.dart';
import 'package:saur_admin/model/warranty_model.dart';
import 'package:saur_admin/model/warranty_request_model.dart';
import 'package:saur_admin/services/toast_service.dart';
import 'package:saur_admin/utils/enum.dart';

import '../model/list/list_stockist_model.dart';
import '../utils/api.dart';

enum ApiStatus { ideal, loading, success, failed }

class ApiProvider extends ChangeNotifier {
  ApiStatus? status = ApiStatus.ideal;
  late Dio _dio;
  static ApiProvider instance = ApiProvider();
  ApiProvider() {
    _dio = Dio();
  }

  Future<bool> updateUser(String api, Map<String, dynamic> user, int id) async {
    status = ApiStatus.loading;
    log('$api/$id');
    notifyListeners();
    try {
      Response response = await _dio.put(
        '$api/$id',
        data: json.encode(user),
        options: Options(
          contentType: 'application/json',
          responseType: ResponseType.json,
        ),
      );
      if (response.statusCode == 200) {
        status = ApiStatus.success;
        notifyListeners();
        return true;
      }
    } on DioException catch (e) {
      status = ApiStatus.failed;
      var resBody = e.response?.data ?? {};
      log(e.response?.data.toString() ?? e.response.toString());
      notifyListeners();
      ToastService.instance.showError('Error : ${resBody['message']}');
    } catch (e) {
      status = ApiStatus.failed;
      notifyListeners();
      ToastService.instance.showError(e.toString());
      log(e.toString());
    }
    status = ApiStatus.failed;
    notifyListeners();
    return false;
  }

  Future<CustomerModel?> getCustomerById(int id) async {
    status = ApiStatus.loading;
    notifyListeners();
    CustomerModel? userModel;
    try {
      Response response = await _dio.get(
        '${Api.customer}/$id',
        options: Options(
          contentType: 'application/json',
          responseType: ResponseType.json,
        ),
      );
      if (response.statusCode == 200) {
        userModel = CustomerModel.fromMap(response.data['data']);
        status = ApiStatus.success;
        notifyListeners();
        return userModel;
      }
    } on DioException catch (e) {
      status = ApiStatus.failed;
      var resBody = e.response?.data ?? {};
      log(e.response?.data.toString() ?? e.response.toString());
      notifyListeners();
      ToastService.instance.showError('Error : ${resBody['message']}');
    } catch (e) {
      status = ApiStatus.failed;
      notifyListeners();
      ToastService.instance.showError(e.toString());
      log(e.toString());
    }
    status = ApiStatus.failed;
    notifyListeners();
    return userModel;
  }

  Future<DealerModel?> getDealerById(int id) async {
    status = ApiStatus.loading;
    notifyListeners();
    DealerModel? userModel;
    log('${Api.dealers}/$id');
    try {
      Response response = await _dio.get(
        '${Api.dealers}/$id',
        options: Options(
          contentType: 'application/json',
          responseType: ResponseType.json,
        ),
      );
      if (response.statusCode == 200) {
        userModel = DealerModel.fromMap(response.data['data']);
        status = ApiStatus.success;
        notifyListeners();
        return userModel;
      }
    } on DioException catch (e) {
      status = ApiStatus.failed;
      var resBody = e.response?.data ?? {};
      log(e.response?.data.toString() ?? e.response.toString());
      notifyListeners();
      ToastService.instance.showError('Error : ${resBody['message']}');
    } catch (e) {
      status = ApiStatus.failed;
      notifyListeners();
      ToastService.instance.showError(e.toString());
      log(e.toString());
    }
    status = ApiStatus.failed;
    notifyListeners();
    return userModel;
  }

  Future<StockistModel?> getStockistById(int id) async {
    status = ApiStatus.loading;
    notifyListeners();
    StockistModel? userModel;

    try {
      Response response = await _dio.get(
        '${Api.stockist}/$id',
        options: Options(
          contentType: 'application/json',
          responseType: ResponseType.json,
        ),
      );
      if (response.statusCode == 200) {
        userModel = StockistModel.fromMap(response.data['data']);
        status = ApiStatus.success;
        notifyListeners();
        return userModel;
      }
    } on DioException catch (e) {
      status = ApiStatus.failed;
      var resBody = e.response?.data ?? {};
      log(e.response?.data.toString() ?? e.response.toString());
      notifyListeners();
      ToastService.instance.showError('Error : ${resBody['message']}');
    } catch (e) {
      status = ApiStatus.failed;
      notifyListeners();
      ToastService.instance.showError(e.toString());
      log(e.toString());
    }
    status = ApiStatus.failed;
    notifyListeners();
    return userModel;
  }

  Future<ListCustomerModel?> getAllCustomer() async {
    status = ApiStatus.loading;
    notifyListeners();
    ListCustomerModel? list;
    log(Api.customer);
    try {
      Response response = await _dio.get(
        Api.customer,
        options: Options(
          contentType: 'application/json',
          responseType: ResponseType.json,
        ),
      );
      if (response.statusCode == 200) {
        list = ListCustomerModel.fromMap(response.data);
        status = ApiStatus.success;
        notifyListeners();
        return list;
      }
    } on DioException catch (e) {
      status = ApiStatus.failed;
      var resBody = e.response?.data ?? {};
      log(e.response?.data.toString() ?? e.response.toString());
      notifyListeners();
      ToastService.instance.showError('Error : ${resBody['message']}');
    } catch (e) {
      status = ApiStatus.failed;
      notifyListeners();
      ToastService.instance.showError(e.toString());
      log(e.toString());
    }
    status = ApiStatus.failed;
    notifyListeners();
    return list;
  }

  Future<ListDealerModel?> getAllDealers() async {
    status = ApiStatus.loading;
    notifyListeners();
    ListDealerModel? list;
    try {
      Response response = await _dio.get(
        Api.dealers,
        options: Options(
          contentType: 'application/json',
          responseType: ResponseType.json,
        ),
      );
      if (response.statusCode == 200) {
        list = ListDealerModel.fromMap(response.data);
        status = ApiStatus.success;
        notifyListeners();
        return list;
      }
    } on DioException catch (e) {
      status = ApiStatus.failed;
      var resBody = e.response?.data ?? {};
      log(e.response?.data.toString() ?? e.response.toString());
      notifyListeners();
      ToastService.instance.showError('Error : ${resBody['message']}');
    } catch (e) {
      status = ApiStatus.failed;
      notifyListeners();
      ToastService.instance.showError(e.toString());
      log(e.toString());
    }
    status = ApiStatus.failed;
    notifyListeners();
    return list;
  }

  Future<ListStockistModel?> getAllStockist() async {
    status = ApiStatus.loading;
    notifyListeners();
    ListStockistModel? list;
    try {
      Response response = await _dio.get(
        Api.stockist,
        options: Options(
          contentType: 'application/json',
          responseType: ResponseType.json,
        ),
      );
      log(response.data.toString());
      if (response.statusCode == 200) {
        list = ListStockistModel.fromMap(response.data);
        status = ApiStatus.success;
        notifyListeners();
        return list;
      }
    } on DioException catch (e) {
      status = ApiStatus.failed;
      var resBody = e.response?.data ?? {};
      log(e.response?.data.toString() ?? e.response.toString());
      notifyListeners();
      ToastService.instance.showError('Error : ${resBody['message']}');
    } catch (e) {
      status = ApiStatus.failed;
      notifyListeners();
      ToastService.instance.showError(e.toString());
      log(e.toString());
    }
    status = ApiStatus.failed;
    notifyListeners();
    return list;
  }

  Future<bool> createNewWarrantyRequest(Map<String, dynamic> reqBody) async {
    status = ApiStatus.loading;
    notifyListeners();
    try {
      Response response = await _dio.post(
        Api.requestWarranty,
        data: json.encode(reqBody),
        options: Options(
          contentType: 'application/json',
          responseType: ResponseType.json,
        ),
      );
      if (response.statusCode == 200) {
        status = ApiStatus.success;
        notifyListeners();
        return true;
      }
    } on DioException catch (e) {
      status = ApiStatus.failed;
      // var resBody = e.response?.data ?? {};
      log(e.response?.data.toString() ?? e.response.toString());
      notifyListeners();
      ToastService.instance.showError('Error : Invalid serial number');
    } catch (e) {
      status = ApiStatus.failed;
      notifyListeners();
      ToastService.instance.showError(e.toString());
      log(e.toString());
    }
    status = ApiStatus.failed;
    notifyListeners();
    return false;
  }

  Future<ListWarrantyModel?> getAllWarrantyRequest() async {
    status = ApiStatus.loading;
    notifyListeners();
    ListWarrantyModel? warrantyModel;
    try {
      Response response = await _dio.get(
        Api.requestWarranty,
        options: Options(
          contentType: 'application/json',
          responseType: ResponseType.json,
        ),
      );
      log(response.data.toString());
      if (response.statusCode == 200) {
        warrantyModel = ListWarrantyModel.fromMap(response.data);
        status = ApiStatus.success;
        notifyListeners();
        return warrantyModel;
      }
    } on DioException catch (e) {
      status = ApiStatus.failed;
      var resBody = e.response?.data ?? {};
      log(e.response?.data.toString() ?? e.response.toString());
      notifyListeners();
      ToastService.instance.showError('Error : ${resBody['message']}');
    } catch (e) {
      status = ApiStatus.failed;
      notifyListeners();
      ToastService.instance.showError(e.toString());
      log(e.toString());
    }
    status = ApiStatus.failed;
    notifyListeners();
    return warrantyModel;
  }

  Future<WarrantyRequestModel?> getWarrantyRequestById(String id) async {
    status = ApiStatus.loading;
    notifyListeners();
    WarrantyRequestModel? warrantyModel;
    try {
      Response response = await _dio.get(
        '${Api.requestWarranty}/$id',
        options: Options(
          contentType: 'application/json',
          responseType: ResponseType.json,
        ),
      );

      if (response.statusCode == 200) {
        warrantyModel = WarrantyRequestModel.fromMap(response.data['data']);
        status = ApiStatus.success;
        notifyListeners();
        return warrantyModel;
      }
    } on DioException catch (e) {
      status = ApiStatus.failed;
      var resBody = e.response?.data ?? {};
      log(e.response?.data.toString() ?? e.response.toString());
      notifyListeners();
      ToastService.instance.showError('Error : ${resBody['message']}');
    } catch (e) {
      status = ApiStatus.failed;
      notifyListeners();
      ToastService.instance.showError(e.toString());
      log(e.toString());
    }
    status = ApiStatus.failed;
    notifyListeners();
    return warrantyModel;
  }

  Future<bool> updateWarrantyRequest(
      Map<String, dynamic> map, String id) async {
    status = ApiStatus.loading;

    notifyListeners();
    try {
      Response response = await _dio.put(
        '${Api.requestWarranty}/$id',
        data: json.encode(map),
        options: Options(
          contentType: 'application/json',
          responseType: ResponseType.json,
        ),
      );
      if (response.statusCode == 200) {
        status = ApiStatus.success;
        notifyListeners();
        return true;
      }
    } on DioException catch (e) {
      status = ApiStatus.failed;
      var resBody = e.response?.data ?? {};
      log(e.response?.data.toString() ?? e.response.toString());
      notifyListeners();
      ToastService.instance.showError('Error : ${resBody['message']}');
    } catch (e) {
      status = ApiStatus.failed;
      notifyListeners();
      ToastService.instance.showError(e.toString());
      log(e.toString());
    }
    status = ApiStatus.failed;
    notifyListeners();
    return false;
  }

  Future<bool> checkAdminPhone(String phone) async {
    status = ApiStatus.loading;
    notifyListeners();
    log('${Api.admin}/$phone');
    try {
      Response response = await _dio.get(
        '${Api.admin}/$phone',
        options: Options(
          contentType: 'application/json',
          responseType: ResponseType.json,
        ),
      );

      if (response.statusCode == 200) {
        status = ApiStatus.success;
        notifyListeners();
        return true;
      }
    } on DioException catch (e) {
      status = ApiStatus.failed;
      var resBody = e.response?.data ?? {};
      log(e.response?.data.toString() ?? e.response.toString());
      notifyListeners();
      ToastService.instance.showError('Error : ${resBody['message']}');
    } catch (e) {
      status = ApiStatus.failed;
      notifyListeners();
      ToastService.instance.showError(e.toString());
      log(e.toString());
    }
    status = ApiStatus.failed;
    notifyListeners();
    return false;
  }

  Future<bool> sendOtp(String phone, String otp) async {
    status = ApiStatus.loading;
    notifyListeners();
    debugPrint(Api.buildOtpUrl(phone, otp));
    try {
      Response response = await _dio.get(
        Api.buildOtpUrl(phone, otp),
        options: Options(
            contentType: 'application/json',
            responseType: ResponseType.json,
            headers: {
              'Access-Control-Allow-Origin': '*',
              'Access-Control-Allow-Methods':
                  'GET, POST, PATCH, PUT, DELETE, OPTIONS',
              'Access-Control-Allow-Headers':
                  'Origin, Content-Type, X-Auth-Token',
            }),
      );
      log(response.data.toString());
      if (response.statusCode == 200) {
        ToastService.instance.showSuccess('OTP sent');
        status = ApiStatus.success;
        notifyListeners();
        return true;
      }
    } on DioException catch (e) {
      status = ApiStatus.failed;
      var resBody = e.response?.data ?? {};
      log(e.response?.data.toString() ?? e.response.toString());
      notifyListeners();
    } catch (e) {
      status = ApiStatus.failed;
      notifyListeners();
      ToastService.instance.showError(e.toString());
      log(e.toString());
    }
    status = ApiStatus.failed;
    notifyListeners();
    return false;
  }

  Future<DashboardMetrics> getDashboardMetrics() async {
    DashboardMetrics dashboardMetrics = DashboardMetrics(
      customerCreated: 0,
      customerActive: 0,
      customerSuspended: 0,
      customerBlocked: 0,
      stockistCreated: 0,
      stockistActive: 0,
      stockistSuspended: 0,
      stockistBlocked: 0,
      dealerCreated: 0,
      dealerActive: 0,
      dealerSuspended: 0,
      dealerBlocked: 0,
      warrantyRequestPending: 0,
      warrantyRequestApproved: 0,
      warrantyRequestDeclined: 0,
    );
    status = ApiStatus.loading;
    notifyListeners();
    try {
      Response response = await _dio.get(
        Api.count,
        options: Options(
          contentType: 'application/json',
          responseType: ResponseType.json,
        ),
      );
      if (response.statusCode == 200) {
        status = ApiStatus.success;
        // parsing stockists
        var stockistArr =
            response.data['data']['data']['stockists']['statuses'];
        for (var item in stockistArr) {
          switch (item['status']) {
            case 'CREATED':
              dashboardMetrics.stockistCreated = item['count'];
              break;
            case 'ACTIVE':
              dashboardMetrics.stockistActive = item['count'];
              break;
            case 'SUSPENDED':
              dashboardMetrics.stockistSuspended = item['count'];
              break;
            case 'BLOCKED':
              dashboardMetrics.stockistBlocked = item['count'];
              break;
          }
        }

        // parsing customer
        var customerArr =
            response.data['data']['data']['customers']['statuses'];
        for (var item in customerArr) {
          switch (item['status']) {
            case 'CREATED':
              dashboardMetrics.customerCreated = item['count'];
              break;
            case 'ACTIVE':
              dashboardMetrics.customerActive = item['count'];
              break;
            case 'SUSPENDED':
              dashboardMetrics.customerSuspended = item['count'];
              break;
            case 'BLOCKED':
              dashboardMetrics.customerBlocked = item['count'];
              break;
          }
        }

        // parsing dealer
        var dealerArr = response.data['data']['data']['dealers']['statuses'];
        for (var item in dealerArr) {
          switch (item['status']) {
            case 'CREATED':
              dashboardMetrics.dealerCreated = item['count'];
              break;
            case 'ACTIVE':
              dashboardMetrics.dealerActive = item['count'];
              break;
            case 'SUSPENDED':
              dashboardMetrics.dealerSuspended = item['count'];
              break;
            case 'BLOCKED':
              dashboardMetrics.dealerBlocked = item['count'];
              break;
          }
        }

        // parsing warrantyDetails
        var warrantyDetailsArr =
            response.data['data']['data']['warrantyDetails']['statuses'];
        for (var item in warrantyDetailsArr) {
          switch (item['status']) {
            case 'PENDING':
              dashboardMetrics.warrantyRequestPending = item['count'];
              break;
            case 'APPROVED':
              dashboardMetrics.warrantyRequestApproved = item['count'];
              break;
            case 'DECLINED':
              dashboardMetrics.warrantyRequestDeclined = item['count'];
              break;
          }
        }
        notifyListeners();
        return dashboardMetrics;
      }
    } on DioException catch (e) {
      status = ApiStatus.failed;
      var resBody = e.response?.data ?? {};
      log(e.response?.data.toString() ?? e.response.toString());
      notifyListeners();
    } catch (e) {
      status = ApiStatus.failed;
      notifyListeners();
      ToastService.instance.showError(e.toString());
      log(e.toString());
    }
    status = ApiStatus.failed;
    notifyListeners();
    return dashboardMetrics;
  }
}
