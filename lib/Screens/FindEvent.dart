import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

class FindEvent extends StatefulWidget{
  @override
  State<FindEvent> createState() => _FindEventState();
}

class _FindEventState extends State<FindEvent> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(246,248,253, 1),
      appBar: AppBar(
        backgroundColor: Colors.transparent ,
        elevation: 0,
        leading: Icon(Icons.menu,color: Colors.black,),
        actions: <Widget>[
          Padding(
              padding: EdgeInsets.all(10),
            child: Container(
              width: 35,
              height: 35,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                image: DecorationImage(
                  image: AssetImage("assets/images/two.jpg"),
                  fit: BoxFit.cover,
                )
              ),
              child: Transform.translate(
                  offset: Offset(15,-15),
                child: Container(
                  margin: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    border: Border.all(width: 3,color: Colors.white),
                    shape: BoxShape.circle,
                    color: Colors.yellow[800]
                  ),

                ),

              ),
            ),



          )
        ],


      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                padding: EdgeInsets.symmetric(vertical: 5),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color: Colors.white,

                ),
                child: TextField(
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    prefixIcon: Icon(Icons.search,color: Colors.grey,),
                    hintText: "Search Event",
                    hintStyle: TextStyle(
                      color: Colors.grey,

                    )

                  ),

                ),
              ),
              SizedBox(height: 30,),
              makeItem(image: "assets/images/one.jpg",date: 18),
              makeItem(image: "assets/images/one.jpg",date: 19),
              makeItem(image: "assets/images/one.jpg",date: 20),
              makeItem(image: "assets/images/one.jpg",date: 21),
              makeItem(image: "assets/images/one.jpg",date: 22),
              makeItem(image: "assets/images/one.jpg",date: 23),
              makeItem(image: "assets/images/one.jpg",date: 24),



            ],
          ),

        ),

      )

    );

  }
  Widget makeItem({image,date}){
    return Row(

      children:<Widget> [

        Container(
          width: 50,
          height: 200,
          margin: EdgeInsets.only(right: 20),

          child: Column(
            children: [
              Text(date.toString(),style: TextStyle(
                fontSize: 25,fontWeight: FontWeight.bold,
                color: Colors.blue,

              ),),
              Text("DEC",style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold
              ),)

            ],
          ),
        ),
        Expanded(
            child: Container(
              height: 200,
              margin: EdgeInsets.only(bottom: 20),
              
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),

                image: DecorationImage(
                  image: AssetImage(image),
                  fit: BoxFit.cover,

                )
              ),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  gradient: LinearGradient(
                      colors: [
                        Colors.black.withOpacity(.4),
                        Colors.black.withOpacity(.1),

                      ]
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children:<Widget> [
                      Text("Bumbershoot 2023",style: TextStyle(
                        fontSize: 38,
                        fontWeight: FontWeight.bold,
                        color: Colors.white
                      ),),
                      SizedBox(height: 10,),
                      Row(
                        children:<Widget>[
                          Icon(Icons.access_time,color: Colors.white,),
                          SizedBox(width: 10,),
                          Text("19:00 PM",style: TextStyle(
                            color: Colors.white
                          ),)
                          
                        ],
                      )

                    ],
                  ),
                ),
              ),
            )

        )

      ],
    );

  }
}