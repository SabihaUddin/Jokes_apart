import 'dart:convert';

List<Joke> jokeListFromJson(String str) => List<Joke>.from(json.decode(str).map((x) => Joke.fromJson(x)));

String jokeListToJson(List<Joke> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Joke {
    Joke({
        this.id,
        this.type,
        this.setup,
        this.punchline,
    });

    int? id;
    String? type;
    String? setup;
    String? punchline;

    factory Joke.fromJson(Map<String, dynamic> json) => Joke(
        id: json["id"],
        type: json["type"],
        setup: json["setup"],
        punchline: json["punchline"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "type": typeValues.reverse[type],
        "setup": setup,
        "punchline": punchline,
    };
}
