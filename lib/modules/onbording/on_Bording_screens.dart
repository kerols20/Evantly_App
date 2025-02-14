import 'package:evanly/core/constant/app_color.dart';
import 'package:evanly/core/constant/app_constant_images.dart';
import 'package:evanly/core/routes/pageRouts.dart';
import 'package:evanly/modules/onbording/on_BordingItem.dart';
import 'package:evanly/modules/onbording/on_bording_model.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

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
    var media = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(height: media.height * 0.03),
              Center(
                child: Image.asset(
                  app_images.ConstantLogoEvanly,
                  height: media.height * 0.09,
                ),
              ),
              SizedBox(height: media.height * 0.02),
              SizedBox(
                height: media.height * 0.6, // تحديد ارتفاع مناسب لـ PageView
                child: PageView.builder(
                  controller: Controler,
                  onPageChanged: (index) {
                    setState(() {
                      activeIndex = index;
                    });
                  },
                  itemCount: on_bordingMpdel.ListOnBording.length,
                  itemBuilder: (context, index) {
                    var onbordingModel = on_bordingMpdel.ListOnBording[index];
                    return on_Bordingitem(on_bordingModel: onbordingModel);
                  },
                ),
              ),
              SizedBox(height: media.height * 0.10),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Visibility(
                    visible: activeIndex != 0,
                    child: TextButton(
                      onPressed: () {
                        Controler.previousPage(
                          duration: Duration(milliseconds: 300),
                          curve: Curves.easeInOut,
                        );
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: app_color.appColorGeneral,
                            width: 1,
                          ),
                        ),
                        padding: EdgeInsets.all(media.width * 0.02),
                        child: Icon(Icons.arrow_back),
                      ),
                    ),
                  ),
                  AnimatedSmoothIndicator(
                    activeIndex: activeIndex,
                    count: on_bordingMpdel.ListOnBording.length,
                    effect: ExpandingDotsEffect(
                      activeDotColor: app_color.appColorGeneral,
                      dotColor: app_color.appColorsecound,
                      dotHeight: media.width * 0.025,
                      dotWidth: media.width * 0.025,
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      if (activeIndex == on_bordingMpdel.ListOnBording.length - 1) {
                        Navigator.pushNamed(context, PagesRouteName.signIn);
                      } else {
                        Controler.nextPage(
                          duration: Duration(milliseconds: 300),
                          curve: Curves.easeInOut,
                        );
                      }
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: app_color.appColorGeneral,
                          width: 1,
                        ),
                      ),
                      padding: EdgeInsets.all(media.width * 0.02),
                      child: Icon(Icons.arrow_forward),
                    ),
                  ),
                ],
              ),
              SizedBox(height: media.height * 0.5),
            ],
          ),
        ),
      ),
    );
  }
}
