import 'package:flutter/material.dart';
import 'package:flutter_application_1/model/product_model.dart';
import 'package:flutter_application_1/product-details.dart';

class ProductList extends StatelessWidget {
  final List<Product> products;
  const ProductList({super.key, required this.products});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        childAspectRatio: 2/3
        ), 
      itemCount: products.length,
      itemBuilder: (context,index){
        final product = products[index];
        return GestureDetector(
          onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => ProductDetails(product: product,)));  
          },
          child: Card(
            elevation: 5,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10)
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //image
                Expanded(
                  child: ClipRRect(
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(10)
                    ),
                    child: Image.network(product.image,
                      fit: BoxFit.cover,
                      width: double.infinity,
                    )
                  ) 
                ),
                
                //name
                Padding(
                  padding: const EdgeInsets.only(top: 16,left: 10,bottom: 10),
                  child: Text(
                    product.name,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                ),
                //price....
                
                 Padding(
                  
                   padding: const EdgeInsets.only(left: 10,bottom: 10),
                   child: Text(
                    "\$ ${product.price}",
                    style: TextStyle(color: Colors.orange,fontWeight: FontWeight.bold),
                    ),
                 ),
              ],
            ),
          ),
        );
      }
      );
  }
}