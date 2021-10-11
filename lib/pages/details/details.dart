import 'package:flutter/material.dart';
import '../../models/recipe.dart';

class Details extends StatelessWidget
{
  final Recipe recipe;
  Details({Key? key, required this.recipe}): super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return _constructorDetails();  }

  Widget _constructorDetails(){
    return Scaffold(
      body: _constructorDetailsPage(),
      appBar: _constructorAppBar(),
    );
  }

  PreferredSizeWidget _constructorAppBar()
  {
    return AppBar(
      title: Align(
        alignment: Alignment.topLeft,
        child: Text(recipe.title, style: TextStyle( color: Colors.white, fontFamily: 'Poppins Medium', decoration: TextDecoration.none),),
      ),
      flexibleSpace: _linearGradient(),

    );
  }

  Widget _constructorImageCard()
  {
    return
    new Container(

       child: Align(
          alignment: Alignment.topCenter,
          child: SizedBox(
              height: 230,
              width: 230,
              child: Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0)
                ),
                margin: EdgeInsets.all(10),
                child: Column(
                    children: <Widget>[
                      Padding(padding:const EdgeInsets.all(2.5)),
                      _constructorImage(recipe.image),
                    ]
                ),)
          ),
        )

    );


  }

  Widget _constructorImage(imagem)
  {
    return Align(
      alignment: Alignment.center,
        child:ClipRRect(
            borderRadius: BorderRadius.circular(20.0),
            child: Image.asset(imagem, width: 200, height: 200,
                fit: BoxFit.fill)
        ));
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
                begin: const FractionalOffset(0.1, 0.0),
                end: const FractionalOffset(0.0, 0.1),
                stops: [0.0, 1.0],
                tileMode: TileMode.clamp)));
  }




  Widget _constructorDetailsPage()
  {
    return
      Container(
        width: 2000,
        height: 2000,
        decoration: BoxDecoration(
        gradient: LinearGradient(
        colors: [Color(0xFFFF5722), Color(0xFFFF8A65)],
        begin: const FractionalOffset(0.0, 0.0),
        end: const FractionalOffset(0.0, 1.0),
        )
        ),
      child: Column(
        children: <Widget>
        [
           _constructorImageCard(),
          _constructorCardInfo('1 porção', '20min')
        ],
      )
      );
  }


  Widget _constructorCardInfo(texto, tempo_preparo)
  {
    return
      Container(
          margin: EdgeInsets.only(bottom: 00),
          child: Align(
            alignment: Alignment.topCenter,
            child: SizedBox(
                height: 200,
                width: 300,
                child: Card(
                  shadowColor: Colors.black,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0)
                  ),
                  margin: EdgeInsets.all(2),
                  child: Column(
                      children: <Widget>[
                        Padding(padding:const EdgeInsets.all(5.0)),
                        _constructorDetailsRow(recipe.lot, recipe.timeCook),
                        _constructorDetailsSubtitle('Ingredientes:'),
                        _constructorInfo('Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. '),
                        _constructorDetailsSubtitle('Modo de preparo:'),
                        _constructorInfo(recipe.howDoes)
                      ]
                  ),)
            ),
          )
      );

  }

  Widget _constructorDetailsRow(redimento, tempo_preparo)
  {
    return Row(
      children: <Widget>[
        _constructorDetailsColumn(Icons.restaurant, redimento),
        _constructorDetailsColumn(Icons.timer, tempo_preparo)
      ],
    );
  }

  Widget _constructorDetailsColumn(incone, texto)
  {
    return Expanded(
        child: Column(
          children: <Widget>[
            Icon(incone, color: Colors.deepOrange),
            Text(texto, style: TextStyle(fontWeight: FontWeight.bold,fontSize: 10, fontFamily: 'Poppins', color: Colors.deepOrange),)
      ],
    ));
  }

  Widget _constructorDetailsSubtitle(texto)
  {
    return Text(
        texto, style: TextStyle(fontFamily: 'Poppins', fontSize: 10, color: Colors.deepOrange, fontWeight: FontWeight.bold),
    );

  }

  Widget _constructorInfo(texto)
  {
    return
      Text(texto,
          style: TextStyle( color: Colors.black,
              fontSize: 7,
              fontFamily: 'Poppins Medium',
              decoration: TextDecoration.none));
  }

}