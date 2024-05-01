import 'package:http/http.dart' as http;
import 'dart:convert';

var baseurl = 'https://disease.sh/v3/covid-19/';
var worldwide = '$baseurl' + 'all';
var countries = '$baseurl' + 'countries';

getapidata({required get}) async {
  var url = await Uri.parse(get);
  var response = await http.get(url);
  var responseBody = await jsonDecode(response.body);
  print(responseBody);
  return responseBody;
}
