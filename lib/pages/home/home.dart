import 'package:flutter/material.dart';
import 'dart:convert';
import '../details/details.dart';
import '../../models/recipe.dart';

class Home extends StatefulWidget{

  @override
  State<StatefulWidget> createState() {
     return new HomeState();
  }
}

class HomeState extends State<Home> {

  @override
  Widget build(BuildContext context) {
    return _constructorHome();
  }

  Widget _constructorHome()
  {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: _constructorCardList(),
      appBar: _constructorAppBar(),

    );
  }

  Widget _constructorCardList()
  {
    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFFFF5722), Color(0xFFFF8A65)],
            begin: const FractionalOffset(0.0, 0.0),
            end: const FractionalOffset(0.0, 1.0),
          )
      ),
      child:  FutureBuilder(
          future: DefaultAssetBundle.of(context).loadString('assets/recipes.json'),
          builder: (context, snapshot) {
            List<dynamic> receitas = json.decode(snapshot.data.toString());
            return ListView.builder(
              itemBuilder: (BuildContext context, int index){
                Recipe receita = Recipe.fromJson(receitas[index]);
                return _constructorCard(receita);
              },
              itemCount: receitas == null ? 0 : receitas.length,

            );
          }
      ),
    );

  }

  Widget _constructorCard(recipe)
  {
    return Align(
          alignment: Alignment.topCenter,
          child: SizedBox(
            height: 309,
            width: 309,
            child: Card(
                shadowColor: Colors.black,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0)
                ),
                margin: EdgeInsets.all(16),

                child: InkWell(
                  splashColor: Colors.deepOrange[100],
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(
                        builder: (context) => Details(recipe: recipe,) ));
                  },
                  child: Column(
                      children: <Widget>[
                        Padding(padding:const EdgeInsets.all(8.0)),
                        _constructorImageCard(recipe.image),
                        _constructorCardText(recipe.title)
                      ]
                  ),)
            ),
          )

      );


  }

  Widget _constructorCardText(title)
  {
    return Container(
      margin: EdgeInsets.only(top:20),
      child: Column(
        children: <Widget>[
          Text(title, textAlign: TextAlign.end,style: TextStyle(color: Colors.black, fontFamily: 'Poppins Medium', fontSize: 17))
        ],
      ),
    );

  }

  Widget _constructorImageCard(image)
  {
    return Align(
        child:ClipRRect(
            borderRadius: BorderRadius.circular(20.0),
            child: Image.asset(image, width: 250, height: 200,
                fit: BoxFit.fill)
        ));
  }

  PreferredSizeWidget _constructorAppBar()
  {
    return AppBar(
      title: Center(
        child: Text('Recipes App', style: TextStyle( color: Colors.white, fontFamily: 'Poppins Medium', inherit: true, decoration: TextDecoration.none),),
      ),
      flexibleSpace: _linearGradient(),
    );
  }

  Widget _linearGradient()
  {
    return Container(
        decoration: new BoxDecoration(
            gradient: new LinearGradient(
                colors: [
                  const Color(0xFFFF8A65),
                  const Color(0xFFFF5722)
                ],
                begin: const FractionalOffset(0.0, 0.0),
                end: const FractionalOffset(0.0, 0.0),
                stops: [0.0, 1.0],
                tileMode: TileMode.clamp)));
  }




}