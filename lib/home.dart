
import 'package:flutter/material.dart';
import 'package:flutter_application_1/model/product_model.dart';
import 'package:flutter_application_1/product-details.dart';
import 'package:flutter_application_1/product_list.dart';
import 'package:flutter_application_1/services/api_services.dart';

 class HomeScreen extends StatefulWidget {
  
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  late Future<List<Product>> _product;
  List<Product> _searchedProduct = [];
  List<Product> _allProducts =[];
  TextEditingController _searchController = TextEditingController();


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _product = ApiServices().getAllProducts();
    _searchController.addListener(_searchProduct);
  }

  void _searchProduct(){
    setState(() {
      if(_searchController.text.isEmpty){
        _searchedProduct = _allProducts;
      }
      else{
        _searchedProduct = _allProducts.where(
          (product) => product.name.toLowerCase().contains(_searchController.text.toLowerCase()) 
          ).toList();
      }
    });

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Products"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: FutureBuilder<List<Product>>(
          future: _product, 
          builder: (context, snapshot){
          if(snapshot.connectionState == ConnectionState.waiting){
            return CircularProgressIndicator();
          }
          if(snapshot.hasError){
            return Text("Error... : ${snapshot.error}");
          }
          final products = snapshot.data!;
        
          if(_allProducts.isEmpty){
            _allProducts = products;
            _searchedProduct = products;
        
          }
        
          return CustomScrollView(
            slivers: [
              SliverAppBar(
                floating: true,
                snap: true,
                pinned: true,
                expandedHeight: 100,
                automaticallyImplyLeading: false,
                flexibleSpace: Padding(
                  padding: EdgeInsets.all(10),
                  child: TextField(
                    controller: _searchController,
                    decoration: InputDecoration(
                      hintText: "Search Products...",
                      border: OutlineInputBorder(),
                    ),
                  ),
                  ),
                
              ),
        
              SliverToBoxAdapter(
                child: ProductList(products: _searchedProduct),
              )
        
        
            ],
          );
        }),
      ),
    );
  }
}