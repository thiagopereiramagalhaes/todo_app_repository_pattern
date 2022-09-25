import 'package:dio/dio.dart';

import '../models/todo_model.dart';

class TodoRepository {
  late Dio dio;
  final url = 'https://jsonplaceholder.typicode.com/todos';

/*
Nos construtores é possível incluir parâmetros nomeados e parâmetros posicionais.
Os parâmetros nomeados estão entre chaves. Os parâmetros posicionais estão entre colchetes.
Dê uma pesquisada qual é a diferença na prática, essas informações vão te ajudar.
*/
  TodoRepository([Dio? client]) {
    dio = client ?? Dio();
  }

  Future<List<TodoModel>> fetchTodos() async {
    final response = await dio.get(url);
    final list = response.data as List;

    List<TodoModel> todos = [];
    for (var json in list) {
      final todo = TodoModel.fromJson(json);
      todos.add(todo);
    }

    return todos;
  }
}
