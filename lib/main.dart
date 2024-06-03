import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:swaan_app/domain/api_service/api_service.dart';
import 'package:swaan_app/domain/repository/home_page_repository.dart';
import 'package:swaan_app/domain/repository/login_repository.dart';
import 'package:swaan_app/presentation/bloc/bloc/home_bloc_bloc.dart';
import 'package:swaan_app/presentation/bloc/login_bloc/login_bloc_bloc.dart';
import 'package:swaan_app/presentation/screens/homepage.dart';
import 'package:swaan_app/presentation/screens/login/login_page.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ApiService apiService = ApiService();
    final LoginRepository loginRepository = LoginRepository(apiService: apiService);
    final HomeRepository homeRepository = HomeRepository(apiService: apiService);

    return MultiBlocProvider(
      providers: [
        BlocProvider<LoginBloc>(
          create: (context) => LoginBloc(loginRepository: loginRepository),
        ),
        BlocProvider<HomeBloc>(
          create: (context) => HomeBloc(homeRepository: homeRepository),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Swan App',
        theme: ThemeData(

        ),
        initialRoute: '/',
        routes: {
          '/': (context) => LoginPage(),
          '/home': (context) => const HomePage(),
        },
      ),
    );
  }
}
