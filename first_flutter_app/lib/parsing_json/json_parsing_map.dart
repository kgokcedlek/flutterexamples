import 'dart:convert';
import 'package:first_flutter_app/model/Post.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

class JsonParsingMap extends StatefulWidget {
  @override
  _JsonParsingMapState createState() => _JsonParsingMapState();
}

class _JsonParsingMapState extends State<JsonParsingMap> {
  Future<PostList> data;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    Network network = Network("https://jsonplaceholder.typicode.com/posts");
    data = network.loadPosts();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("PODO"),
      ),
      body: Center(
        child: FutureBuilder(
          future: data,
          builder: (context, AsyncSnapshot<PostList> snapshot){
               List<Post> allPosts;
               if(snapshot.hasData){
                 allPosts = snapshot.data.posts;
                 //return Text("${allPosts[0].title}");
                 return createLisView(allPosts, context);
               }
               else{
                 return CircularProgressIndicator();
               }
        },) ,
      ),
    );
  }

  Widget createLisView(List<Post> data, BuildContext context) {
    return Container(
      child: ListView.builder(
          itemCount: data.length,
          itemBuilder: (context, int index){
            return Column(
              mainAxisAlignment:  MainAxisAlignment.center,
              children: <Widget>[
                Divider(height: 5.0,),
                ListTile(
                  title: Text("${data[index].title}"),
                  subtitle: Text("${data[index].body}"),
                  leading: Column(
                    children: <Widget>[
                      CircleAvatar(
                        backgroundColor: Colors.amber,
                        radius: 23,
                        child: Text("${data[index].userId}") ,
                      )
                    ],
                  ),
                )
              ],
            );
          }),
    );
  }
}


class Network{
  final String url;

  Network(this.url);

  Future <PostList> loadPosts() async{

    final response = await get(Uri.encodeFull(url));

    if(response.statusCode == 200){
     return PostList.fromJason(json.decode(response.body));
    }
    else{
      throw Exception("failed to get posts");
    }
  }
}
