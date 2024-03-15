import 'package:saur_admin/model/address_model.dart';

String prepareAddress(AddressModel? address) {
  if (address == null) return '-';
  return '${address.houseNo} ${address.area}, ${address.street1}, ${address.street2}, ${address.landmark}, ${address.taluk}, ${address.town}, ${address.state} - ${address.zipCode}';
}

String prepareAddressWithoutDistrict(AddressModel? address) {
  if (address == null) return '-';
  return '${address.houseNo} ${address.area}, ${address.street1}, ${address.street2}, ${address.landmark}, ${address.town}, ${address.state} - ${address.zipCode}';
}
