import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '/app_colors.dart';
import '/widgets/search_bar.dart';
import '/widgets/apercu.dart';
import '/widgets/pub.dart';

class AccueilPage extends StatefulWidget {
  const AccueilPage({super.key});

  @override
  State<AccueilPage> createState() => _AccueilPageState();
}

class _AccueilPageState extends State<AccueilPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.bgColor,
        title: Text(
          'Accueil',
          style: Theme.of(context).textTheme.titleMedium,
        ),
        actions: <Widget>[
          IconButton(
              onPressed: (){
                print("Bouton Like");
              },
              icon: SvgPicture.asset("res/svg/like.svg"),
          ),
          IconButton(
            onPressed: (){
              print("Bouton WishList");
            },
            icon: SvgPicture.asset("res/svg/whishlist.svg"),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.only(left:10, bottom: 10, right: 10, top:10),
        child: Column(
          children: <Widget>[
            const SearchBar(text: "Rechercher un jeu..."),
            const SizedBox(height: 10),
            const Pub(),
            const SizedBox(height: 30),
            Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children:  const [
                  Text(
                    "Les meilleures ventes",
                    style: TextStyle(
                      fontSize: 15,
                      fontFamily: "Proxima Nova",
                      color: AppColors.textColor,
                      decoration: TextDecoration.underline,
                    ),
                    textAlign: TextAlign.left,
                  ),
                ]
            ),
            const SizedBox(height: 10),
            Apercu(),
            const SizedBox(height: 10),
            Apercu(),
            const SizedBox(height: 10),
            Apercu(),
          ]
        ),
      ),
    );
  }
}