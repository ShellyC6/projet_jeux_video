import 'dart:convert';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:http/http.dart' as http;

abstract class FindGame{

  static void findGame({required int id}) async{

    // On regarde si on a déjà ce jeu dans la base de données Firebase
    final db = FirebaseFirestore.instance;
    final querySnapshot = await db.collection("Games").where("id", isEqualTo: id).get();

    // Si on n'a pas trouvé le jeu
    if(querySnapshot.docs.isEmpty) {
      // On ajoute le jeu
      final response = await http.get(Uri.parse('https://store.steampowered.com/api/appdetails?appids=$id'));
      if (response.statusCode == 200) {
        print("Adding $id to the database...");
        final data = jsonDecode(response.body);
        /*if(data['$id']['data']['price_overview']==null || data['$id']['data']['price_overview']==null){
          final data2 = {
            "id": id,
            "nom": data['$id']['data']['name'],
            "editeur": data['$id']['data']['publishers'][0],
            "prix": "Prix inconnu",
            "image": 'https://media.senscritique.com/media/000017048549/source_big/La_Grande_Aventure_LEGO_Le_Jeu_video.jpg',
            "description": data['$id']['data']['short_description'],
            "background": data['$id']['data']['background'],
            "header": data['$id']['data']['header_image'],
          };
          await db.collection("Games").add(data2);
        } else if(data['$id']['data']['is_free']==true){
          final data2 = {
            "id": id,
            "nom": data['$id']['data']['name'],
            "editeur": data['$id']['data']['publishers'][0],
            "prix": '0€',
            "image": 'https://media.senscritique.com/media/000017048549/source_big/La_Grande_Aventure_LEGO_Le_Jeu_video.jpg',
            "description": data['$id']['data']['short_description'],
            "background": data['$id']['data']['background'],
            "header": data['$id']['data']['header_image'],
          };
          await db.collection("Games").add(data2);
        }else {
          final data2 = {
            "id": id,
            "nom": data['$id']['data']['name'],
            "editeur": data['$id']['data']['publishers'][0],
            "prix": data['$id']['data']['price_overview']['final_formatted'],
            "image": 'https://media.senscritique.com/media/000017048549/source_big/La_Grande_Aventure_LEGO_Le_Jeu_video.jpg',
            "description": data['$id']['data']['short_description'],
            "background": data['$id']['data']['background'],
            "header": data['$id']['data']['header_image'],
          };
          await db.collection("Games").add(data2);
        }*/
        try{
          if(data['$id']['data']['is_free']==true){
            final data2 = {
              "id": id,
              "nom": data['$id']['data']['name'],
              "editeur": data['$id']['data']['publishers'][0],
              "prix": '0€',
              "image": 'https://media.senscritique.com/media/000017048549/source_big/La_Grande_Aventure_LEGO_Le_Jeu_video.jpg',
              "description": data['$id']['data']['short_description'],
              "background": data['$id']['data']['background'],
              "header": data['$id']['data']['header_image'],
            };
            await db.collection("Games").add(data2);
          }else {
            final data2 = {
              "id": id,
              "nom": data['$id']['data']['name'],
              "editeur": data['$id']['data']['publishers'][0],
              "prix": data['$id']['data']['price_overview']['final_formatted'],
              "image": 'https://media.senscritique.com/media/000017048549/source_big/La_Grande_Aventure_LEGO_Le_Jeu_video.jpg',
              "description": data['$id']['data']['short_description'],
              "background": data['$id']['data']['background'],
              "header": data['$id']['data']['header_image'],
            };
            await db.collection("Games").add(data2);
          }
        }catch(e){
          try{
            final data2 = {
              "id": id,
              "nom": data['$id']['data']['name'],
              "editeur": data['$id']['data']['publishers'][0],
              "prix": "Prix inconnu",
              "image": 'https://media.senscritique.com/media/000017048549/source_big/La_Grande_Aventure_LEGO_Le_Jeu_video.jpg',
              "description": data['$id']['data']['short_description'],
              "background": data['$id']['data']['background'],
              "header": data['$id']['data']['header_image'],
            };
            await db.collection("Games").add(data2);
          }catch(e2){
            final data2 = {
              "id": id,
              "nom": "Erreur",
              "editeur": "Erreur",
              "prix": "Prix inconnu",
              "image": 'https://media.senscritique.com/media/000017048549/source_big/La_Grande_Aventure_LEGO_Le_Jeu_video.jpg',
              "description": "Erreur",
              "background": "https://cdn.akamai.steamstatic.com/steam/apps/400/page_bg_generated_v6b.jpg?t=1673562889",
              "header": "https://tse2.mm.bing.net/th?id=OIP.ctbE91scwm8oq1udQ1-KPgHaF7&pid=Api",
            };
            await db.collection("Games").add(data2);
          }
        }

        //print(data['$id']['data']['name']);
        //print(data ['$id']['data']['detailed_description']);
      } else {
        print("Game $id not found");
        throw Exception('Failed to fetch game name');
      }
    }
    else{
      print("Game $id already exists");
    }
  }
}