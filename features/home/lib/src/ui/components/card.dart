import 'package:cached_network_image/cached_network_image.dart';
import 'package:core/extensions/string.dart';
import 'package:core/resources/color_manager.dart';
import 'package:core/resources/font_manager.dart';
import 'package:core/resources/style_manager.dart';
import 'package:core/resources/values_manager.dart';
import 'package:domain/entity/product.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import 'button.dart';

class CustomCard extends StatelessWidget {
  const CustomCard({super.key, required Product product}) : _product = product;

  final Product _product;

  @override
  Widget build(BuildContext context) {
    // Alexander Guzich advised not to use this one
    // example =>  context.mediaQuery().height;
    Size size = MediaQuery.sizeOf(context);

    return Padding(
      padding: const EdgeInsets.all(ApplicationPadding.p10),
      child: Card(
        clipBehavior: Clip.antiAlias,
        color: ColorManager.white,
        child: Padding(
          padding: const EdgeInsets.all(ApplicationPadding.p8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(
                height: size.height / ApplicationSize.s4_5,
                width: size.width / ApplicationSize.s9,
                child: _networkImage(),
              ),
              _detailsText(size)
            ],
          ),
        ),
      ),
    );
  }

  Padding _detailsText(Size size) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: ApplicationPadding.p4),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(_product.price.toString().toCurrency,
              style: StyleManager.getMediumFontStyle(
                  fontFamily: FontManager.poppins, fontSize: FontSize.s24)),
          Text(_product.name,
              style: StyleManager.getMediumFontStyle(
                  fontFamily: FontManager.poppins, fontSize: FontSize.s18),
              overflow: TextOverflow.ellipsis),
          SizedBox(height: size.height / ApplicationSize.s99),
          Text(_product.ml.toString().toWeight,
              style: StyleManager.getMediumFontStyle(fontSize: FontSize.s14)),
          SizedBox(height: size.height / ApplicationSize.s62),
          AddToCardButton(
            onPressed: () {
              //TODO: Add navigation
            },
          )
        ],
      ),
    );
  }

  CachedNetworkImage _networkImage() {
    return CachedNetworkImage(
      fadeInCurve: Curves.easeIn,
      imageUrl: _product.image,
      imageBuilder: (context, imageProvider) => Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: imageProvider,
            fit: BoxFit.cover,
            isAntiAlias: true,
          ),
          borderRadius: BorderRadius.circular(ApplicationSize.s10),
        ),
      ),
      placeholder: (context, url) => SpinKitFadingCircle(
        itemBuilder: (BuildContext context, int index) {
          return DecoratedBox(
            decoration: BoxDecoration(
              color: index.isEven ? ColorManager.red : ColorManager.green,
            ),
          );
        },
      ),
      errorWidget: (context, url, error) => const Icon(Icons.error),
    );
  }
}
