import 'package:flutter/material.dart';
import 'package:task7476_watchlist_bloc/screen/watchlist_tabview.dart';
import '../api_details/watchlistrseponsemodel.dart';
import '../constants/constants.dart';
import '../watchlist_bloc_logic/watchlist_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../watchlist_bloc_logic/watchlist_event.dart';
import '../watchlist_bloc_logic/watchlist_state.dart';


class WatchlistDataUIStateless extends StatelessWidget {
  const WatchlistDataUIStateless({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home:WatchlistDataUI());
  }
}

class WatchlistDataUI extends StatefulWidget {
  const WatchlistDataUI({Key? key}) : super(key: key);

  @override
  State<WatchlistDataUI> createState() => _WatchlistDataUIState();
}

class _WatchlistDataUIState extends State<WatchlistDataUI> with SingleTickerProviderStateMixin{
  WatchlistFetchBloc watchlistFetchBloc = WatchlistFetchBloc();

  @override
  void initState() {
    watchlistFetchBloc.add(FetchWatchlistData());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => watchlistFetchBloc,
      child: DefaultTabController(
        length: 3,
        child: Scaffold(backgroundColor: Colors.green,
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
          body:BlocBuilder<WatchlistFetchBloc, WatchlistState>(
            builder: (context, state) {
              if (state is WatchlistInitial) {
                return Center(
                  child: Image.asset(AppConstants.imageUrl),);
              } else if (state is WatchlistFetchData) {
                List<WatchlistData> userList = state.watchlistFetchData;
                return TabBarView(
                  children: <Widget>[
                    WatchlistTabview(data: userList.sublist(0, 40)),
                    WatchlistTabview(data: userList.sublist(40, 80)),
                    WatchlistTabview(data: userList.sublist(80, 100
                    )),
                  ],
                );
              }else if(state is WatchlistFetchError){
                return noData(state.errorMessage);
              }
              else {
                return noData(AppConstants.errorOccur);
              }
            },
          ),),),
    );

  }

  noData(String dataText){
     return Center(
      child: Text(dataText),
    );
  }
}
