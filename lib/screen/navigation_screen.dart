import 'package:flutter/material.dart';

import '../constants/constants.dart';

class WatchlistNavigation extends StatelessWidget {
  String name="";
  WatchlistNavigation({super.key, required String data}){
    name=data;
  }
  @override
  Widget build(BuildContext context) {
    return( Scaffold(appBar: AppBar(backgroundColor: Colors.greenAccent,title: Text(AppConstants.watchList),leading: GestureDetector(child: const Icon(Icons.arrow_back),onTap: () {
      Navigator.pop(context);
    }),),
      body:  Center(child: Text(name,style: const TextStyle(color: Colors.red,fontSize: 20,fontWeight: FontWeight.bold),)),

    ));
  }
}