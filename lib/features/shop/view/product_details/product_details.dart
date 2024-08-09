import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:readmore/readmore.dart';
import 'package:store16/common/widgets/textos/section_headind.dart';
import 'package:store16/features/shop/model/product.dart';
import 'package:store16/features/shop/view/product_details/widgets/button_att_to_cart_widget.dart';
//import 'package:store16/features/shop/view/product_details/widgets/product_attributes.dart';
import 'package:store16/features/shop/view/product_details/widgets/product_image_slider.dart';
import 'package:store16/features/shop/view/product_details/widgets/product_metada.dart';
import 'package:store16/features/shop/view/product_details/widgets/rating_and_share.dart';
import 'package:store16/utils/constants/sizes.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ProductDetail extends StatefulWidget {
  final int productId;

  const ProductDetail({super.key, required this.productId});

  @override
  // ignore: library_private_types_in_public_api
  _ProductDetailState createState() => _ProductDetailState();
}

class _ProductDetailState extends State<ProductDetail> {
  late Product product;
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    fetchProductDetails();
  }

  Future<void> fetchProductDetails() async {
    final response = await http.get(Uri.parse('http://localhost:45103/api/Store/product/${widget.productId}'));

    if (response.statusCode == 200) {
      setState(() {
        product = Product.fromJson(json.decode(response.body));
        isLoading = false;
      });
    } else {
      throw Exception('Failed to load product details');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: const TButtonAddToCart(),
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : SingleChildScrollView(
              child: Column(
                children: [
                  // Imágenes del producto
                  TProductImageSlider(product: product),
                  // Detalles
                  Padding(
                    padding: const EdgeInsets.only(right: TSizes.defaultSpace, left: TSizes.defaultSpace, bottom: TSizes.defaultSpace),
                    child: Column(
                      children: [
                        // - Ratings
                        TRatingAndShare(product: product),
                        // - Precio
                        TProductMetaData(product: product),
                        // - Atributos
                        //TProductAttributes(product: product),
                        //const SizedBox(height: TSizes.spaceBtwSections),
                        // - Botón para Checkout
                        SizedBox(width: double.infinity, child: ElevatedButton(onPressed: (){}, child: const Text("Checkout"))),
                        const SizedBox(height: TSizes.spaceBtwSections),
                        // - Descripción
                        const TSectionHeading(title: "Descripción", showActionButton: false,),
                        const SizedBox(height: TSizes.spaceBtwItems),
                        ReadMoreText(
                          product.description,
                          trimLines: 2,
                          trimMode: TrimMode.Line,
                          trimCollapsedText: 'mas...',
                          trimExpandedText: ' mostrar menos',
                          moreStyle: const TextStyle(fontSize: 14, fontWeight: FontWeight.w800),
                          lessStyle: const TextStyle(fontSize: 14, fontWeight: FontWeight.w800),
                        ),
                        // - Reviews 
                        const Divider(),
                        const SizedBox(height: TSizes.spaceBtwItems),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            TSectionHeading(title: 'Reviews (51)', onPressed: (){}, showActionButton: false),
                            IconButton(onPressed: (){}, icon: const Icon(Iconsax.arrow_right_3))
                          ],
                        ),
                        const SizedBox(height: TSizes.spaceBtwItems),
                      ],
                    ),
                  )
                ],
              ),
            ),
    );
  }
}
