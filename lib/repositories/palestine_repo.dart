import 'package:app/di.dart';
import 'package:app/enum/enums.dart';
import 'package:app/extensions/list_ext.dart';
import 'package:app/interceptors/api_interceptor.dart';
import 'package:app/models/palestine/palestine.dart';
import 'package:app/models/palestine/palestine_api.dart';
import 'package:app/utils/api_url.dart';

class PalestineRepository {
  Future<List<Palestine>> getPalestineList() async {
    var endPoint = sl<ApiUrl>().palestine;
    var apiResponse = await sl<ApiInterceptor>().getRequest(endPoint: endPoint, header: Header.auth);
    if (apiResponse.status == 200) {
      var palestineApi = PalestineApi.fromJson(apiResponse.response);
      return palestineApi.palestineList.haveList ? palestineApi.palestineList! : [];
    } else {
      return [];
    }
  }
}
