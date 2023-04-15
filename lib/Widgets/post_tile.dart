

import 'package:flutter/material.dart';
import 'package:randomizer/randomizer.dart';



class PostTile extends StatefulWidget {

  final String userId;
  final String blogPostId;
  final String Title;
  final String Description;
  final String date;
  final String image1;
  final String image2;


  PostTile({
    required this.userId,
    required this.blogPostId,
    required this.Title,
    required this.Description,
    required this.date,
    required this.image1,
    required this.image2,
  });

  @override
  _PostTileState createState() => _PostTileState();
}

class _PostTileState extends State<PostTile> {



  Randomizer randomizer = Randomizer();
  List<Color> colorsList = [Color(0xFF083663), Color(0xFFFE161D), Color(0xFF682D27), 
    Color(0xFF61538D), Color(0xFF08363B), Color(0xFF319B4B), Color(0xFFF4D03F)];

  // initState
  @override
  void initState() {
    super.initState();
   // _getCurrentUser();
  }

  // _getCurrentUser() async {
  //   _user = await FirebaseAuth.instance.currentUser;
  // }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        //Navigator.of(context).push(MaterialPageRoute(builder: (context) => BlogPostPage(userId: _user.uid, blogPostId: widget.blogPostId,image1: widget.image1,image2:widget.image2,)));
      },
      child: Container(  
        decoration : BoxDecoration (border: Border.all(color: Colors.black),
            borderRadius: BorderRadius.all(Radius.circular(10))),

        margin: EdgeInsets.fromLTRB(10, 2, 8,10 ),
        padding: EdgeInsets.symmetric(horizontal: 5.0, vertical: 10.0),
        child: ListTile(
          leading: CircleAvatar(
            radius: 30.0,
            backgroundColor: randomizer.getspecifiedcolor(colorsList),
            child: Text(widget.Title.substring(0, 1).toUpperCase(), textAlign: TextAlign.center, style: TextStyle(color: Colors.white)),
          ),
          title: Text(
            widget.Title,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0 ,color: Colors.black),
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
          ),
          subtitle: Text(
            widget.Description,
            style: TextStyle(fontSize: 13.0,color: Colors.lightBlueAccent ),
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
          ),
          trailing: Text(widget.date, style: TextStyle(color: Colors.grey, fontSize: 12.0)),
        ),
      ),
    );
  }
}