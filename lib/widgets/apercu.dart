import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:projet_jeux_video/screens/jeu.dart';
import '/app_colors.dart';

class Apercu extends StatefulWidget {
  Apercu({super.key, required this.detail, required this.id,});

  final bool detail;
  final int id;

  @override
  State<Apercu> createState() => _ApercuState();
}

class _ApercuState extends State<Apercu> {
  final db = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(7),
        child: Stack(
          children : <Widget>[
            if(widget.detail)
              Image.asset(
                "res/img/apercu_recherche.png",
                width: double.infinity,
                height: 100,
                fit: BoxFit.cover,
              )
            else
              Image.asset(
                "res/img/apercu_description.png",
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            StreamBuilder(
              stream: db.collection("Games").where("id", isEqualTo: widget.id).snapshots(),
                builder: (context, snapshot) {
                  if(!snapshot.hasData) return const Text("Erreur lors du chargement du jeu");
                  return Row(
                    children: <Widget>[
                      Expanded(
                        child: Row(
                          children: <Widget>[
                            if(widget.detail)
                              Padding(
                                  padding: const EdgeInsets.only(left: 10, top: 5, bottom: 5, right: 10),
                                  child: Image.network(snapshot.data!.docs.first.get("image"),height: 80,)
                              )
                            else
                              Padding(
                                  padding: const EdgeInsets.only(left: 10, top: 20, bottom: 20, right: 10),
                                  child: Image.network(snapshot.data!.docs.first.get("image"),height: 80,)
                              ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  snapshot.data!.docs.first.get("nom") ?? "Erreur",
                                  style: Theme.of(context).textTheme.bodyLarge,
                                ),
                                const SizedBox(height: 5),
                                Text(
                                  snapshot.data!.docs.first.get("editeur") ?? "Erreur",
                                  style: Theme.of(context).textTheme.bodySmall,
                                ),
                                if(widget.detail)(const SizedBox(height: 10)),
                                if(widget.detail)(
                                    Text(
                                      "Prix : ${snapshot.data!.docs.first.get("prix")} €",
                                      style: const TextStyle(
                                        fontSize: 12,
                                        fontFamily: "Proxima Nova",
                                        color: AppColors.textColor,
                                        decoration: TextDecoration.underline,
                                      ),
                                    )
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      if(widget.detail)
                        SizedBox(
                          width: 100,
                          height: 100,
                          child: Stack(
                            children: <Widget>[
                              Positioned.fill(
                                child: Container(
                                  decoration: const BoxDecoration(
                                    color: AppColors.accentColor,
                                  ),
                                ),
                              ),
                              TextButton(
                                onPressed: () {
                                  print("Bouton En savoir plus");
                                  Navigator.of(context).push(
                                    MaterialPageRoute(builder: (BuildContext context) => JeuPage(id: widget.id)),
                                  );
                                },
                                style: TextButton.styleFrom(
                                  textStyle: const TextStyle(
                                    fontSize: 19,
                                    fontFamily: "Proxima Nova",
                                    color: AppColors.textColor,
                                  ),
                                  foregroundColor: AppColors.textColor,
                                ),
                                child: const Center(
                                  child: Text(
                                      textAlign: TextAlign.center, "En savoir plus"),
                                ),
                              ),
                            ],
                          ),
                        ),
                    ],
                  );
                },
            ),
        ],
      )
    );
  }
}