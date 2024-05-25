import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluttertodoapp/src/models/todo_model.dart';
import 'package:fluttertodoapp/src/provider/app_providers.dart';

import '../service/firebase_service/firestore.dart';

final todoListProvider = StateNotifierProvider((ref){

  var firestore = ref.read(fireStoreProvider);


  return ListNotifier(firestore,[]);


});



class ListNotifier extends StateNotifier<List<Todo>>{
  FireStoreManager fireStoreManager;
  ListNotifier(this.fireStoreManager,super.state);


  void

  void pushTodo({required Todo todo})
  async{
    await fireStoreManager.createTodo(todo: todo);
  }


  void getList(){
    state = [];
  }


  void deleteItem(int index){
    var list=state;
    list.removeAt(index);
    state = list;
  }



}