import 'package:test/test.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

String userSearch = "sports";
Map<String, dynamic> posts = {};

void main() {
  test( 'API Test', () async
  {
    await grabPosts();
    for(int i = 0; i < posts["data"].length; i++)
    {
      print("${posts["data"][i]["title"]}: ${posts["data"][i]["url"]}");
    }
  }
  );
}

Future grabPosts() async
{
  posts = await goGetPosts();
}

Future<dynamic> goGetPosts() async
{
  String apiPostUrl = "https://api.giphy.com/v1/gifs/search?api_key=aKj4vQZcn3ME5T0ND8ks5ANbTsb8z5v0&q=$userSearch&limit=25&offset=0&rating=pg-13&lang=en&bundle=messaging_non_clips";
  var data = {};
  var response = await http.get(Uri.parse(apiPostUrl));
  if(response.statusCode == 200)
  {
    print("Got it");
    data = jsonDecode(response.body);
    print(data.runtimeType);
  }
  else
  {
    print("Dropped it");
  }
  return data;
}
