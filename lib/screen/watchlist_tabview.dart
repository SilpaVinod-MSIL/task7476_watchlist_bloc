import 'package:flutter/material.dart';
import 'package:task7476_watchlist_bloc/screen/navigation_screen.dart';
import '../api_details/watchlistrseponsemodel.dart';


class WatchlistTabview extends StatefulWidget {
  List<WatchlistData> data;
  WatchlistTabview({Key? key, required this.data}) : super(key: key);

  @override
  State<WatchlistTabview> createState() => _WatchlistTabviewState(data);
}

class _WatchlistTabviewState extends State<WatchlistTabview> {
  List<WatchlistData> data;
  _WatchlistTabviewState(this.data);

    @override
    Widget build(BuildContext context) {
      return ListView.builder(
      itemCount: data.length,
      itemBuilder: (_, index) {
      return Container(width: 300,height: 140,padding: EdgeInsets.all(5),
        child: Card(shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15)
        ),
        elevation: 2,
        color:Colors.grey,
        child: ListTile(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => WatchlistNavigation(data:data[index].name.toString())),
                      );},
                            title: showData(data[index].name.toUpperCase(),16,FontWeight.bold,Colors.black),
                            subtitle: Padding(
                              padding: const EdgeInsets.fromLTRB(0, 8, 0, 0),
                              child: showData(data[index].contacts,13,FontWeight.bold,Colors.black),
                            ),
                            trailing: Padding(
                              padding: const EdgeInsets.fromLTRB(0, 15, 0, 0),
                              child: CircleAvatar(
                                radius: 25,
                                backgroundImage: NetworkImage(data[index].url),
                                backgroundColor: Colors.greenAccent,
                              ),
                            )),

                      ),
      );

                });
    }
  }


showData(String textData, double size,FontWeight weight,Color col) {
  return Text(
    textData,
    style: TextStyle(fontSize: size, fontWeight: weight,color: col),
  );
}

  watchlistTabs(String tabText) {
    return Tab(
      text: tabText,
    );
  }

