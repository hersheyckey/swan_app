import 'package:bloc/bloc.dart';
import 'package:swaan_app/domain/repository/login_repository.dart';
import 'package:swaan_app/presentation/bloc/login_bloc/login_bloc_event.dart';
import 'package:swaan_app/presentation/bloc/login_bloc/login_bloc_state.dart';
import 'package:swaan_app/data/model/user_session.dart'; // Import the UserSession class

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final LoginRepository loginRepository;

  LoginBloc({required this.loginRepository}) : super(LoginInitial()) {
    on<LoginSubmitted>(_onLoginSubmitted);
  }

  void _onLoginSubmitted(LoginSubmitted event, Emitter<LoginState> emit) async {
    emit(LoginLoading());

    try {
      final response = await loginRepository.login(event.email, event.password);
      print('Login Response: $response');

      if (response['success'] == 1) {
       
        UserSession.instance.id = response['customerdata']['id'];
        UserSession.instance.token = response['customerdata']['token'];
        emit(LoginSuccess());
      } else {
        print('Login failed with message: ${response['message']}');
        emit(LoginFailure());
      }
    } catch (e) {
      print('Login error: $e');
      emit(LoginFailure());
    }
  }
}
