import 'package:flutter/material.dart';
import 'package:projek_destinasi/tourism_place.dart';



class Detail_Screen extends StatelessWidget {
  late final TourismPlace TempatWisata;
  Detail_Screen({required this.TempatWisata});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraint) {
          if (constraint.maxWidth > 800) {
            return DetailScreenWeb(placematerial: TempatWisata);
          } else {
            return DetailMobile(
              placematerialMobile: TempatWisata,
            );
          }
        });
  }
}

class DetailMobile extends StatelessWidget {
  late final TourismPlace placematerialMobile;
  DetailMobile({required this.placematerialMobile});
  var fontOxygen = const TextStyle(fontFamily: 'Oxygen');
  var Staatliches = const TextStyle(fontFamily: 'Staatliches');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //nyesuain besaran task bar = SafeArea
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Stack(
                children: <Widget>[
                  Image.asset(placematerialMobile.imageAsset),
                  SafeArea(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CircleAvatar(
                          backgroundColor: Colors.grey,
                          child: IconButton(
                              icon: Icon(Icons.arrow_back),
                              color: Colors.white,
                              onPressed: () {
                                Navigator.pop(context);
                              }),
                        ),
                        Favourite_Button()
                      ],
                    ),
                  ),
                ],
              ),
              Container(
                margin: EdgeInsets.only(top: 16),
                child: Text('Bali',
                    textAlign: TextAlign.center, style: fontOxygen),
              ),
              Container(
                margin: EdgeInsets.only(top: 16),
                child: Text(
                    '"Bali is a province of Indonesia and the westernmost of the Lesser Sunda Islands. East of Java and west of Lombok, the province includes the island of Bali and a few smaller neighbouring islands, notably Nusa Penida, Nusa Lembongan, and Nusa Ceningan."',
                    textAlign: TextAlign.center,
                    style: Staatliches),
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Column(
                      children: <Widget>[
                        Icon(Icons.calendar_today),
                        SizedBox(height: 8),
                        Text(('Just Weekend'))
                      ],
                    ),
                    Column(
                      children: <Widget>[
                        Icon(Icons.timer),
                        SizedBox(height: 8),
                        Text(('09:00 - 18:00'))
                      ],
                    ),
                    Column(
                      children: <Widget>[
                        Icon(Icons.money_rounded),
                        SizedBox(height: 8),
                        Text(('1'))
                      ],
                    ),
                    Column(
                      children: <Widget>[
                        Icon(Icons.link),
                        SizedBox(height: 8),
                        Text(('1'))
                      ],
                    ),
                  ],
                ),
              ),
              Container(
                height: 150,
                child: Container(
                    child: ListView(
                        scrollDirection: Axis.horizontal,
                        children:
                        placematerialMobile.imageUrls.map((urlgambar) {
                          return Padding(
                            padding: EdgeInsets.all(4),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(4),
                              child: Image.network(urlgambar),
                            ),
                          );
                        }).toList())),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class Favourite_Button extends StatefulWidget {
  const Favourite_Button({Key? key}) : super(key: key);

  @override
  _Favourite_ButtonState createState() => _Favourite_ButtonState();
}

class _Favourite_ButtonState extends State<Favourite_Button> {
  bool inFavourite = false;
  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(
        inFavourite ? Icons.favorite : Icons.favorite_border,
        color: Colors.redAccent,
      ),
      onPressed: () {
        setState(() {
          inFavourite = !inFavourite;
        });
      },
    );
  }
}

class DetailScreenWeb extends StatelessWidget {

  late final TourismPlace placematerial;
  DetailScreenWeb({required this.placematerial});

  var fontOxygen = const TextStyle(fontFamily: 'Oxygen');
  var Staatliches = const TextStyle(fontFamily: 'Staatliches');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //nyesuain besaran task bar = SafeArea
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[

              Stack(
                children: <Widget>[
                  Image.asset(placematerial.imageAsset),
                  SafeArea(
                    child: Row(
                      children: [
                        CircleAvatar(
                          backgroundColor: Colors.grey,
                          child: IconButton(
                              icon: Icon(Icons.arrow_back, color: Colors.white),
                              onPressed: () {
                                Navigator.pop(context);
                              }),
                        ),

                        Favourite_Button()
                      ],
                    ),
                  ),
                ],
              ),
              Container(
                margin: EdgeInsets.only(top: 16),
                child: Text('Bali', textAlign: TextAlign.center,
                    style: fontOxygen
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 16),
                child: Text('"Bali is a province of Indonesia and the westernmost of the Lesser Sunda Islands. East of Java and west of Lombok, the province includes the island of Bali and a few smaller neighbouring islands, notably Nusa Penida, Nusa Lembongan, and Nusa Ceningan."', textAlign: TextAlign.center,
                    style: Staatliches
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Column(
                      children: <Widget>[
                        Icon(Icons.calendar_today),
                        SizedBox(height: 8),
                        Text(('Just Weekend'))
                      ],
                    ) ,
                    Column(
                      children: <Widget>[
                        Icon(Icons.timer),
                        SizedBox(height: 8),
                        Text(('09:00 - 18:00'))
                      ],
                    ),
                    Column(
                      children: <Widget>[
                        Icon(Icons.money_rounded),
                        SizedBox(height: 8),
                        Text(('1'))
                      ],
                    ),
                    Column(
                      children: <Widget>[
                        Icon(Icons.link),
                        SizedBox(height: 8),
                        Text(('1'))
                      ],
                    ),
                  ],
                ),
              ),
              Container(
                height: 150,
                child:Container(
                    child : ListView(
                        scrollDirection: Axis.horizontal,
                        children: placematerial.imageUrls.map((urlgambar){
                          return Padding(padding: EdgeInsets.all(4),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(4) ,
                              child: Image.network(urlgambar),

                            ),
                          );
                        }).toList()
                    )
                ) ,
              )

            ],
          ),),
      ),
    );
  }
}
