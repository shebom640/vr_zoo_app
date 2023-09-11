import 'package:flutter/material.dart';
import 'package:vr_zoo/provider/item_provider.dart';

class GridViewProvider extends StatelessWidget {
  const GridViewProvider({super.key});


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 12.0,
          crossAxisSpacing: 12.0,
        ),
        itemCount: items.length,
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, '/itemDetails', arguments: index);
            },
            child: GridTile(
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.black12,
                    border: Border.all(
                      color: Colors.black12,
                    ),
                    borderRadius: BorderRadius.all(Radius.circular(10))
                ),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      // ignore: unnecessary_string_interpolations
                      Padding(
                        padding: EdgeInsets.fromLTRB(8.0, 10.0, 8.0, 8.0),
                        child: Image.asset('${items[index].imageUrl}', scale: 7.5,),
                      ),
                      Padding(
                        padding: EdgeInsets.all(2.0),
                        child: Text(
                        items[index].title,
                          maxLines: 1,
                          overflow: TextOverflow.fade,
                          softWrap: false,
                        style: TextStyle(color: Colors.black),
                    ),
                      ),
                    ]
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );;
  }
}
