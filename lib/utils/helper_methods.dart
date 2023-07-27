import 'package:saur_admin/model/address_model.dart';

String prepareAddress(AddressModel? address) {
  return '${address?.addressLine1}, ${address?.addressLine2}, ${address?.city}, ${address?.state} - ${address?.zipCode}';
}
