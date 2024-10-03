import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:pixabay/modules/home/models/image_model.dart';
import 'package:pixabay/modules/home/repo/home_repo.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  final HomeRepo repo;
  HomeCubit(this.repo) : super(HomeInitial());

  List<ImageModel> images = [];
  fetch()async{
    try {
      emit(HomeLoading());
      var res = await repo.fetchImage(page: "1");
      if (res['status']== "ok") {
        var data = res['data'] as ImageList;
        images.addAll(data.images);
        emit(HomeLoaded(images:images));
      } else {
      emit(HomeLoadError(error: res['message']));
        
      }
    } catch (e) {
      emit(HomeLoadError(error: e.toString()));
    }
  }

 Future scrollFetch({required page})async{
  try {
    await repo.fetchImage(page: page).then((value){
      switch (value['status']){
        case "ok":
        var data = value['data'] as ImageList;
        images = images + data.images;
           emit(HomeLoaded(images: images));
           break;
         default:  
      }
    });
  } catch (e) {
      log(e.toString(), name: "scrollFetch");
    
  }
 }

}
