class Api {
  static const String baseUrl = 'http://icrmonline.in:8084';
  // static const String baseUrl = 'http://localhost:8084';

  static const String login = '$baseUrl/saur/customers/authenticate';

  static const String customer = '$baseUrl/saur/customers';

  static const String dealers = '$baseUrl/saur/dealers';

  static const String requestWarranty = '$baseUrl/saur/warrantyDetails';

  static const String stockist = '$baseUrl/saur/stockists';
}
