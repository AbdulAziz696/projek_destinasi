import 'package:flutter/material.dart';
import 'package:projek_destinasi/tourism_place.dart';

import 'detail_screen.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: Text('Place')
          //fungsi untuk melihat ukuran lebar sebuah browser
          // title: Text('Place , Size: ${MediaQuery.of(context).size.width}'),
        ),
        body: LayoutBuilder(
            builder: (BuildContext context, BoxConstraints constraint) {
              if (constraint.maxWidth <= 600) {
                return ListWisata();
              } else if (constraint.maxWidth <= 1200) {
                return GridWisata(
                  gridcount: 3,
                );
              } else {
                return GridWisata(
                  gridcount: 5,
                );
              }
            }));
  }
}

class ListWisata extends StatelessWidget {
  const ListWisata({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) {
        final TourismPlace place = tourismPlaceList[index];
        return InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) {
                return Detail_Screen(
                  TempatWisata: place,
                );
              }),
            );
          },
          child: Card(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Expanded(
                    flex: 1,
                    child: Image.asset(
                      place.imageAsset,
                      width: 200,
                    )),
                Expanded(
                  flex: 2,
                  child: Padding(
                      padding: EdgeInsets.all(8),
                      child: Column(
                        //cross : kanan-kiri
                        crossAxisAlignment: CrossAxisAlignment.start,
                        //main axis :atas-bawah
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          Text(
                            place.name,
                            style:
                            TextStyle(fontFamily: 'Oxygen', fontSize: 16),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(place.location)
                        ],
                      )),
                )
              ],
            ),
          ),
        );
      },
      itemCount: tourismPlaceList.length,
    );
  }
}

class GridWisata extends StatelessWidget {
  late final int gridcount;

  GridWisata({required this.gridcount});

  @override
  Widget build(BuildContext context) {
    return Scrollbar(
        isAlwaysShown: true,
        child: Padding(
          padding: EdgeInsets.all(6),
          child: GridView.count(
            //cross = kanan-kiri
            crossAxisCount: gridcount,
            children: tourismPlaceList.map((datatempatwisata) {
              return InkWell(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return Detail_Screen(TempatWisata: datatempatwisata,);
                  }));
                },
                child: Card(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      Expanded(
                          child: Image.asset(
                            datatempatwisata.imageAsset,
                            fit: BoxFit.cover,
                          )),
                      SizedBox(height: 8),
                      Padding(
                        padding: EdgeInsets.only(left: 8),
                        child: Text(
                          datatempatwisata.name,
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 8, bottom: 8),
                        child: Text(datatempatwisata.location),
                      )
                    ],
                  ),
                ),
              );
            }).toList(),
          ),
        ));
  }
}
