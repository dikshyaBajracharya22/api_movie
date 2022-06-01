import 'package:flutter/material.dart';
import 'package:movie_api/description.dart';
import 'package:movie_api/utils/text.dart';

class NowPlaying extends StatelessWidget {
  final List? nowplaying;
  NowPlaying({Key? key, this.nowplaying}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    
    return Container(
      padding: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [ 
          modified_text(
            text: "Now Playing Movies",
            size: 20,
            color: Colors.grey.shade700
          ),
          SizedBox(height: 10),
          Container(
            height: 270,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: nowplaying!.length,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(builder: (context)=>
                      Description(
                        name: nowplaying![index]["title"],
                        bannerurl: 'https://tmdb.org/t/p/w500' +
                            nowplaying![index]['backdrop_path'],
                        deccription: nowplaying![index]['overview'],
                        posterurl: 'https://tmdb.org/t/p/w500' +
                            nowplaying![index]['poster_path'],
                        vote: nowplaying![index]['vote_average'].toString(),
                        launch_on: nowplaying![index]['release_date'],

                      )
                    ));
                    },
                    child: Container(
                      width: 140,
                      height: 140,
                      child: Column(
                        children: [
                          Container(
                            
                            width: 200,
                            height: 190,
                          decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(90),
                                image: DecorationImage(
                                    image: NetworkImage(
                                        'https://tmdb.org/t/p/w500' +
                                            nowplaying![index]['poster_path']))),
                          ),
                          // SizedBox(height: 10),
                          Container(

                            child: modified_text(
                              color: Colors.black,
                              text: nowplaying![index]['title'] != null
                                  ? nowplaying![index]['title']
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
