import 'package:saur_admin/model/address_model.dart';

String prepareAddress(AddressModel? address) {
  if (address == null) return '-';
  return '${address.houseNo} ${address.area},\n${address.street1},\n${address.street2},\n${address.landmark},\n${address.taluk},\n${address.town},\n${address.state} - ${address.zipCode}';
}
