import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:projet_jeux_video/screens/likes.dart';
import 'package:projet_jeux_video/screens/wishlist.dart';
import '/app_colors.dart';
import '/widgets/search_bar.dart';
import '/widgets/apercu.dart';
import '/widgets/pub.dart';
import '/user.dart';

class AccueilPage extends StatefulWidget {
  const AccueilPage({super.key, required this.currentUser});

  final User currentUser;

  @override
  State<AccueilPage> createState() => _AccueilPageState();
}

class _AccueilPageState extends State<AccueilPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.bgColor,
        automaticallyImplyLeading: false,
        title: Text(
          'Accueil',
          style: Theme.of(context).textTheme.titleMedium,
        ),
        actions: <Widget>[
          IconButton(
              onPressed: (){
                print("Bouton Like");
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (BuildContext context) => LikesPage()),
                );
              },
              icon: SvgPicture.asset("res/svg/like.svg"),
          ),
          IconButton(
            onPressed: (){
              print("Bouton WishList");
              Navigator.of(context).push(
                MaterialPageRoute(builder: (BuildContext context) => WishlistPage()),
              );
            },
            icon: SvgPicture.asset("res/svg/whishlist.svg"),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.only(left:10, bottom: 10, right: 10, top:10),
        child: Column(
          children: <Widget>[
            SearchBar(text: "Rechercher un jeu..."),
            const SizedBox(height: 10),
            const Pub(),
            const SizedBox(height: 30),
            Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children:  [
                  Text(
                    "Les meilleures ventes ${widget.currentUser.name} <--",
                    style: const TextStyle(
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
            Apercu(detail: true),
            const SizedBox(height: 10),
            Apercu(detail: true),
            const SizedBox(height: 10),
            Apercu(detail: true),
          ]
        ),
      ),
    );
  }
}