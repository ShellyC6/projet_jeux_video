//import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../services/like_button/like_bloc.dart';
import '../services/wish_button/wish_bloc.dart';
import '/app_colors.dart';
import '/widgets/apercu.dart';

class JeuPage extends StatefulWidget {
  const JeuPage({super.key});

  @override
  State<JeuPage> createState() => _JeuPageState();
}

class _JeuPageState extends State<JeuPage> {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<LikeBloc>(
          create: (context) => LikeBloc(),
        ),
        BlocProvider<WishBloc>(
          create: (context) => WishBloc(),
        ),
      ],
      child: Scaffold(
          appBar: AppBar(
            backgroundColor: AppColors.bgColor,
            title: Text(
              'Détail du jeu',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            actions: <Widget>[
              BlocBuilder<LikeBloc, LikeState>(
                builder: (context, state) => IconButton(
                  onPressed: (){
                    print("Bouton Like");
                    context.read<LikeBloc>().add(LikeClickEvent());
                  },
                  icon: (state as LikeInitialState).isLiked
                      ? SvgPicture.asset("res/svg/like_full.svg")
                      : SvgPicture.asset("res/svg/like.svg"),
                ),
              ),
              BlocBuilder<WishBloc, WishState>(
                builder: (context, state) => IconButton(
                  onPressed: (){
                    print("Bouton WishList");
                    context.read<WishBloc>().add(WishClickEvent());
                  },
                  icon: (state as WishInitialState).isWished
                      ? SvgPicture.asset("res/svg/whishlist_full.svg")
                      : SvgPicture.asset("res/svg/whishlist.svg"),
                ),
              ),
            ],
          ),
          body: Stack(
            alignment: AlignmentDirectional.topCenter,
            children: <Widget>[
              Image.asset(
                "res/img/fond.png",
                width: double.infinity,
                fit: BoxFit.cover,
              ),
              Column(
                children: <Widget>[
                  const Padding(
                    padding: EdgeInsets.only(left:20, right: 20, top:250),
                    child: Apercu(detail: false),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left:10, right: 10, top:20),
                    child : Column(
                      //crossAxisAlignment: CrossAxisAlignment.start,
                      //mainAxisAlignment: MainAxisAlignment.start,
                      children : <Widget>[
                        ClipRRect(
                          borderRadius: BorderRadius.circular(3),
                          child: Row(
                            children: <Widget>[
                              Flexible(
                                child : Stack(
                                  children: <Widget>[
                                    Positioned.fill(
                                      child: Container(
                                        decoration: const BoxDecoration(
                                          color: AppColors.accentColor,
                                        ),
                                      ),
                                    ),
                                    TextButton(
                                      onPressed: (){
                                        print("Bouton Description");
                                      },
                                      style: TextButton.styleFrom(
                                        textStyle: Theme.of(context).textTheme.bodyLarge,
                                        foregroundColor: AppColors.textColor,
                                      ),
                                      child: const Center(
                                        child: Text("DESCRIPTION"),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Flexible(
                                child : SizedBox(
                                  width: double.infinity,
                                  height: 48,
                                  child : TextButton(
                                    onPressed: (){
                                      print("Bouton Avis");
                                    },
                                    style: TextButton.styleFrom(
                                      //minimumSize: const Size.fromHeight(60),
                                        textStyle: Theme.of(context).textTheme.bodyLarge,
                                        foregroundColor: AppColors.textColor,
                                        side: const BorderSide(width: 2, color: AppColors.accentColor),
                                        shape: const RoundedRectangleBorder(
                                            borderRadius: BorderRadius.all(Radius.zero))
                                    ),
                                    child: const Text("AVIS"),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 20),
                        const Text("test really Le lorem ipsum est, en imprimerie, une suite de mots sans signification utilisée à titre provisoire pour calibrer une mise en page, le texte définitif venant remplacer le faux-texte dès qu'il est prêt ou que la mise en page est achevée."),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          )
      ),
    );
  }
}