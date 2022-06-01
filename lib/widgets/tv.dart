import 'package:flutter/material.dart';
import 'package:movie_api/description.dart';
import 'package:movie_api/utils/text.dart';

class TvShows extends StatelessWidget {
  final List? tvShows;
  TvShows({Key? key, this.tvShows}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          modified_text(
            text: "Upcoming Movies",
            size: 20,
            color: Colors.grey.shade700
          ),
          SizedBox(height: 10),
          Container(
            height: 200,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: tvShows!.length,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => Description(
                                name: tvShows![index]['original_title'],
                                deccription: tvShows![index]['overview'],
                                bannerurl: 'https://tmdb.org/t/p/w500' +
                                    tvShows![index]['backdrop_path'],
                                posterurl: 'https://tmdb.org/t/p/w500' +
                                    tvShows![index]['poster_path'],
                                vote:
                                    tvShows![index]['vote_average'].toString(),
                                launch_on: tvShows![index]['release_date'],
                              )));
                    },
                    child: Container(
                      padding: EdgeInsets.all(5),
                      width: 250,
                      child: Column(
                        children: [

                          Container(
                            width: 250,
                            height: 140,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                image: DecorationImage(
                                    image: NetworkImage(
                                      'https://tmdb.org/t/p/w500' +
                                          tvShows![index]['backdrop_path'],
                                    ),
                                    fit: BoxFit.cover)),
                          ),
                          SizedBox(height: 10),
                          Container(
                            child: modified_text(
                              color: Colors.black,
                              text: tvShows![index]['original_title'] != null
                                  ? tvShows![index]['original_title']
                                  : 'Loading',
                            ),
                          )
                        ],
                      ),
                    ),
                  );
                }),
          )
        ],
      ),
    );
  }
}
