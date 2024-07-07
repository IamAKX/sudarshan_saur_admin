class Api {
  // static const String baseUrl = 'http://icrmonline.in:8084';
  // static const String baseUrl = 'http://localhost:8084';
  static const String baseUrl = 'https://51.21.120.88:8084';

  static const String login = '$baseUrl/saur/customers/authenticate';

  static const String customer = '$baseUrl/saur/customers';

  static const String dealers = '$baseUrl/saur/dealers';

  static const String requestWarranty = '$baseUrl/saur/warrantyRequests';
  static const String requestWarrantyStatus = '$baseUrl/saur/warrantyRequests/warrantyStatus';

  static const String stockist = '$baseUrl/saur/stockists';

  static const String admin = '$baseUrl/saur/admin';

  static const String count = '$baseUrl/saur/customers/count';

  static const String sdw = '$baseUrl/saur/sdw';
  static const String download = '$baseUrl/saur/report/';

  static const String dealerAgreement =
      '$baseUrl/sudarshansaur/agreement/dealer/';
  static const String stockistAgreement =
      '$baseUrl/sudarshansaur/agreement/stockist/';

  static String buildOtpUrl(String phone, String otp) {
    return 'https://sms.voicesoft.in/vb/apikey.php?apikey=UaOLHBZP2GxUy3ZN&senderid=SSSPLM&number=$phone&unicode=2&message=Your%20OTP%20for%20phone%20verification%20on%20Sudarshan%20Saur%20Application%20is%20$otp';
  }
}
