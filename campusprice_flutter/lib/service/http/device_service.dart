import '../../config/http/http.dart';
import '../../model/response.dart';

class DeviceService{

  static Future<RResponse> getCountryProvinceCity(String ip) async {
    Map<String, dynamic> response = await Http.post(
      "/Location/getCountryProvinceCity",
      params: {
          "ip" : ip
      },
    );
    return RResponse(
        code: response['code'],
        message: response['message'],
        data: response['data'],
    );
  }

  // static Future<RResponse> getNewInfo() async {
  //   Map<String, dynamic> response = await Http.get(
  //     "/v1/user/info/status",
  //   );
  //   return RResponse(
  //       code: response['code'],
  //       message: response['message'],
  //       data: response['data']);
  // }
}