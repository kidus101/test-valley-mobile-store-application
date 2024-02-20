import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../data/repository/banner_repository.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  BannerRepository bannerRepository;
  HomeBloc(this.bannerRepository) : super(HomeInitial()) {
    on<HomeEvent>((event, emit) {
      // TODO: implement event handler
    });

    on<GetBanners>((event, emit) async {
      emit(HomeLoading());
      try {
        final  response = await bannerRepository.getBanners();
        final mainShortCuts = await bannerRepository.getMainShortCuts();
        final items = await bannerRepository.getItems();
        emit(HomeLoaded(response, mainShortCuts,items));
      } catch (e) {
        emit(HomeError(e.toString()));
      }
    });
  }
}
