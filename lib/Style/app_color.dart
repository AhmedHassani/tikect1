import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:sizer/sizer.dart';

class ColorController extends GetxController {
  @override
  void onInit() {
    super.onInit();
  }

  static final light = ThemeData.light().copyWith(
    backgroundColor: Color(0xFFF3F6F8),
    scaffoldBackgroundColor: Color(0xFFF3F6F8),
    cardColor: Colors.black,

    textSelectionTheme: TextSelectionThemeData(
      cursorColor: Color(0xFFC56CF0),
      selectionColor: Color(0xFFC56CF0).withOpacity(0.3),
      selectionHandleColor: Color(0xFFC56CF0),
    ),
    splashColor: Color(0xFFC56CF0).withOpacity(0.3),
    highlightColor: Colors.transparent,
    dividerColor: Color(0xFFC56CF0),
    canvasColor: Color(0xFFC56CF0),
    iconTheme: IconThemeData(
      color: Color(0xFF000000),
    ),
    // listTileTheme: ListTileThemeData(tileColor: Colorsax.white),
    primaryColor: Color(0xFF1E272E),
    progressIndicatorTheme:
        ProgressIndicatorThemeData(refreshBackgroundColor: Colors.white),
    navigationBarTheme: NavigationBarThemeData(backgroundColor: Colors.white),
    appBarTheme: AppBarTheme(
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarIconBrightness: Brightness.dark,
        statusBarColor: Colors.transparent,
      ),
      // actionsIconTheme: IconThemeData(color: Colorsax.black),
      // backgroundColor: Colorsax.blueGrey,
      // titleTextStyle: TextStyle(color: Colorsax.black)
    ),
  );
  static final dark = ThemeData.dark().copyWith(
    backgroundColor: Color(0xFF1E272E),
    scaffoldBackgroundColor: Color(0xFF1E272E),
    cardColor: Colors.white,
    textSelectionTheme: TextSelectionThemeData(
      cursorColor: Color(0xFFC56CF0),
      selectionColor: Color(0xFFC56CF0).withOpacity(0.3),
      selectionHandleColor: Color(0xFFC56CF0),
    ),
    splashColor: Color(0xFFC56CF0).withOpacity(0.3),
    highlightColor: Colors.transparent,
    dividerColor: Color(0xFFC56CF0),
    canvasColor: Color(0xFFC56CF0),
    iconTheme: IconThemeData(
      color: Color(0xFF000000),
    ),
    // listTileTheme: ListTileThemeData(tileColor: Colorsax.white),
    primaryColor: Color(0xFFF3F6F8),
    progressIndicatorTheme:
        ProgressIndicatorThemeData(refreshBackgroundColor: Colors.white),
    navigationBarTheme: NavigationBarThemeData(
      backgroundColor: Colors.white,
    ),
    appBarTheme: AppBarTheme(
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarIconBrightness: Brightness.light,
        statusBarColor: Colors.transparent,
      ),
      // actionsIconTheme: IconThemeData(color: Colorsax.black),
      // backgroundColor: Colorsax.blueGrey,
      // titleTextStyle: TextStyle(color: Colorsax.black)
    ),
  );
  // DARK
  // THEME
  static final fallback = ThemeData.fallback().copyWith(
    backgroundColor: Color(0xFF1E272E),
    scaffoldBackgroundColor: Color(0xFF1E272E),
    cardColor: Colors.white,

    textSelectionTheme: TextSelectionThemeData(
      cursorColor: Color(0xFFC56CF0),
      selectionColor: Color(0xFFC56CF0).withOpacity(0.3),
      selectionHandleColor: Color(0xFFC56CF0),
    ),
    splashColor: Color(0xFFC56CF0).withOpacity(0.3),
    highlightColor: Colors.transparent,
    dividerColor: Color(0xFFC56CF0),
    canvasColor: Color(0xFFC56CF0),
    iconTheme: IconThemeData(
      color: Color(0xFF000000),
    ),
    // listTileTheme: ListTileThemeData(tileColor: Colorsax.white),
    primaryColor: Color(0xFFC56CF0),
    progressIndicatorTheme:
        ProgressIndicatorThemeData(refreshBackgroundColor: Colors.white),
    navigationBarTheme: NavigationBarThemeData(backgroundColor: Colors.white),
    appBarTheme: AppBarTheme(
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarIconBrightness: Brightness.light,
        statusBarColor: Colors.transparent,
      ),
      // actionsIconTheme: IconThemeData(color: Colorsax.black),
      // backgroundColor: Colorsax.blueGrey,
      // titleTextStyle: TextStyle(color: Colorsax.black)
    ),
  );

  // //
  // // static final light = ThemeData.light().copyWith(
  // //   backgroundColor: Color(0xFFFFFFFF),
  // //   scaffoldBackgroundColor: Color(0xFFFFFFFF),
  // // );
  // static final dark = ThemeData.dark().copyWith(
  //   backgroundColor: Color(0xFF1E272E),
  //   scaffoldBackgroundColor: Color(0xFF1E272E),
  // );

  Color backgroundColor = const Color(0xfff9c450);
  Color colorPrimary = const Color(0xffea3369);
  Color colorSecondary = const Color(0xffea3369);

  Color colorWhite = Color(0xFFFFFFFF);
  Color whiteColor = Color(0xFFFFFFFF);
  Color blackColor = Color(0xFF000000);
  Color goldenColor = Color(0xFFFFDA04);

  double defaultPadding1 = 20.0;
  double defaultPadding2 = 15.0;
  double defaultPadding3 = 10.0;
  double defaultPadding4 = 5.0;

  double fontSize1 = 1.0;
  double fontSize2 = 2.0;
  double fontSize3 = 3.0;
  double fontSize4 = 4.0;
  double fontSize5 = 5.0;
  double fontSize6 = 6.0;
  double fontSize7 = 7.0;
  double fontSize8 = 8.0;
  double fontSize9 = 10.0;
  double fontSize10 = 10.0;
  double fontSize11 = 11.0;
  double fontSize12 = 12.0;
}

String img1 = " ";

String mp41 =
    "https://media.istockphoto.com/vectors/hungry-sad-kid-empty-plate-vector-id1170755147?k=6&m=1170755147&s=170667a&w=0&h=8LwNd2WVZDdVXzmeldejncjSCm-vT8jSyAxbkTyNqmc=";

String mp31 =
    "https://media.istockphoto.com/vectors/hungry-sad-kid-empty-plate-vector-id1170755147?k=6&m=1170755147&s=170667a&w=0&h=8LwNd2WVZDdVXzmeldejncjSCm-vT8jSyAxbkTyNqmc=";
String h1 = "300";
