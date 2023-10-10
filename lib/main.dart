import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:party_ui/Screens/FindEvent.dart';
void main (){
  runApp(MyApp());
}
class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      home: HomeScreen(),

    );
  }

}
class HomeScreen extends StatefulWidget{
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with SingleTickerProviderStateMixin{


  late AnimationController _scaleController;
  late Animation<double> _scaleAnimaton;
  bool hide=false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //not getting why we used this
    _scaleController=AnimationController(
        vsync: this,
          duration: Duration(milliseconds: 300)


              );
     _scaleAnimaton=Tween<double>(
       begin: 1.0,
       end: 30.0

     ).animate(_scaleController)..addStatusListener((status) {
       if(status==AnimationStatus.completed){
         Navigator.push(context,
             PageTransition(type: PageTransitionType.fade, child: FindEvent()));

       }
     });


  }
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _scaleController.dispose();
  }



  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/five.jpg"),
            fit: BoxFit.cover

          )
        ),
        child: Container(
          padding: EdgeInsets.all(30),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.bottomCenter,
              colors: [
                Colors.black.withOpacity(.9),
                Colors.black.withOpacity(.6),
                Colors.black.withOpacity(.8),
                Colors.black.withOpacity(.3),

              ]
            )
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            children:<Widget>[
              Text("Find the best Locations near KITE for a good night. ",style: TextStyle(
                color: Colors.white,
                fontSize: 40,
                fontWeight: FontWeight.bold,
                height: 1.1,
              ),),
              SizedBox(height: 30,),
              Text("Let us find you an event for your interest",style: TextStyle(
                color: Colors.white.withOpacity(.7),
                fontSize: 25,
                fontWeight: FontWeight.w200,

              ),),
              SizedBox(height: 150,),
              InkWell(
                onTap: (){
                  setState(() {
                    hide=true;

                  });

                  _scaleController.forward();
                },
                child: AnimatedBuilder(
                  animation: _scaleController,
                  builder: (context, child)=>Transform.scale(
                    scale: _scaleAnimaton.value,
                    child: Container(
                      height: 60,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        color: Colors.yellow[700],
                      ),
                      child:hide==false ? Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children:<Widget>[
                          Text("Find nearst Event",style: TextStyle(
                              color: Colors.white,
                              fontSize: 17,

                              fontWeight: FontWeight.bold

                          ),),
                          Icon(Icons.arrow_forward,color: Colors.white,)

                        ],
                      ) :Container(),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 60,),




            ],
          ),
        ),

      ),

    );

  }
}

