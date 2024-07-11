import 'package:flutter/material.dart';
import 'package:sneaker_shop_app/models/shoe.dart';

class ShoeTile extends StatelessWidget {
 final Shoe shoe;
 void Function()? onTap;
  ShoeTile({super.key, required this.shoe, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(

      margin: const EdgeInsets.only(left: 25),
      width: 300,
      decoration: BoxDecoration(
        color: Colors.grey[100],
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(

        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [

          // shoe pic

          ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.asset(shoe.imagePath,
              height: 200,
              width: 200,
              fit: BoxFit.contain,
              ),
            ),


          // description
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            child: Text(
              shoe.description,
            style: TextStyle(
              color:Colors.grey[600],
             ),
              textAlign: TextAlign.center,
            ),
          ),

          // price + details
          Padding(
            padding: const EdgeInsets.all(10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,

              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // shoe name
                    Text(shoe.name,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20
                      ),),

                    const SizedBox(height: 5,),

                    // price
                    Text(
                        'Ksh.${shoe.price}',
                      style: const TextStyle(color: Colors.grey),
                    )



                  ],
                ),
                // button to add to cart
                GestureDetector(
                  onTap: onTap ,
                  child: Container(
                      padding: const EdgeInsets.all(15),
                      decoration: const BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(12),
                          bottomRight: Radius.circular(12)
                        )
                      ),
                      child: const Icon(Icons.add,
                      color: Colors.white,)),
                )

              ],

            ),
          ),



        ],
      ),
    );
  }
}
