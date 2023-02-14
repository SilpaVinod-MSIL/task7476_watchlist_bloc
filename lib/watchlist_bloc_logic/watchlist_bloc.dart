import '../api_details/Watchlist_response.dart';
import '../api_details/watchlistrseponsemodel.dart';
import '../constants/constants.dart';
import 'watchlist_event.dart';
import 'watchlist_state.dart';
import 'package:bloc/bloc.dart';

class WatchlistFetchBloc extends Bloc<WatchlistEvent,WatchlistState>{
  late List<WatchlistData> watchlistFetchData;
  WatchlistResponse watchlistResponse=WatchlistResponse();
  WatchlistFetchBloc():super(WatchlistInitial()){
    on<WatchlistEvent>((event,emit) async{
      if(event is FetchWatchlistData){
        watchlistFetchData = await watchlistResponse.fetchWatchlistData();
        if(watchlistFetchData.isEmpty){
          emit(WatchlistFetchError(errormessage: AppConstants.noData));
        }else{
          emit(WatchlistFetchData(watchlistFetchData: watchlistFetchData));
        }

      }
    });

  }

}