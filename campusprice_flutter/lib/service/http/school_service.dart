import '../../config/http/http.dart';
import '../../model/response.dart';

class SchoolService{

  static Future<RResponse> getSchools(String province) async {
    Map<String, dynamic> response = await Http.get(
      "/School/$province",
    );
    return RResponse(
        code: response['code'],
        message: response['message'],
        data: response['data'],
    );
  }

}