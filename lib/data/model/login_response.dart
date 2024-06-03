class LoginResponse {
  final int success;
  final String message;
  final CustomerData customerData;
  final String guestId;

  LoginResponse({
    required this.success,
    required this.message,
    required this.customerData,
    required this.guestId,
  });

  factory LoginResponse.fromJson(Map<String, dynamic> json) {
    return LoginResponse(
      success: json['success'] ?? 0,
      message: json['message'] ?? '',
      customerData: CustomerData.fromJson(json['customerdata'] ?? {}),
      guestId: json['guest_id'] ?? '',
    );
  }
}

class CustomerData {
  final String id;
  final String name;
  final String email;
  final String mobile;
  final String referee;
  final String referralCode;
  final int status;
  final String token;
  final int otpVerificationStatus;
  final int emailVerificationStatus;

  CustomerData({
    required this.id,
    required this.name,
    required this.email,
    required this.mobile,
    required this.referee,
    required this.referralCode,
    required this.status,
    required this.token,
    required this.otpVerificationStatus,
    required this.emailVerificationStatus,
  });

  factory CustomerData.fromJson(Map<String, dynamic> json) {
    return CustomerData(
      id: json['id'] ?? '',
      name: json['name'] ?? '',
      email: json['email'] ?? '',
      mobile: json['mobile'] ?? '',
      referee: json['referee'] ?? '',
      referralCode: json['referral_code'] ?? '',
      status: json['status'] ?? 0,
      token: json['token'] ?? '',
      otpVerificationStatus: json['otpverificationstatus'] ?? 0,
      emailVerificationStatus: json['emailverificationstatus'] ?? 0,
    );
  }
}
