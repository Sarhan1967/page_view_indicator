import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:page_view_indicator/models/PageView_items.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class onBoarding extends StatefulWidget {
  const onBoarding({Key key}) : super(key: key);

  @override
  _onBoardingState createState() => _onBoardingState();
}

class _onBoardingState extends State<onBoarding> {
  final _controller = PageController();
  List<PageModel>pages;
  int _currentIndex = 0;
  void _addPages() {
    pages = List<PageModel>();

    pages.add(PageModel(
      "Welcome", "assets/plate1.jpg", "Congratulation", Icons.ac_unit,));
    pages.add(PageModel(
      "Alarm", "assets/plate2.jpg", "Get up Early", Icons.access_alarm,));
    pages.add(PageModel(
      "Printer", "assets/plate3.jpg", "Print the letter", Icons.print,));
    pages.add(PageModel(
      "Map", "assets/plate4.jpg", "Google Map Indicator", Icons.map,));
  }
  @override
  Widget build(BuildContext context) {
    _addPages();

    return Scaffold(
        body: Stack(
          children: <Widget>[
            PageView.builder(itemBuilder: (context, index) {
              return Stack(
                children: <Widget>[
                  Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(image: ExactAssetImage(
                        pages[index].images,
                      ),
                          fit: BoxFit.cover),

                    ),


                  ),
                  Center(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Transform.translate(
                          child: Icon(
                            pages[index].icons,
                            size: 250, color: Colors.blueAccent,
                          ),
                          offset: Offset(0.0, 40),
                        ),

                        Text(
                            pages[index].titles,
                            style: TextStyle(
                              fontSize: 28,
                              fontWeight: FontWeight.bold,
                              color: Colors.blueAccent,
                            )
                        ),

                        Padding(
                          padding: const EdgeInsets.only(
                            left: 50.0, right: 50, bottom: 150,),
                          child: Text(
                              pages[index].descriptions,
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              )
                          ),
                        ),
                      ],

                    ),
                  ),

                ],

              );
            },
              itemCount: pages.length,
              onPageChanged: (index) { setState(() {
                _currentIndex = index;

              });
              },
            ),
            //page Indicators  Align------------
            Transform.translate(
              offset: Offset(0, 180),
              child: Align(alignment: Alignment.bottomCenter,
                child:_displayPageIndicators(pages.length),


              ),
            ),
        Align(alignment: Alignment.bottomCenter,
              //color:Colors.amber
              child: Padding(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: SizedBox(
                  height: 50,
                  width: 380,
                  //background: Colors.amber
                  child: RaisedButton(
                    //color: Colors.amber.shade600,
                    color: Colors.white,
                    child: Text("GET STARTED",
                      style: TextStyle(color: Colors.pinkAccent,
                        fontSize: 20,
                        letterSpacing: 2.0,),
                    ),

                    onPressed: () {

                    },
                  ),
                ),
              ),
            ),


          ],


        )

    );
  }
//TO DO--------------
  Widget _displayPageIndicators(length){
    return

      SmoothPageIndicator(
        controller: _controller,
        count: pages.length,
        //effect: ExpandingDotsEffect(///No jumpScale
        //effect: JumpingDotEffect(
        //effect: SwapEffect(
        effect: JumpingDotEffect(
          activeDotColor: Colors.deepPurple,
          dotColor: Colors.deepPurple.shade100,
          dotHeight: 30,
          dotWidth: 30,
          //spacing changed more or less
          spacing: 16,
          ///verticalOffset:used only with JumpingDotEffect
          verticalOffset: 50,
          ///jumpScale:used only with JumpingDotEffect
          jumpScale: 3,
        ),
      );

}

}