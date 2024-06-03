import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:swaan_app/domain/repository/home_page_repository.dart';
import 'package:swaan_app/presentation/bloc/bloc/home_bloc_event.dart';
import 'package:swaan_app/presentation/bloc/bloc/home_bloc_state.dart';
import 'package:swaan_app/data/model/fetch_data_model.dart'; // Import the necessary model
import 'package:swaan_app/data/model/user_session.dart'; // Import necessary classes if not imported

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final HomeRepository homeRepository;

    HomeBloc({required this.homeRepository}) : super(HomeInitial()) {
    on<FetchData>(_onFetchData);
  }

  void _onFetchData(FetchData event, Emitter<HomeState> emit) async {
    emit(HomeLoading());

    try {
      final response = await homeRepository.fetchData(UserSession.instance.id, UserSession.instance.token);
      print('Fetch Data Response: $response');

      final fetchDataModel = FetchDataModel.fromJson(response);

      final banners = fetchDataModel.banners;
      final recentViews = fetchDataModel.recentViews;
      final ourProducts = fetchDataModel.ourProducts;
      final suggestedProducts = fetchDataModel.suggestedProducts;
      final bestSeller = fetchDataModel.bestSeller;
      final flashSale = fetchDataModel.flashSale;
      final categories = fetchDataModel.categories;
      final topAccessories = fetchDataModel.topAccessories;
      final featuredBrands = fetchDataModel.featuredBrands;

      final homeData = HomeData(
        banners: banners,
        recentViews: recentViews,
        ourProducts: ourProducts,
        suggestedProducts: suggestedProducts,
        bestSeller: bestSeller,
        flashSale: flashSale,
        categories: categories,
        topAccessories: topAccessories,
        featuredBrands: featuredBrands,
        cartCount: fetchDataModel.cartCount,
        wishlistCount: fetchDataModel.wishlistCount,
        currency: fetchDataModel.currency,
        notificationCount: fetchDataModel.notificationCount,
      );

      emit(HomeLoaded(data: homeData));
    } catch (e) {
      print('Fetch Data error: $e');
      emit(HomeError(error: e.toString()));
    }
  }
}
