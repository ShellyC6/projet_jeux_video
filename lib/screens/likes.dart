import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../services/user/user_bloc.dart';
import '/app_colors.dart';
import '/widgets/search_bar.dart';
import '/widgets/apercu.dart';

class LikesPage extends StatefulWidget {
  const LikesPage({super.key});

  @override
  State<LikesPage> createState() => _LikesPageState();
}

class _LikesPageState extends State<LikesPage> {
  final db = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.bgColor,
        leading: IconButton(
          onPressed: (){
            print("Bouton Close");
            Navigator.of(context).pop();
          },
          icon: SvgPicture.asset("res/svg/close.svg"),
        ),
        title: Text(
          'Mes likes',
          style: Theme.of(context).textTheme.titleMedium,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left:10, bottom: 10, right: 10, top:10),
        child: BlocBuilder<UserBloc, UserState>(
          builder: (context, state) => StreamBuilder(
              stream: db.collection("Users")
                  .where("mail", isEqualTo: state.currentUser.email)
                  .snapshots(),
              builder: (context, snapshot){
                if(!snapshot.hasData) return const Text("Chargement du jeu en cours...");
                return Flexible(
                  child: ListView.separated(
                    scrollDirection: Axis.vertical,
                    itemCount: snapshot.data?.docs.first.get("likes").length ?? 0,
                    itemBuilder: (BuildContext context, int index){
                      return Apercu(detail: true, id: snapshot.data?.docs.first.get("likes")[index]);
                    },
                    separatorBuilder: (BuildContext context, int index) => const Divider(color: AppColors.bgColor,),
                  ),
                );
              }
          )
        ),
      ),
    );
  }
}