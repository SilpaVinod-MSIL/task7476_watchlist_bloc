import 'package:flutter/material.dart';
import 'package:task7476_watchlist_bloc/screen/navigation_screen.dart';
import '../constants/constants.dart';
import '../watchlist_bloc_logic/watchlist_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../watchlist_bloc_logic/watchlist_event.dart';
import '../watchlist_bloc_logic/watchlist_state.dart';

class WatchlistDataUI extends StatefulWidget {
  const WatchlistDataUI({Key? key}) : super(key: key);

  @override
  State<WatchlistDataUI> createState() => _WatchlistDataUIState();
}

class _WatchlistDataUIState extends State<WatchlistDataUI> {
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
      child: BlocBuilder<WatchlistFetchBloc, WatchlistState>(
        builder: (context, state) {
          if (state is WatchlistInitial) {
            return Center(
              child: Image.asset(AppConstants.imageUrl),);
          } else if (state is WatchlistFetchData) {
            return ListView.builder(
                itemCount: state.watchlistFetchData.length,
                itemBuilder: (BuildContext cxt, int index) {
                  return Container(
                    width: 300,
                    height: 140,
                    padding: const EdgeInsets.all(5),
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      color: Colors.white,
                      elevation: 10,
                      child: ListTile(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => WatchlistNavigation(data:state.watchlistFetchData[index].name.toString())),
                    );},
                          title: showData(state.watchlistFetchData[index].name.toUpperCase(),16,FontWeight.bold,Colors.green),
                          subtitle: Padding(
                            padding: const EdgeInsets.fromLTRB(0, 8, 0, 0),
                            child: showData(state.watchlistFetchData[index].contacts,13,FontWeight.bold,Colors.grey),
                          ),
                          trailing: Padding(
                            padding: const EdgeInsets.fromLTRB(0, 15, 0, 0),
                            child: CircleAvatar(
                              radius: 25,
                              backgroundImage: NetworkImage(state.watchlistFetchData[index].url),
                              backgroundColor: Colors.greenAccent,
                            ),
                          )),

                    ),
                  );
                });
          }else if(state is WatchlistFetchError){
            return noData(state.errormessage);
          }
          else {
           return noData(AppConstants.errorOccur);
          }
        },
      ),
    );
  }

  showData(String textData, double size,FontWeight weight,Color col) {
    return Text(
      textData,
      style: TextStyle(fontSize: size, fontWeight: weight,color: col),
    );
  }

  noData(String dataText){
     return Center(
      child: Text(dataText),
    );
  }
}
