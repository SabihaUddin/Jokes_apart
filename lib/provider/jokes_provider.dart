import 'dart:io';
import 'package:flutter/material.dart';
import '../models/joke_response_model.dart';
import 'package:http/http.dart' as http;

class JokesProvider extends ChangeNotifier{
List<JokesModel> jokesList=[];
Future getJokes()async{
  try {
    http.Response response = await http.get(
        Uri.parse("https://official-joke-api.appspot.com/jokes/ten"),
    );
    if (response.statusCode == 200) {
      jokesList = countryModelFromJson(response.body);
      debugPrint(jokesList.length.toString());
    }
    notifyListeners();
  }on SocketException {
    debugPrint('No internet connection');

  }catch(e){
    debugPrint("error-$e");
  }

}


}