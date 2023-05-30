// import 'package:flutter/material.dart';
// import 'package:responsi/model/list_news_model.dart';
// import 'package:responsi/api_data_source.dart';

// class PageDetail extends StatelessWidget {
//   final int idUser;
//   const PageDetail({Key? key, required this.idUser}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Detail User $idUser'),
//       ),
//       body: _buildDetailUsersBody(),
//     );
//   }

//   Widget _buildDetailUsersBody() {
//     return Container(
//       child: FutureBuilder(
//         future: ApiDataSource.instance.loadDetailUser(idUser),
//         builder: (BuildContext context, AsyncSnapshot<dynamic>snapshot) {
//           if (snapshot.hasError) {
//             return _buildErrorSection();
//           }
//           if (snapshot.hasData) {
//             UserModel userModel = UserModel.fromJson(snapshot.data);
//             return _buildSuccessSection(userModel);
//           }
//           return _buildLoadingSection();
//         },
//       ),
//     );
//   }

//   Widget _buildErrorSection() {
//     return const Text("ERROR");
//   }

//   Widget _buildLoadingSection() {
//     return const Center(
//       child: CircularProgressIndicator(),
//     );
//   }

//   Widget _buildSuccessSection(UserModel users) {
//     final userData = users.data!;
//     return Container(
//       child: _buildItemUsers(userData),
//     );
//   }

//   Widget _buildItemUsers(Data userData) {
//     return Scaffold(
//       body: Center(
//         child: Column(
//           children: [
//             Container(
//               width: 100,
//               child: Image.network(userData.avatar!),
//             ),
//             const SizedBox(width: 20),
//             Text(
//                 userData.firstName! + " " + userData.lastName!
//             ),
//             Text(
//                 userData.email!
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
