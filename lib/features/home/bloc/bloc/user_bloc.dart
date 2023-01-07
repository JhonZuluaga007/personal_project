// import 'package:bloc/bloc.dart';
// import 'package:meta/meta.dart';
// import 'package:personal_project/config/helpers/request.dart';
// import 'package:personal_project/features/auth/data/data_source/auth_data_source.dart';
// import 'package:personal_project/features/auth/data/models/user_model.dart';

// part 'user_event.dart';
// part 'user_state.dart';

// class UserBloc extends Bloc<UserEvent, UserState> {
//   UserBloc({required this.userDataRepo}) : super(UserState()) {
//     on<GetUserData>();
//   }
//   final AuthDataSource userDataRepo;
//   Future<void> getUserData(GetUserData event, Emitter<UserState> emit) async {
//     emit(UserState.inProgress(, addresses, updatedTest));
//      try {
//       UserModel data= await userDataRepo.getUser('');
//       final userData = User.fromJson(data);

//       emit(UserState.getSuccess(userData));
//     } on Exception catch (e) {
//       emit(
//         UserState.getFailed(e.toString()),
//       );
//     }
//   }
// }

// // 