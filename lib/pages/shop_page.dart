import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sneaker_shop_app/models/shoe.dart';

import '../components/shoe_tile.dart';
import '../models/cart.dart';

class ShopPage extends StatefulWidget {
  const ShopPage({super.key});

  @override
  State<ShopPage> createState() => _ShopPageState();
}

class _ShopPageState extends State<ShopPage> {
  // add shoe to cart
  void addShoeToCart(Shoe shoe){
     Provider.of<Cart>(context, listen: false).addItemToCart(shoe);

     // alert the user shoe added successfully
      showDialog(

          context: context,
          builder: (context) => const AlertDialog(
            backgroundColor: Colors.green,

              title: Text("Successfully added",
              style: TextStyle(
                color: Colors.white
              ),),
              content: Text("Check you cart",
                  style: TextStyle(
                  color: Colors.white
              ),),
          ),
      );
  }





  @override
  Widget build(BuildContext context) {
    return Consumer<Cart>(builder: (context, value, child) =>
        Column(
          children: [
            // search bar
            Container(
              padding: const EdgeInsets.all(15),
              margin: const EdgeInsets.symmetric(horizontal: 25),
              decoration: BoxDecoration(color: Colors.grey[100], borderRadius: BorderRadius.circular(10)),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Search", style: TextStyle(color: Colors.grey),),
                  Icon(Icons.search, color: Colors.grey,),
                ],
              ),
            ),
            // message
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 15.0),
              child: Text("Look mom...I can fly",
                style: TextStyle(
                    color: Colors.grey[600]
                ),
              ),
            ),

            // hot picks
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child:  Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [

                  const Text("Hot Picks",
                    style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold
                    ),
                  ),
                  Text(
                    "See all",
                    style: TextStyle(
                        color: Colors.grey[700],
                        fontWeight: FontWeight.bold
                    ),)
                ],
              ),
            ),
            const SizedBox(height: 10,),


            // list of shoes for sale

            Expanded(
                child: ListView.builder(
                    itemCount: 5,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index){

                      // get a shoe from shop list
                      Shoe shoe = value.getShoeList()[index];

                      // return the shoe
                      return ShoeTile(
                        shoe: shoe,
                        onTap: () => addShoeToCart(shoe),

                      );
                    }
                )
            ),

            const Padding(
              padding: EdgeInsets.only(left: 25.0, top: 25, bottom: 25),
              child: Divider(
                color: Colors.white,
              ),
            )
          ],
        )
    );
  }
}
