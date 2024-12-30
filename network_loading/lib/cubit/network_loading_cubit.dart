import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'network_loading_state.dart';

class NetworkLoadingCubit extends Cubit<NetworkLoadingState> {
  NetworkLoadingCubit() : super(NetworkLoadingInitial());

  loading(){
    emit(NetworkLoadingInitial());
  }

  success(){
    List<String> list= [];

    for(int i = 1 ;i <= 10;i++){
      list.add("Item $i");
    }
    emit(NetworkSuccess(list));
  }

  error(){
    emit(NetworkFail("Connection time out, Error"));
  }
}
