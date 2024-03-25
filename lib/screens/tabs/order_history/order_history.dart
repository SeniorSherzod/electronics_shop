// import 'package:flutter/material.dart';
//
// class OrderHistory extends StatefulWidget {
//   const OrderHistory({super.key});
//
//   @override
//   State<OrderHistory> createState() => _OrderHistoryState();
// }
//
// class _OrderHistoryState extends State<OrderHistory> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Order history"),
//       ),
//       body: StreamBuilder<List<CategoryModel>>(
//         stream: context.read<CategoriesViewModel>().listenCategories(),
//         builder: (context, snapshot) {
//           if (snapshot.hasError) {
//             return Center(
//               child: Text(snapshot.error.toString()),
//             );
//           }
//           if (snapshot.hasData) {
//             List<CategoryModel> list = snapshot.data as List<CategoryModel>;
//             return ListView(
//               children: [
//                 ...List.generate(
//                   list.length,
//                       (index) {
//                     CategoryModel category = list[index];
//                     return ListTile(
//                       leading: Image.network(
//                         category.imageUrl,
//                         width: 50,
//                       ),
//                       title: Text(category.categoryName),
//                       subtitle: Text(category.docId),
//                       trailing: SizedBox(
//                         width: 100,
//                         child: Row(
//                           children: [
//                             IconButton(
//                               onPressed: () {
//                                 context
//                                     .read<CategoriesViewModel>()
//                                     .deleteCategory(category.docId, context);
//                               },
//                               icon: const Icon(Icons.delete),
//                             ),
//                             IconButton(
//                               onPressed: () {
//                                 context
//                                     .read<CategoriesViewModel>()
//                                     .updateCategory(
//                                   CategoryModel(
//                                     imageUrl:
//                                     "https://dnr.wisconsin.gov/sites/default/files/feature-images/ECycle_Promotion_Manufacturers.jpg",
//                                     categoryName: "Electronics",
//                                     docId: category.docId,
//                                   ),
//                                   context,
//                                 );
//                               },
//                               icon: const Icon(Icons.edit),
//                             ),
//                           ],
//                         ),
//                       ),
//                     );
//                   },
//                 ),
//               ],
//             );
//           }
//           return const Center(
//             child: CircularProgressIndicator(),
//           );
//         },
//       ),,
//     );
//   }
// }
