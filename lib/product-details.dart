import 'package:flutter/material.dart';
import 'package:flutter_application_1/model/product_model.dart';

class ProductDetails extends StatelessWidget {
  final Product product;
  const ProductDetails({super.key, required this.product, });
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Image.network(product.image,fit: BoxFit.cover,),
              SizedBox(height: 16,),
              Text(product.name,style: TextStyle(fontWeight: FontWeight.bold),),
              SizedBox(height: 10),
              Text("\$ ${product.price}",style: TextStyle(color: Colors.orange,fontWeight: FontWeight.bold),),
              SizedBox(height: 16),
              ElevatedButton(
                onPressed: (){}, 
                style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
                child: Text("Buy",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),))
            ],
          ),
        ),
      )
    );
  }
}