import 'package:flutter/material.dart';
import '../controller/product_controller.dart';
import '../models/product_model.dart';

class SearchProductView extends StatefulWidget {
  const SearchProductView({super.key});

  @override
  State<SearchProductView> createState() => _SearchProductViewState();
}

class _SearchProductViewState extends State<SearchProductView> {
  final TextEditingController searchController = TextEditingController();
  final ProductController controller = ProductController();

  List<ProductModel> products = [];
  bool isLoading = false;

  Future<void> handleSearch(String keyword) async {
    setState(() {
      isLoading = true;
    });

    final result = await controller.searchProducts(keyword);

    setState(() {
      products = result;
      isLoading = false;
    });
  }

  @override
  void initState() {
    super.initState();
    handleSearch('');
  }

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Search API')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: searchController,
              onChanged: handleSearch,
              decoration: const InputDecoration(
                labelText: 'Nhập từ khóa',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            if (isLoading)
              const CircularProgressIndicator()
            else
              Expanded(
                child: ListView.builder(
                  itemCount: products.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(products[index].name),
                    );
                  },
                ),
              ),
          ],
        ),
      ),
    );
  }
}