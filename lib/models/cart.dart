import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:sneaker_shop_app/models/shoe.dart';

class Cart extends ChangeNotifier{

  // list of shoes for sale
  List<Shoe> shoeShop = [
    Shoe(
        name: 'Air Jordan 1',
        price: '3000',
        imagePath: 'lib/images/s1.png',
        description: 'Vintage red touch of the signature Jordan shoe'),

    Shoe(
        name: 'Nike AirForce 1',
        price: '2300',
        imagePath: 'lib/images/s2.png',
        description: 'One of the first Nike concept of sneakers. Never gets old ' ),

    Shoe(
        name: 'Vans Off the Wall',
        price: '1800',
        imagePath: 'lib/images/s3.png',
        description: 'Rock with the Old School Vans..never misses'),

    Shoe(
        name: 'Air Jordan 4',
        price: '4000',
        imagePath: 'lib/images/s4.png',
        description: 'Fly like the wasp, sting like a bee'),

    Shoe(
        name: 'Air Jordan 3',
        price: '4500',
        imagePath: 'lib/images/s5.png',
        description: 'Limited edition of the original J3s'),
  ];

  // list of items in the users cart

List<Shoe> userCart = [];

  // get list of shoes for sale

List<Shoe> getShoeList () {
  return shoeShop;
}

  // get cart

List<Shoe> getUserCart(){
  return userCart;
}

  // add items to cart
void addItemToCart(Shoe shoe){
  userCart.add(shoe);
  notifyListeners();
}
  // remove item from cart
void removeItemToCart(Shoe shoe){
  userCart.remove(shoe);
  notifyListeners();
}

}