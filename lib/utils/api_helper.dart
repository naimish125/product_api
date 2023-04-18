import 'dart:convert';
import 'package:http/http.dart' as http;

import '../Screens/post_data/model/Post_model.dart';
class ApiHelper
{
  Future<String> postApi(String p_name,String p_rate,String p_price,String p_offer,String p_desc,String p_category) async {
    Uri link = Uri.parse("https://apidatahub.000webhostapp.com/MyShop/API/adddataapi.php");
    var data = await http.post(link,body:{"p_name":p_name,"p_rate":p_rate,"p_price":p_price,"p_offer":p_offer,"p_desc":p_desc,"p_category":p_category});
    if(data.statusCode == 200)
    {
      return "Success";
    }
    print("Helow");
    return "fail";
  }
  Future<List<EcommerceModal>> getApi() async {
    Uri link = Uri.parse("https://apidatahub.000webhostapp.com/MyShop/API/products.php");
    var data = await http.get(link);
    List json = jsonDecode(data.body);
    List<EcommerceModal> jsonData = json.map((e) => EcommerceModal.fromJson(e)).toList();
    return jsonData;
  }
}
