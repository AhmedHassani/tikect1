import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';
import 'package:sizer/sizer.dart';

import 'Style/app_color.dart';

final ColorController c = Get.find();
Widget TextCatogary({
  required String text,
}) {
  return TextX(
      text: text,
      fontSize: c.fontSize3,
      color: c.whiteColor,
      maxChars: 77,
      fontWeight: FontWeight.bold);
}

Widget TextX({
  required String text,
  required double fontSize,
  TextAlign textAlign = TextAlign.start,
  FontWeight fontWeight = FontWeight.w500,
  int maxChars = 10000,
  double height = 1,
  int maxLines = 1,
  Color? color,
}) {
  return Text(text.length > maxChars ? text.substring(0, maxChars) : text,
      textAlign: textAlign,
      maxLines: maxLines,
      overflow: TextOverflow.ellipsis,
      softWrap: false,
      style: TextStyle(
        fontSize: fontSize.sp,
        height: height,
        color: color,
        fontWeight: fontWeight,
      ));
}

class MyImgUrl extends StatelessWidget {
  MyImgUrl({
    required this.url,
    this.radius = 0.0,
    this.height = 100,
    this.isCompressed = true,
    this.fit = BoxFit.cover,
    Key? key,
  }) : super(key: key);
  final String url;
  final double radius;
  final double height;
  final BoxFit fit;
  final bool isCompressed;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ColorController>(
        builder: (c) => CachedNetworkImage(
            imageUrl: isCompressed ? "$url?h=$h1" : url,
            imageBuilder: (context, imageProvider) => Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(radius),
                    image: DecorationImage(
                      image: imageProvider,
                      fit: fit,
                    ),
                  ),
                ),
            placeholder: (context, url) => Shimmer.fromColors(
                baseColor: Color(0xfff9c450).withOpacity(0.5),
                highlightColor: Color(0xffea3369).withOpacity(0.5),
                child: Container(
                  height: height.h,
                  width: height.w,
                  decoration: BoxDecoration(
                    color: Color(0xfff9c450),
                    borderRadius: BorderRadius.circular(radius),
                  ),
                )),
            errorWidget: (context, url, error) => Padding(
                  padding: EdgeInsets.all(1.h),
                  child: MyImageAssets(
                    img: "error",
                    type: "svg",
                    height: height.h,
                  ),
                )));
  }
}

class MyImageAssets extends StatefulWidget {
  MyImageAssets({
    required this.img,
    this.height,
    this.type = 'png',
    this.width,
    this.fit = BoxFit.fitHeight,
    Key? key,
  }) : super(key: key);
  final String img;
  final String type;
  final double? height;
  final double? width;
  final BoxFit fit;

  @override
  State<MyImageAssets> createState() => _MyImageAssetsState();
}

class _MyImageAssetsState extends State<MyImageAssets> {
  @override
  Widget build(BuildContext context) {
    return widget.type == "svg"
        ? SvgPicture.asset(
            "assets/images/svg/${widget.img}.svg",
            height: widget.height,
            fit: widget.fit,
            semanticsLabel: '',
          )
        : Image.asset(
            "assets/images/${widget.type}/${widget.img}.${widget.type}",
            fit: widget.fit,
            height: widget.height,
            width: widget.width,
          );
  }
}

class MyFutureBuilder extends StatelessWidget {
  const MyFutureBuilder({
    required this.child,
    required this.future,
    required this.heightImage,
    Key? key,
  }) : super(key: key);
  final Widget child;
  final double heightImage;
  final Future? future;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      builder: (ctx, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          if (snapshot.hasError) {
            return Center(
                child: MyImageAssets(
              img: "error",
              height: heightImage,
              type: 'svg',
            ));
          } else if (snapshot.hasData) {
            // final data = snapshot.data as String;
            return child;
          }
        }

        return Center(
          child: MyImageAssets(
            img: "loading",
            height: heightImage,
            type: 'gif',
          ),
        );
      },
      future: future,
    );
  }
}

class MyCircleAvatar extends StatelessWidget {
  MyCircleAvatar({
    Key? key,
    required this.myUrl,
    this.border = 0,
    this.isDrawer = false,
    this.type = "url",
    required this.size,
    this.colorBorder = Colors.transparent,
    required this.colorBackground,
  }) : super(key: key);

  final String myUrl;
  final String type;
  final double border;
  final bool isDrawer;

  final double size;
  final Color colorBackground;
  final Color colorBorder;

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundColor: colorBorder,
      maxRadius: size + border,
      child: CircleAvatar(
        backgroundColor: colorBackground,
        //backgroundImage: NetworkImage("$myUrl"),
        maxRadius: size,
        child: type == "url"
            ? MyImgUrl(url: myUrl, radius: size)
            : MyImageAssets(
                img: myUrl,
                type: type,
                height: isDrawer ? size * 1.3 : size,
              ),
      ),
    );
  }
}
