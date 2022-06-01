import 'package:flutter/material.dart';

class WishList extends StatelessWidget {
  final String? name, deccription, bannerurl;
  WishList({
    Key? key,
    this.name,
    this.deccription,
    this.bannerurl,
  }) : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(icon: Icon(Icons.arrow_back), onPressed: (){
          Navigator.of(context).pop();
        },),
      ),
      body: ListTile(
        title: Text(name!),
       
        subtitle: Text(deccription!),

      ),
    );
  }
}
