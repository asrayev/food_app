


import 'package:food_app/service/api_service/open_api_provider/open_api_client.dart';

import '../../../utils/tools/file_importer.dart';

class ApiService extends ApiClient {



  //get category
  Future<MyResponse> getCategory() async {
    MyResponse myResponse = MyResponse(error: "");
    try{
      var response = await dio.get("${dio.options.baseUrl}058729bd-1402-4578-88de-265481fd7d54");
      if(response.statusCode! >= 200 && response.statusCode! <= 299) {
        myResponse.data = response.data;
        myResponse.statusCode = response.statusCode;
      }

    }catch(e){
      if (e is DioError) {
        myResponse.statusCode = e.response?.statusCode;
      }else {
        myResponse.error = "ERROR";
      }
    }
    return myResponse;
  }

  //get foods
  Future<MyResponse> getFoods() async {
    MyResponse myResponse = MyResponse(error: "");
    try{
      var response = await dio.get("${dio.options.baseUrl}aba7ecaa-0a70-453b-b62d-0e326c859b3b");
      if(response.statusCode! >= 200 && response.statusCode! <= 299) {
        myResponse.data = response.data;
        myResponse.statusCode = response.statusCode;
      }

    }catch(e){
      if (e is DioError) {
        myResponse.statusCode = e.response?.statusCode;
      }else {
        myResponse.error = "ERROR";
      }
    }
    return myResponse;
  }



}
