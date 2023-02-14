import 'package:flutter/material.dart';
import 'package:task7476_watchlist_bloc/screen/navigation_screen.dart';

import '../constants/constants.dart';
import 'watchlist_data.dart';

class WatchlistTabview extends StatelessWidget {
  const WatchlistTabview({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(backgroundColor: Colors.greenAccent,
            leading: const Icon(
              Icons.arrow_back,
              color: Colors.white,
            ),
            title: Text(AppConstants.watchList),
            bottom: TabBar(
              labelColor: Colors.blue,
              unselectedLabelColor: Colors.black,
              tabs: [
                watchlistTabs(AppConstants.contactOneTab),
                watchlistTabs(AppConstants.contactTwoTab),
                watchlistTabs(AppConstants.contactThreeTab),
              ],
            ),
          ),
          body:const TabBarView(children: [
            WatchlistDataUI(),
            WatchlistDataUI(),
            WatchlistDataUI(),

          ],),

          backgroundColor: Colors.grey,
        ),
      ),
    );
  }

  watchlistTabs(String tabText) {
    return Tab(
      text: tabText,
    );
  }
}
