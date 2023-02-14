import 'dart:convert';
import '../constants/constants.dart';
import 'watchlistrseponsemodel.dart';
import 'package:http/http.dart' as http;

class WatchlistResponse{
  Future<List<WatchlistData>> fetchWatchlistData() async {

    var watchlistUrl=Uri.parse(AppConstants.apiUrl);
    var watchlistResponse=await http.get(watchlistUrl);
    if(watchlistResponse.statusCode == AppConstants.successStatusCode){
      List jsonResponse=json.decode(watchlistResponse.body);
      return jsonResponse.map((data) => WatchlistData.fromJson(data)).toList();
    }else{
      throw Exception(AppConstants.errorOccur);
    }

  }

}