import 'package:flutter/material.dart';


class PostListItem extends StatelessWidget {
  PostListItem({super.key, required this.post});

  final String post;

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.all(10.0),
         child: Card(
           elevation: 4.0,
           color: Colors.white,
            child: Column(
              children: [
                //Image


                Container(
                  padding: const EdgeInsets.all(10.0),
                  height: MediaQuery.of(context).size.height*0.4,
                  clipBehavior: Clip.antiAlias,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage('https://picsum.photos/200/300/?random'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),


                const SizedBox(height: 10.0,),

                Container(
                  padding:const EdgeInsets.all(10.0),
                  child: Text("${post}",
                    textAlign: TextAlign.justify,

                  ),
                ),


              ],
            ),
         ),

    );
  }
}