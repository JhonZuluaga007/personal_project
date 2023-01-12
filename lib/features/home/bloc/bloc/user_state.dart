// part of 'user_bloc.dart';

// class UserState {
//   final User userData;
//   final RequestStatus status;
//   final String message;
//   final Cellphone? cellphoneTest;
//   final Addresses? addresses;
//   final Updated? updatedTest;
//   UserState(
      // {userData,
      // this.cellphoneTest,
      // this.updatedTest,
      // this.addresses,
      // this.status = RequestStatus.noSubmitted,
      // this.message = 'Request does not start yet'})
      // : userData = userData ??
      //       User(
      //         id: '',
      //         acceptsTerms: true,
      //         addresses: addresses!,
      //         cellphone: cellphoneTest!,
      //         dateOfBirth: '',
      //         email: '',
      //         firstLogin: false,
      //         informationUpdated: false,
      //         isActive: true,
      //         isConfirmed: true,
      //         lastname: '',
      //         loginId: '',
      //         middleName: cellphoneTest,
      //         name: '',
      //         participantId: cellphoneTest,
      //         password: '',
      //         passwordReset: false,
      //         projects: [],
      //         updated: updatedTest!,
//             );

//   UserState.getFailed(String messageException, this.cellphoneTest,
//       this.addresses, this.updatedTest)
//       : userData = User(
//           id: '',
//           acceptsTerms: true,
//           addresses: addresses!,
//           cellphone: cellphoneTest!,
//           dateOfBirth: '',
//           email: '',
//           firstLogin: false,
//           informationUpdated: false,
//           isActive: true,
//           isConfirmed: true,
//           lastname: '',
//           loginId: '',
//           middleName: cellphoneTest,
//           name: '',
//           participantId: cellphoneTest,
//           password: '',
//           passwordReset: false,
//           projects: [],
//           updated: updatedTest!,
//         ),
//         status = RequestStatus.failed,
//         message = messageException;

//   UserState.getSuccess(User userDataBackend, this.cellphoneTest, this.addresses,
//       this.updatedTest)
//       : userData = userDataBackend,
//         status = RequestStatus.success,
//         message = 'Success request';

//   UserState.inProgress(this.cellphoneTest, this.addresses, this.updatedTest)
//       : userData = User(
//           id: '',
//           acceptsTerms: true,
//           addresses: addresses!,
//           cellphone: cellphoneTest!,
//           dateOfBirth: '',
//           email: '',
//           firstLogin: false,
//           informationUpdated: false,
//           isActive: true,
//           isConfirmed: true,
//           lastname: '',
//           loginId: '',
//           middleName: cellphoneTest,
//           name: '',
//           participantId: cellphoneTest,
//           password: '',
//           passwordReset: false,
//           projects: [],
//           updated: updatedTest!,
//         ),
//         status = RequestStatus.inProgress,
//         message = 'In progress';
// }
