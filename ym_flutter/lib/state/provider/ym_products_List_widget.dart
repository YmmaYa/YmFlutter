

import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:ym_flutter/state/provider/ym_cart_product_model.dart';
import 'package:ym_flutter/state/provider/ym_provider_cart_model.dart';
import 'package:ym_flutter/tool/ym_style.dart';

class YmProductsListWidget extends StatefulWidget{
  const YmProductsListWidget({super.key});
  @override
  State<YmProductsListWidget> createState() => _YmProductsListWidgetState();
}
class _YmProductsListWidgetState extends State<YmProductsListWidget> with YmStyle{
  @override
  void initState() {
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    // 商品数据（硬编码或从API获取）
    final List<YmCartProductModel> itemsList = getProductList();
    return Consumer<YmProviderCartModel>(
      builder: (context, cart, child) {
          return Expanded(
            child: ListView.builder(
              padding: EdgeInsets.zero,
              itemCount: itemsList.length,
              itemBuilder: (context, index) {
                YmCartProductModel product = itemsList[index];
                return Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(width: w(20),),
                    Image.asset(
                        product.imgPath, width: w(70), height: w(70),fit: BoxFit.cover,),
                    SizedBox(width: w(20),),
                    Text(product.name, style: ts(s: 28, c: const Color(
                        0xFF000000),)),
                    product.addCount < 1
                        ? GestureDetector(
                        onTap: () {
                          product.addCount =1;
                          cart.add(product);
                        },
                        child: Text('添加', style: ts(
                          s: 28, c: const Color(0xFF005900),))
                    )
                        : Text(
                        '已添加', style: ts(s: 28, c: const Color(
                        0xFFFF0000),)),
                  ],
                );
              }
           )
          );
        }
    );
  }

   List<YmCartProductModel> getProductList(){
     YmCartProductModel product1 = YmCartProductModel(id: "1",imgPath: 'assets/products/beizi.jpg',name: "杯子杯子杯子",price: 13.6,count: 5);
     YmCartProductModel product2 = YmCartProductModel(id: "2",imgPath: 'assets/products/guojiu.jpeg',name: "果酒果酒果酒",price: 63.6,count: 5);
     YmCartProductModel product3 = YmCartProductModel(id: "1",imgPath: 'assets/products/jiu.png',name: "酒 酒 酒",price: 93.6,count: 5);
     YmCartProductModel product4 = YmCartProductModel(id: "1",imgPath: 'assets/products/xiangshui.jpeg',name: "香水香水香水",price: 193.6,count: 5);
     YmCartProductModel product5 = YmCartProductModel(id: "1",imgPath: 'assets/products/xishouye.jpeg',name: "洗手液洗手液洗手液",price: 13.6,count: 5);
     YmCartProductModel product6 = YmCartProductModel(id: "1",imgPath: 'assets/products/zhazhiji.jpeg',name: "榨汁机榨汁机榨汁机",price: 13.6,count: 5);

     return [product1,product2,product3,product4,product5,product6];
   }

}




