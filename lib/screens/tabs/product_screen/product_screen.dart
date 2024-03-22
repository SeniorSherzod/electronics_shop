import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../models/product_model.dart';
import '../../../view_models/product_view_model.dart';

class ProductsScreen extends StatefulWidget {
  const ProductsScreen({super.key});

  @override
  State<ProductsScreen> createState() => _ProductsScreenState();
}

class _ProductsScreenState extends State<ProductsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Products"),
        actions: [
          IconButton(
            onPressed: () {
              context.read<ProductsViewModel>().insertProducts(
                ProductModel(
                  price: 12.5,
                  imageUrl:
                  "https://i.ebayimg.com/images/g/IUMAAOSwZGBkTR-K/s-l400.png",
                  productName: "Nokia 12 80",
                  docId: "",
                  productDescription: "productDescription",
                  categoryId: "kcggCJzOEz7gH1LQy44x",
                ),
                context,
              );
            },
            icon: const Icon(Icons.add),
          ),
        ],
      ),
      body: StreamBuilder<List<ProductModel>>(
        stream: context.read<ProductsViewModel>().listenProducts(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Center(
              child: Text(snapshot.error.toString()),
            );
          }
          if (snapshot.hasData) {
            List<ProductModel> list = snapshot.data as List<ProductModel>;
            return ListView(
              children: [
                ...List.generate(
                  list.length,
                      (index) {
                    ProductModel product = list[index];
                    return ListTile(
                      leading: Image.network(
                        product.imageUrl,
                        width: 50,
                      ),
                      title: Text(product.productName),
                      subtitle: Text(product.docId),
                      trailing: SizedBox(
                        width: 100,
                        child: Row(
                          children: [
                            IconButton(
                              onPressed: () {
                                context
                                    .read<ProductsViewModel>()
                                    .deleteProduct(product.docId, context);
                              },
                              icon: const Icon(Icons.delete),
                            ),
                            IconButton(
                              onPressed: () {
                                context.read<ProductsViewModel>().updateProduct(
                                  ProductModel(
                                    price: product.price,
                                    imageUrl:
                                    "https://upload.wikimedia.org/wikipedia/commons/2/2c/NOKIA_1280.jpg",
                                    productName: "Galaxy",
                                    docId: product.docId,
                                    productDescription: "",
                                    categoryId: product.categoryId,
                                  ),
                                  context,
                                );
                              },
                              icon: const Icon(Icons.edit),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ],
            );
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}