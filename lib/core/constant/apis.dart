class AutomationApi {
  static const baseUrl = "https://taosel.com/api/driver";
  //**************** Authentication *******************//
  static const loginUrl = "$baseUrl/auth/login"; //post
  static const registerUrl = "$baseUrl/auth/register-client"; //post
  static const checkOtpRegisterUrl = "$baseUrl/auth/reset/check_code"; //post
  static const changePhoneUrl = "$baseUrl/change_phone"; //post
  static const verifyPhone = "$baseUrl/verify-phone"; //post
  static const verifieyPhoneUrl = "$baseUrl/auth/check-phone"; //post
  static const changePasswordUrl = "$baseUrl/change-password"; //post
  static const updateAllProfileUrl = "$baseUrl/profile"; //post
  static const getAlCategorylVendors = "$baseUrl/vendor-categories"; //get
  static const getAllVendors = "$baseUrl/vendors"; //get
  static const addAddition = "$baseUrl/cart/store"; //get
  static const getAllVendorCategory = "$baseUrl/vendor-categories/"; //get
  static const showOrderCart = "$baseUrl/order/store"; //post
  static const getAllOrder = "$baseUrl/order"; //get
  static const cancelOrder = "$baseUrl/order/cancel"; //get
  static const getNotification = "$baseUrl/notification"; //get
  static const sendLocation = "$baseUrl/address"; //get
  //**************** Profile *******************//
  static const profileUrl = "$baseUrl/profile"; //get
  static const updateNameUrl = "$baseUrl/update_name"; //post
  static const updateEmailUrl = "$baseUrl/update_email"; //post
  static const updatePhoneUrl = "$baseUrl/update_phone"; //post
  static const updateLicenseImageUrl = "$baseUrl/update_license_image"; //post

}
