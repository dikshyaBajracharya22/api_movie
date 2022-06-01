import 'package:flutter/material.dart';
import 'package:movie_api/utils/text.dart';
import 'package:movie_api/widgets/wishlist.dart';

class Description extends StatelessWidget {
  final String? name, deccription, bannerurl, posterurl, vote, launch_on;

  const Description(
      {Key? key,
      this.name,
      this.deccription,
      this.bannerurl,
      this.posterurl,
      this.vote,
      this.launch_on})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Color.fromARGB(255, 107, 153, 199),
        leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: Icon(
              Icons.arrow_back,
              color: Colors.black,
            )),
      ),
        backgroundColor: Color.fromARGB(255, 229, 231, 234),
      body: Container(
        child: ListView(
          children: [
            Container(
              height: 250,
              child: Stack(
                children: [
                  Positioned(
                      child: Container(
                    height: 250,
                    width: MediaQuery.of(context).size.width,
                    child: Image.network(
                      bannerurl!,
                      fit: BoxFit.cover,
                    ),
                  )),
                  Positioned(
                      bottom: 10,
                      child: modified_text(
                        text: "⭐ Average Rating -  " + vote!,
                        size: 18,
                        color: Colors.white,
                      )),
                  // Container(
                  //   child: Icon(Icons.)
                  // )
                ],
              ),
            ),
            SizedBox(height: 15),
            Container(
              padding: EdgeInsets.all(10),
              child: modified_text(
                text: name != null ? name : "Loading",
                size: 24,
                color: Colors.black,
              ),
            ),
            Container(
              padding: EdgeInsets.only(left: 10),
              child: modified_text(
                text: "Releasing on " + launch_on!,
                size: 14,
                color: Colors.black,
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Row(
              children: [
                Container(
                  margin: EdgeInsets.all(5),
                  height: 200,
                  width: 100,
                  child: Image.network(posterurl!),
                ),
                SizedBox(
                  width: 10,
                ),
                Flexible(
                  child: Container(
                    margin: EdgeInsets.all(5),
                    child: modified_text(
                      text: deccription!,
                      size: 18,
                      color: Colors.black,
                    ),
                  ),
                ),
              ],
            ),
            Center(
                child: Container(
                    height: 50,
                    width: MediaQuery.of(context).size.width,
                    color: Colors.yellow.shade600,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        modified_text(
                          text: "Add to WishList",
                          color: Colors.black,
                        ),
                        SizedBox(width: 10,),
                        InkWell(
                          onTap: (){
                           Navigator.of(context).push(MaterialPageRoute(builder: (context){
                             return  WishList(name: name,
                            deccription: deccription,
                            bannerurl: bannerurl,);
                           }));
                          },
                            child: Icon(
                          Icons.favorite,
                        ))
                      ],
                    )))
          ],
        ),
      ),
    );
  }
}
