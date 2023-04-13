import 'dart:convert';

import 'package:http/http.dart' as http;

abstract class GetBestGames{

  static Future<List<int>> getBestGames() async {
    List<int> gameIds = <int>[];

    final response = await http.get(Uri.parse('https://api.steampowered.com/ISteamChartsService/GetMostPlayedGames/v1/?'));
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      for(var game in data['response']['ranks']){
        gameIds.add(game['appid']);
      }
    }

    /*gameIds.add(730);
    gameIds.add(400);
    gameIds.add(1172470);
    gameIds.add(1938090);*/

    return gameIds;
  }

}