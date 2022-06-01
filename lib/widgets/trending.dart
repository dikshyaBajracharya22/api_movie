import 'package:flutter/material.dart';
import 'package:movie_api/description.dart';
import 'package:movie_api/utils/text.dart';

class TrendingMovies extends StatelessWidget {
  final List? trending;
  TrendingMovies({Key? key, this.trending}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          modified_text(
            text: "Trending Movies",
            size: 20,
            color: Colors.grey.shade700
          ),
          SizedBox(height: 10),
          Container(
            height: 270,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: trending!.length,
                itemBuilder: (context, index) {
                  return InkWell(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => Description(
                                  name: trending![index]["title"],
                                  bannerurl: 'https://tmdb.org/t/p/w500' +
                                      trending![index]['backdrop_path'],
                                  deccription: trending![index]['overview'],
                                  posterurl: 'https://tmdb.org/t/p/w500' +
                                      trending![index]['poster_path'],
                                  vote: trending![index]['vote_average']
                                      .toString(),
                                  launch_on: trending![index]['release_date'],
                                )));
                      },
                      child: trending![index]['title'] != null
                          ? Container(
                              width: 140,
                              child: Column(
                                children: [
                                  Container(
                                    height: 200,
                                    decoration: BoxDecoration(
                                        image: DecorationImage(
                                            image: NetworkImage(
                                                'https://tmdb.org/t/p/w500' +
                                                    trending![index]
                                                        ['poster_path']))),
                                  ),
                                  SizedBox(height: 10),
                                  
                                  Container(
                                    child: modified_text(
                                      color: Colors.black,
                                      text: trending![index]['title'] != null
                                          ? trending![index]['title']
                                          : 'Loading',
                                    ),
                                  )
                                ],
                              ),
                            )
                          : Container());
                }),
          )
        ],
      ),
    );
  }
}
