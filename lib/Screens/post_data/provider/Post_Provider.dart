import 'package:flutter/cupertino.dart';
import 'package:permission_handler/permission_handler.dart';

import '../../../utils/api_helper.dart';
import '../model/Post_model.dart';


class AddScreenProvider extends ChangeNotifier {
  List<EcommerceModal> jsonData = [];

  Future<void> getApi() async {
    ApiHelper api = ApiHelper();
    jsonData = await api.getApi();
    notifyListeners();

    Future<void> permission()
    async {
      var Status = await[
        Permission.camera,
        Permission.location,
        Permission.storage,
      ].request();
    }
  }
}