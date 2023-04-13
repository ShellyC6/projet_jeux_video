import 'package:cloud_firestore/cloud_firestore.dart';

class Game {
  final int id;
  String? nom;
  String editeur = "Erreur";
  double prix = 0;
  String image = "Erreur";
  String description = "Erreur";

  Game({required this.id}){
    final db = FirebaseFirestore.instance;

    final ref = db.collection("Games")
        .where("id", isEqualTo: id)
        .withConverter(
          fromFirestore: Game.fromFirestore,
          toFirestore: (Game myGame, _) => myGame.toFirestore(),
    );
    ref.get().then((docSnap){
      final myGame = docSnap.docs; // Convert to City object
      if (myGame.isNotEmpty) {
        print(myGame.first.get("nom"));
        nom = myGame.first.get("nom");
      } else {
        print("No document with id $id in Firebase.");
      }
    });
  }

  Game.thatExist({required this.id, required this.nom, required this.editeur, required this.prix, required this.image, required this.description});

  factory Game.fromFirestore(
      DocumentSnapshot<Map<String, dynamic>> snapshot,
      SnapshotOptions? options,
      ) {
    final data = snapshot.data();
    return Game.thatExist(
      id: data?['id'],
      nom: data?['nom'],
      editeur: data?['editeur'],
      prix: data?['prix'],
      image: data?['image'],
      description: data?['description'],
    );
  }

  Map<String, dynamic> toFirestore() {
    return {
      if(id != null) "id": id,
      if(nom != null) "nom": nom,
      if(editeur != null) "editeur": editeur,
      if(prix != null) "prix": prix,
      if(image != null) "image": image,
      if(description != null) "description": description,
    };
  }
}