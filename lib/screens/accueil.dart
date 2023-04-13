import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:projet_jeux_video/screens/likes.dart';
import 'package:projet_jeux_video/screens/wishlist.dart';
import '../services/user/user_bloc.dart';
import '/app_colors.dart';
import '/widgets/search_bar.dart';
import '/widgets/apercu.dart';
import '/widgets/pub.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '/get_best_games.dart';

class AccueilPage extends StatefulWidget {
  AccueilPage({super.key,});

  //final List<int> gameIds = GetBestGames.getBestGames();

  @override
  State<AccueilPage> createState() => _AccueilPageState();
}

class _AccueilPageState extends State<AccueilPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.bgColor,
        leading: BlocBuilder<UserBloc, UserState>(
          builder: (context, state) => IconButton(
            onPressed: (){
              print("Bouton Logout");
              context.read<UserBloc>().add(const UserConnectEvent(name: "", email: ""));
              Navigator.popUntil(context, (Route<dynamic> predicate) => predicate.isFirst);
            },
            icon: const Icon(FontAwesomeIcons.rightFromBracket)
          ),
        ),
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
            FutureBuilder(
              future: GetBestGames.getBestGames(),
              builder: (context, snapshot){
                if(!snapshot.hasData) return const Text("Chargement du jeu en cours...");
                return Flexible(
                  child: ListView.separated(
                    scrollDirection: Axis.vertical,
                    //shrinkWrap: true,
                    itemCount: snapshot.data?.length ?? 0,
                    itemBuilder: (BuildContext context, int index){
                      return Apercu(detail: true, id: snapshot.data![index]);
                    },
                    separatorBuilder: (BuildContext context, int index) => const Divider(color: AppColors.bgColor,),
                  ),
                );
              }
            )
          ]
        ),
      ),
    );
  }
}