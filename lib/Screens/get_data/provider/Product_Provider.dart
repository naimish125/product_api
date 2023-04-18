import 'package:flutter/material.dart';
import '../../../utils/api_helper.dart';

class AddProvider extends ChangeNotifier
{
  TextEditingController txtName = TextEditingController();
  TextEditingController txtRate = TextEditingController();
  TextEditingController txtPrice = TextEditingController();
  TextEditingController txtOffer = TextEditingController();
  TextEditingController txtDescription = TextEditingController();
  TextEditingController txtCategory = TextEditingController();
  var FormKey = GlobalKey<FormState>();
  Future<String> postApi(String p_name,String p_rate,String p_price,String p_offer,String p_desc,String p_category) async {
    ApiHelper api = ApiHelper();
    String result = await api.postApi(p_name,p_rate,p_price,p_offer,p_desc,p_category);
    return result;
  }
}