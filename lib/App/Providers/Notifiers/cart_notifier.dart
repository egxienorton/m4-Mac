

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:xiphone/App/Models/Product.dart';

final cartStateNotifierProvider = StateNotifierProvider<CartStateNotifier, List<Product>>((ref) {
    return CartStateNotifier();
});
final stringStateNotifierProvider = StateNotifierProvider<StringStateNotifier, String>((ref) {
    return StringStateNotifier();
});

class CartStateNotifier extends StateNotifier<List<Product>> {

    CartStateNotifier():super([]);

    void addProduct(){

    }   
    

}
class StringStateNotifier extends StateNotifier<String> {

    StringStateNotifier():super('');

    int number = 34;

    void transform(){
        state = 'hello ';
    }   

    void showNumber (){
        number++;
        state = 'You clicked the number ${number} times';
    }
    

}