import 'package:evanly/core/constant/app_color.dart';
import 'package:evanly/core/constant/app_constant_images.dart';
import 'package:evanly/core/routes/pageRouts.dart';
import 'package:evanly/modules/onbording/on_BordingItem.dart';
import 'package:evanly/modules/onbording/on_bording_model.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
///xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx///////////////////////xxxxxxxxxxxxxxxxxxxxxxxxxxxx
class on_Bording_screens extends StatefulWidget {
   on_Bording_screens({super.key});

  @override
  State<on_Bording_screens> createState() => _on_Bording_screensState();
}
class _on_Bording_screensState extends State<on_Bording_screens> {
  var Controler = PageController();
  var activeIndex = 0;
  @override
  Widget build(BuildContext context) {
    var Meda = MediaQuery.of(context);
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(height: 30,),
            Image.asset(app_images.ConstantLogoEvanly,height: Meda.size.height *0.090,),
            Expanded(child: PageView.builder(
              controller: Controler,
              onPageChanged: (index) {
                activeIndex = index;
                setState(() {
                });
              },
              itemCount: on_bordingMpdel.ListOnBording.length,
              itemBuilder: (context, index) {
              var onbordingModel  = on_bordingMpdel.ListOnBording[index];
              return on_Bordingitem(on_bordingModel: onbordingModel);
            },)),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Visibility(
                  visible: activeIndex!=0,
                  child: TextButton(onPressed: () {
                    Controler.previousPage(duration: Duration(milliseconds: 300), curve: Curves.easeInOut);
                    if(activeIndex == on_bordingMpdel.ListOnBording.length -1){
                      return;
                    }
                    activeIndex ++;
                  }, child: Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: app_color.appColorGeneral,
                        width: 1
                      ),
                    ),
                      padding: EdgeInsets.all(10),
                      child: Icon(Icons.arrow_back, ))),
                ),
                AnimatedSmoothIndicator(
                  activeIndex: activeIndex,
                  count: on_bordingMpdel.ListOnBording.length,
                  effect: ExpandingDotsEffect(
                    activeDotColor: app_color.appColorGeneral,
                    dotColor: app_color.appColorsecound,
                    dotHeight: 10,
                    dotWidth: 10
                  ),
                ),
                TextButton(onPressed: (
                    ) {
                  Controler.nextPage(duration: Duration(milliseconds: 300), curve: Curves.easeInOut);
                  if(activeIndex == on_bordingMpdel.ListOnBording.length -1){
                    Navigator.pushNamed(context, PagesRouteName.signIn);
                  }
                  else{
                    Controler.nextPage(
                      duration: Duration(milliseconds: 300),
                      curve: Curves.easeInOut,
                    );
                  }
                  activeIndex ++;
                }, child: Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                          color: app_color.appColorGeneral,
                          width: 1
                      ),
                    ),
                    padding: EdgeInsets.all(10),
                    child: Icon(Icons.arrow_forward, )))
              ],
            ),
          ],
        ),
      ),
    );
  }
}
