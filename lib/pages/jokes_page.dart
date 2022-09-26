import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart';
import 'package:jokes_apart/models/joke_response_model.dart';
import 'package:jokes_apart/provider/jokes_provider.dart';
import 'package:provider/provider.dart';

class JokesPage extends StatefulWidget {
  const JokesPage({Key? key}) : super(key: key);

  @override
  State<JokesPage> createState() => _JokesPageState();
}

class _JokesPageState extends State<JokesPage> {
  bool loading=false;

  @override
  void initState() {
    final jokeProvider=Provider.of<JokesProvider>(context,listen: false);
    getJokes(JokesProvider());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final jokeProvider=Provider.of<JokesProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Jokes'
        ),
      ),
      body: loading? Center(
        child: CircularProgressIndicator())
          : jokeProvider.jokesList.isNotEmpty?
      ListView.builder(
        shrinkWrap: true,
          physics: const ClampingScrollPhysics(),
          itemCount: jokeProvider.jokesList.length,
          itemBuilder:(context,index){
            JokesModel jokes=jokeProvider.jokesList[index];
            return Card(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 8,vertical: 16),
                child: Row(
                  children: [
                    Text(jokes.id.toString())
                  ],
                ),
              ),
            );
            }
      )
      : Center(
        child: Text('No data found'
      )
)
      );
  }

  void getJokes(JokesProvider jokesProvider)async {
    setState((){
      loading =true;
    });
    await jokesProvider.getJokes();
      setState((){
        loading=false;
      });
    }

  }
