import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

class ListarItens extends StatelessWidget {

  final BuildContext context;
  final int index;
  final List<Map> Item;

  ListarItens({@required this.context, @required this.index, @required this.Item});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.white,
        ),
        width: double.infinity,
        height: 150,
        margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              height: 100.0,
              width: 180.0,
              child: Image(image : CachedNetworkImageProvider(Item[index]['img']),
                fit: BoxFit.fill,
              ),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[
                  Text(
                    Item[index]['nome'],
                    style: TextStyle( color: Colors.black, fontWeight: FontWeight.bold, fontSize: 16), textAlign: TextAlign.end,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
