

import 'package:first_flutter_app/model/movie.dart';
import 'package:first_flutter_app/model/question.dart';
import 'package:first_flutter_app/ui/movie_ui/movie_ui.dart';
import 'package:first_flutter_app/util/hexcolor.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
_tapButton(){
  debugPrint("alarm tapped!");
}
//movie application start.we  use ui codes in the movie_ui file
//firstly we wrote codes in movie_file to this home file. after for putting in order
//move all of this codes to movie_ui file.
class MovieListView extends StatelessWidget {
  final List<Movie> movieList= Movie.getMovies();
  final List movies = [
    "Titanic",
    "Blade Runner",
    "Rambo",
    "The Avengers",
    "Avatar",
    "I Am Legend",
    "300",
    "The Wolf of Wall Street",
    "Interstellar",
    "Game of Thrones",
    "Vikings"
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Movies"),
        backgroundColor: Colors.blueGrey.shade900,
      ),
      backgroundColor: Colors.blueGrey.shade900,
      body: ListView.builder(
        itemCount: movieList.length,
          itemBuilder: (BuildContext context, int index) {
          return Stack(children:<Widget>[
            movieCard(movieList[index], context),
            Positioned(child: movieImages(movieList[index].images[0])),]);
      /*  return Card(
          elevation: 4.5,
          color: Colors.white,
          child: ListTile(
            leading: CircleAvatar(
              child: Container(
                width: 200,
                height: 200,

                decoration: BoxDecoration(
                  image: DecorationImage(image: NetworkImage(movieList.elementAt(index).images[0]),
                  fit: BoxFit.cover),
                 //color: Colors.blue,
                  borderRadius: BorderRadius.circular(13.9)
                ),
                child: Text("H"),
              ) ,
            ),
            trailing: Text("..."),
            title: Text(movieList[index].title),
            subtitle: Text("${movieList.elementAt(index).title}"),
            onTap:(){Navigator.push(context, MaterialPageRoute(builder: (context) => MovieListViewDetails(movieName: movieList.elementAt(index).title,movie:movieList.elementAt(index) ,)
            ));}
            //onTap: () => debugPrint("Movie name: ${movies.elementAt(index)}"),
          ),
        ); */
      }),
    );
  }

//card ı daha düzenli olarak inkwell widgeti ile tanımlayıp scaffold ta çağıracağız.
   Widget movieCard(Movie movie, BuildContext context){
    return InkWell(
      child: Container(
        margin: EdgeInsets.only(left:60),
        width: MediaQuery.of(context).size.width,
        height: 120.0 ,
     child: Card(
        color: Colors.black45 ,
     child: Padding(
       padding: const EdgeInsets.only(
           top:8.0,
           bottom: 8.0,
           left:54.0),
       child: Padding(
         padding: const EdgeInsets.all(8.0),
         child: Column(
         //en leftten başlaması için
         crossAxisAlignment: CrossAxisAlignment.start,
         //yazılar arasındaki mesafe için
         mainAxisAlignment: MainAxisAlignment.spaceAround,
         children: <Widget>[
           Row(
             mainAxisAlignment: MainAxisAlignment.spaceBetween,
             children: <Widget>[
             Flexible(
               child: Text(movie.title, style:
               TextStyle(fontWeight: FontWeight.bold,
               fontSize: 17.0,
               color: Colors.white)),
             ),
             Text("Rating: ${movie.imdbRating} / 10",
             style: mainTextStyle(),)
           ],),
           Row(
             mainAxisAlignment: MainAxisAlignment.spaceAround,
             children: <Widget>[
                Text("Released: ${movie.released}", style: mainTextStyle(),),
               Text("Released: ${movie.runtime}",style: mainTextStyle()),

             ],
           )
         ],
         ),
       ),
     ),
        ),
    ),
    onTap: ()  {Navigator.push(context, MaterialPageRoute(builder: (context) => MovieListViewDetails(movieName: movie.title,movie:movie ,)
    ));},
    );
   }

  // bir textstyle sınıfı oluşturduk. aynı özellikte olacak textlerde kullanmak için.
  //tek tek style ile text in içinde de özellikleri verebiliriz. düzenli olsun diye
  //böyle yaptık.
   TextStyle mainTextStyle(){
    return TextStyle(
      fontSize: 14.0,
      color: Colors.grey
    );
   }
   //imageler için de bir widget oluşturacağız.
   Widget movieImages(String imageUrl){
    return Container(
      width: 100,
      height: 100,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        image: DecorationImage(
          image: NetworkImage(imageUrl ?? 'https://images-na.ssl-images-amazon.com/images/M/MV5BMTc0NzAxODAyMl5BMl5BanBnXkFtZTgwMDg0MzQ4MDE@._V1_SX1500_CR0,0,1500,999_AL_.jpg'),
              fit: BoxFit.cover
        )
      ),
    );

}
}

//New route ( screen or page )
class MovieListViewDetails extends StatelessWidget {
  final String movieName;
  final Movie movie; // Movie class ından object ürettik tüm özelliklerini taşır.
// const a bu objeyi de eklemeliyiz tabi.
  const MovieListViewDetails({Key key, this.movieName, this.movie}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Moview"),
        backgroundColor: Colors.blueGrey.shade900,
      ),
      body: ListView(
        children: <Widget>[
          MovieDetailsThumbnail(thumbnail: movie.images[0],),
          MovieDetailsHeaderWithPoster(movie: movie,),
          HorizantalLine(),
          MovieDetailsCast(movie: movie,),
          HorizantalLine(),
          MovieExtraPosters(posters: movie.images,)

        ],
      ) ,
      /*body: Center(
        child: Container(
          child: RaisedButton(
            child: Text("Go Back ${this.movie.director}"),
            onPressed: (){
              Navigator.pop(context);
            },
          ),
        ),
      ),*/
    );
  }
}
//movie application end 

class QuizApp extends StatefulWidget {
  @override
  _QuizAppState createState() => _QuizAppState();
}

class _QuizAppState extends State<QuizApp> {

  int _currentQuestionIndex = 0;
  List questionBank=[
    Question.name(
        "The U.S. Declaration of Independence was adopted in 1776.", true),
    Question.name("The Supreme law of the land is the Constitution.", true),
    Question.name(
        "The two rights in the Declaration of Independence are:"
            "  \n Life  "
            "  \n Pursuit of happiness.",
        true),
    Question.name("The (U.S.) Constitution has 26 Amendments.", false),
    Question.name(
        "Freedom of religion means:\nYou can practice any religion, "
            "or not practice a religion.",
        true),
    Question.name("Journalist is one branch or part of the government.", false),
    Question.name("The Congress does not make federal laws.", false),
    Question.name("There are 100 U.S. Senators.", true),
    Question.name("We elect a U.S. Senator for 4 years.", false), //6
    Question.name("We elect a U.S. Representative for 2 years", true),
    Question.name(
        "A U.S. Senator represents all people of the United States", false),
    Question.name("We vote for President in January.", false),
    Question.name("Who vetoes bills is the President.", true),
    Question.name("The Constitution was written in 1787.", true),
    Question.name('George Bush is the \ " Father of Our Country " \.', false)
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("True Citizien"),
        centerTitle: true,
        backgroundColor: Colors.blueGrey,

      ),
      backgroundColor: Colors.blueGrey,
      body: Builder(
        builder: (BuildContext context) =>Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Center(
                child: Image.asset("images/flag.png",
                width:250,
                height: 180,),
              ),

              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.transparent,
                    borderRadius: BorderRadius.circular(14.4),
                    border: Border.all(
                      color: Colors.blueGrey.shade400,
                      style: BorderStyle.solid
                    )
                  ),
                  height: 120.0,
                  child: Center(child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(questionBank[_currentQuestionIndex].questionText,style: TextStyle(
                      fontSize: 16.9,
                      color: Colors.white
                    ),),
                  )),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  RaisedButton(onPressed: () => _previousQuestion(),
                    color: Colors.blueGrey.shade900,
                    child: Icon(Icons.arrow_back, color: Colors.white,),),
                  RaisedButton(onPressed: () => _checkAnswer(true, context),
                  color: Colors.blueGrey.shade900,
                  child: Text("TRUE",style: TextStyle(
                    color: Colors.white
                  ),),),

                  RaisedButton(onPressed: () =>_checkAnswer(false, context),
                  color: Colors.blueGrey.shade900,
                  child: Text("FALSE",style: TextStyle(
                    color: Colors.white
                  ),),),
                  RaisedButton(onPressed: () => _nextQuestion(),
                  color: Colors.blueGrey.shade900,
                  child: Icon(Icons.arrow_forward, color: Colors.white,),)

                ],
              ),

              Spacer(),
            ],

          ),
        ),
      )
    );
  }

  _checkAnswer(bool userChoice, BuildContext context) {
    if(userChoice == questionBank[_currentQuestionIndex].isCorrect){
      debugPrint("Yes Correct!");
      final snackbar = SnackBar(
        backgroundColor: Colors.green,
          duration: Duration(milliseconds: 500) ,
          content: Text("Yes Corret!"));
      Scaffold.of(context).showSnackBar(snackbar);
      _updateQuestion();
    }
    else{
      debugPrint("Incorrect!");
      final snackbar = SnackBar(
        backgroundColor: Colors.redAccent,
          duration: Duration(milliseconds: 500),
          content: Text("Incorrect!"));
      Scaffold.of(context).showSnackBar(snackbar);
      _updateQuestion();

    }

  }
  _updateQuestion(){
    setState(() {
      _currentQuestionIndex = (_currentQuestionIndex +1)%questionBank.length;
    });
  }

  _nextQuestion() {
    _updateQuestion();

  }

  _previousQuestion() {
    setState(() {
      _currentQuestionIndex = (_currentQuestionIndex -1)%questionBank.length;
      debugPrint("index: $_currentQuestionIndex");
    });
  }
}

class BillSplitter extends StatefulWidget {
  @override
  _BillSplitterState createState() => _BillSplitterState();
}

class _BillSplitterState extends State<BillSplitter> {
  int _tipPercentage = 0;
  int _personCounter = 1;
  double _billAmount = 0.0;
  Color _purple = HexColor("#6908D6");
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body:Container(
          margin: EdgeInsets.only(top:MediaQuery.of(context).size.height*0.1),
          alignment: Alignment.center,
          color: Colors.white,
          child: ListView(
            scrollDirection: Axis.vertical,
            padding: EdgeInsets.all(20.5),
            children: <Widget>[
              Container(
                width: 150 ,
                height: 150,
                decoration: BoxDecoration(
                  color: _purple.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(12.0)
                ),
                child: Center(
                  child: Column(
                    mainAxisAlignment:  MainAxisAlignment.center,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Text("Total Per Person",style: TextStyle(
                          fontWeight: FontWeight.normal,
                            fontSize: 15.0,
                            color: _purple),),
                      ),
                      Text("\$ ${calculateTotalPerPerson(_billAmount, _personCounter, _tipPercentage )}", style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 34.9,
                        color: _purple
                      ),)
                    ],
                  ),
                )
              ),
              Container(
                margin: EdgeInsets.only(top:20.0),
                padding: EdgeInsets.all(12.0),
                decoration: BoxDecoration(
                  color: Colors.transparent,
                  border: Border.all(
                    color: Colors.blueGrey.shade100,
                    style: BorderStyle.solid
                  ),
                  borderRadius: BorderRadius.circular(12.0)

                ),
                child:Column(
                  children: <Widget>[
                    TextField(
                      keyboardType: TextInputType.numberWithOptions(decimal: true),
                      style: TextStyle(color: _purple),
                      decoration: InputDecoration(
                        prefixText: "Bill Amount",
                        prefixIcon: Icon(Icons.attach_money)
                      ),
                      onChanged: (String value){
                        try{
                          _billAmount = double.parse(value);

                        }catch(exception){
                          _billAmount = 0.0;

                        }
                      },
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text("Split", style: TextStyle(
                          color: Colors.grey.shade700
                        ),),
                        Row(
                          children: <Widget>[
                            InkWell(
                              onTap: (){
                                setState(() {
                                  if(_personCounter>1){
                                    _personCounter--;
                                  }
                                  else{
                                    //do nothing
                                  }
                                });
                              },
                              child: Container(
                                width: 40.0,
                                height: 40.0,
                                margin: EdgeInsets.all(10.0),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(7.0),
                                    color:_purple.withOpacity(0.1)
                                ),
                                child: Center(
                                  child: Text(
                                    "-", style: TextStyle(
                                    color: _purple,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 17.0
                                  ),
                                  ),
                                ),

                              ),
                            ),
                            Text("$_personCounter", style: TextStyle(
                              color: _purple,
                              fontWeight: FontWeight.bold,
                              fontSize: 17.0
                            ),),
                            InkWell(
                              onTap: (){
                                setState(() {
                                  _personCounter++;
                                });
                              },
                              child: Container(
                                width:40.0,
                                height:40.0,
                                margin:EdgeInsets.all(10.0),
                                decoration: BoxDecoration(
                                  color: _purple.withOpacity(0.1),
                                  borderRadius: BorderRadius.circular(7.0)
                                ),
                                child: Center(
                                  child: Text(
                                    "+", style: TextStyle(
                                    color: _purple,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 17.0
                                  ),
                                  ),
                                ),
                              ),


                            )
                          ],
                        )
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text("Tip", style: TextStyle(
                          color: Colors.grey.shade700
                        ),),
                        Padding(
                          padding: const EdgeInsets.all(18.0),
                          child: Text("\$ ${(calculateTotalTip(_billAmount, _personCounter, _tipPercentage)).toStringAsFixed(2)}", style: TextStyle(
                            color: _purple,
                            fontWeight: FontWeight.bold,
                            fontSize: 17.0
                          ),),
                        )
                      ],
                    ),
                    //Slider
                    Column(
                      children: <Widget>[
                        Text("$_tipPercentage%", style: TextStyle(
                          color: _purple,
                          fontSize: 17.0,
                          fontWeight: FontWeight.bold
                        ),),
                        Slider(
                            min:0,
                            max:100,
                            activeColor: _purple,
                            inactiveColor: Colors.grey,
                            divisions: 10,//optional
                            value: _tipPercentage.toDouble(),
                            onChanged: (double newValue){
                          setState(() {
                            _tipPercentage = newValue.round();
                          });

                        })
                      ],
                    )
                  ],
                )
              )
            ],
          ),


        ));
  }
  calculateTotalPerPerson(double billAmount, int splitBy,int tipPercentage){
  var totalPerson = (calculateTotalTip(billAmount, splitBy, tipPercentage) + billAmount)/splitBy;
  return totalPerson.toStringAsFixed(2);
  }
  calculateTotalTip(double billAmount, int splitBy, int tipPercentage){
    double totalTip = 0.0;
    if(billAmount < 0 || billAmount.toString().isEmpty || billAmount == null){
      // no go
    }else{
      totalTip = (billAmount*tipPercentage)/100;
    }
    return totalTip;
  }
}

//stateful widgets
class Wisdom extends StatefulWidget {
  @override
  _WisdomState createState() => _WisdomState();
}

class _WisdomState extends State<Wisdom> {
  int _index = 0;
  List quotes=["adadadadadaafafafafafafafafafadadadadfa",
  "wahatever the mind of man can conceive and believe, it can achieve",
  "Strive not to be a success, but rather to be of value",
  "I' ve missed more tah 9000 shots in my career",
  "aaaaaaaaaaaaaaaaaaaaaaaaaa",
  "bbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb",
  "cccccccccccccccccccccccccccccccccccccccccccccccccccc",
  "dddddddddddddddddddddddddddddddddddddddddddddddddddd",
  "eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee",
  "ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff",
  "ggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggg",
  "hhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhh"];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Expanded(
              child: Center(
                child: Container(
                    width:350,
                    height: 200,
                    margin:EdgeInsets.all(30.0),
                    decoration: BoxDecoration(
                      color: Colors.transparent,
                      borderRadius: BorderRadius.circular(14.5)

                    ),
                    child: Center(
                        child: Text(quotes[_index % quotes.length],style: TextStyle(
                          color: Colors.grey.shade600,
                          fontStyle: FontStyle.italic,
                          fontSize: 16.5
                        ),))),
              ),
            ),
            Divider(thickness: 1.3,),
            Padding(
              padding: const EdgeInsets.only(top:18.0),
              child: FlatButton.icon(onPressed: _showQuote, icon:Icon(Icons.wb_sunny),
              color: Colors.greenAccent.shade700,
              label:Text("inspire me!",style: TextStyle(
                  fontSize: 18.8,
                  color: Colors.white),)),
            ),
            Spacer()
          ],
        ),
      )
    );
  }

  void _showQuote() {
    //increment our index/counter by 1
    //index i setState fonksiyonu içinde arttırman gerek. yoksa set etmiyor.
    //bu fonksiyon var olan bir fonksiyon attribute gibi.

    setState(() {
      _index++;
    });

  }
}


//BizCard Example
class BizCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
appBar: AppBar(
  title: Text("BizCard"),
),
      backgroundColor: Colors.cyanAccent,
      body: Container(
        alignment: Alignment.center,
        child: Stack(
          alignment: Alignment.topCenter,
          children:<Widget>[
            _getCard(),
          _getAvatar(),]),
      ),
    );
  }

  Container _getCard() {
    return Container(
      width: 350,
      height: 200,
      margin: EdgeInsets.all(50.0),
      decoration: BoxDecoration(
        color: Colors.pinkAccent,
        borderRadius: BorderRadius.circular(14.5)
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text("hosgeldin",
            style: TextStyle(fontSize: 20.9,
                color: Colors.white,
          fontWeight: FontWeight.w500),),

          Text("gokce"),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Icon(Icons.person_outline),
              Text("T: @buildsappwithme")
            ],
          )
        ],
      ),
    );
  }

 Container _getAvatar() {
    return Container(
      width: 100,
      height: 100,
     decoration: BoxDecoration(
       color:Colors.white,
       borderRadius: BorderRadius.all(Radius.circular(50.0)),
       border: Border.all(color:Colors.redAccent,width: 1.2),
       image: DecorationImage(image:NetworkImage("https://picsum.photos/200/300"),
       fit: BoxFit.cover)
     ),
    );
  }
}

// Scaffold Example
class ScaffoldExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Scaffold"),
        centerTitle: true,
        backgroundColor: Colors.amber.shade700,
        actions: <Widget>[
          IconButton(icon: Icon(Icons.email), onPressed: ()=>debugPrint("email tapped!")),
          IconButton(icon: Icon(Icons.alarm), onPressed: _tapButton)
          
        ],
      ),
      floatingActionButton: FloatingActionButton(backgroundColor: Colors.lightGreen,
      child: Icon(Icons.call_missed),
      onPressed: ()=>debugPrint("Hello")),
      bottomNavigationBar: BottomNavigationBar(items: [

        BottomNavigationBarItem(icon: Icon(Icons.account_circle), title: Text("First")),
        BottomNavigationBarItem(icon: Icon(Icons.account_circle), title: Text("Second")),
        BottomNavigationBarItem(icon: Icon(Icons.account_circle), title: Text("Third"))

      ], onTap: (int index)=>debugPrint("Tapped item: $index"),),
      backgroundColor: Colors.pink.shade200,
      body: Container(
        alignment: Alignment.center,
        child:Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            CustomButton()
           /* InkWell(
              child: Text("Tap me", style: TextStyle(fontSize: 23.4),),
              onTap: ()=> debugPrint("tap me..."),
            ) */
          ],
        ),
      ),
    );
  }
}

//Custom Button Example
class CustomButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        final snackBar = SnackBar(content: Text("Hello Again"),backgroundColor: Colors.green.shade700,);
        Scaffold.of(context).showSnackBar(snackBar);

      },
      child: Container(
        padding: EdgeInsets.all(10.0),
        decoration: BoxDecoration(
          color: Colors.pinkAccent,
          borderRadius: BorderRadius.circular(8.0)
        ),
        child: Text("Button"),
      ),

    );
  }
}


class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    /* return Center(
      child: Text("Hello World",textDirection: TextDirection.ltr,),
    );*/

    return Material(
        color: Colors.cyanAccent,
        child: Center(
            child: Text(
              "Hello Flutter",
              textDirection: TextDirection.ltr,
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 23.4,
              ),
            ))); //material
  }
}