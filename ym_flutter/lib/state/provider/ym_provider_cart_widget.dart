

import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:ym_flutter/state/provider/ym_cart_product_model.dart';
import 'package:ym_flutter/state/provider/ym_provider_cart_model.dart';
import 'package:ym_flutter/tool/ym_style.dart';

class YmProviderCartWidget extends StatefulWidget{
  const YmProviderCartWidget({super.key});
  @override
  State<YmProviderCartWidget> createState() => _YmProviderCartWidgetState();
}
class _YmProviderCartWidgetState extends State<YmProviderCartWidget> with YmStyle{
  @override
  Widget build(BuildContext context) {
    return Consumer<YmProviderCartModel>(
      builder: (context, cart, child) {
        return Column(
          mainAxisSize: MainAxisSize.min, // S
          children: [
            Flexible(
              fit: FlexFit.loose, //
              child: ListView.builder(
                  shrinkWrap: true,
                  physics: const ClampingScrollPhysics(), // Disables over-scroll
                padding: EdgeInsets.zero,
                itemCount: cart.items.length,
                itemBuilder: (context, index) {
                  YmCartProductModel product = cart.items[index];
                  return Padding(
                      padding: EdgeInsets.symmetric(vertical: h(10)), // Adds spacing between items
                  child:Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(width: w(20),),
                        Image.asset(
                          product.imgPath, width: w(70), height: w(70),fit: BoxFit.cover,),
                        SizedBox(width: w(20),),
                        Text(product.name, style: ts(s: 28, c: const Color(
                            0xFF000000),)),
                        SizedBox(width: w(20),),
                        Text('${product.price}元', style: ts(s: 28, c: const Color(
                            0xFF000000),)),
                      ]
                  ));
                }
              )
            ),
            Text('总计:${cart.getTotalPrice()}元', style: ts(s: 32, c: const Color(0xFF000000),)),
          ]
        );
      }
    );
  }
}




