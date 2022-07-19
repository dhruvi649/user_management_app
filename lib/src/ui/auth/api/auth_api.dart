import '../../user_list/model/get_user_profile_model.dart';
import '../../../base/api/base_api.dart';
import '../../../base/api/res/common_res.dart';
import '../../../base/api/url_factory.dart';
import '../model/user_login_model.dart';

class AuthAPI {
  static Future<CommonRes> loginUser(UserLoginModel loginModel) async {
    final _response = await BaseAPI.apiPost(
      body: userLoginModelToJson(loginModel),
      url: loginUserUrl,
      isHeaderIncluded: false,
    );
    return commonResFromJson(_response.body);
  }

  static Future<UserProfileModel> getUser(context) async {
    final _response = await BaseAPI.apiGet(
      url: userProfile,
      isHeaderIncluded: true,
    );
    return userProfileModelFromJson(_response.body);
  }
}
