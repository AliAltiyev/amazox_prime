import 'dart:math';

import 'package:admin/admin.dart';

class AdminPage extends StatelessWidget {
  final TextEditingController _productNameTextEditingController =
      TextEditingController();
  final TextEditingController _productPriceTextEditingController =
      TextEditingController();
  final TextEditingController _productDescriptionTextEditingController =
      TextEditingController();

  AdminPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<AdminBloc>(
      create: (BuildContext context) {
        return AdminBloc(
            imagePicker: getIt<ImagePicker>(),
            saveProductUseCase: getIt<SaveProductUseCase>());
      },
      child: BlocBuilder<AdminBloc, AdminState>(
        builder: (BuildContext context, AdminState state) {
          if (state is AdminInitial) {
            return Scaffold(
              backgroundColor: ApplicationColors.pageBackground,
              body: SafeArea(
                child: ListView(
                  children: <Widget>[
                    const ImagePlaceHolder(),
                    const SizedBox(height: Dimensions.SIZE_20),
                    Padding(
                      padding: const EdgeInsets.all(Dimensions.SIZE_16),
                      child: Column(
                        children: <Widget>[
                          AppTextField(
                            suffixIcon:
                                const Icon(Icons.production_quantity_limits),
                            hintText: StringConstant.productName,
                            controller: _productNameTextEditingController,
                            fillColor: ApplicationColors.white,
                            filled: true,
                          ),
                          const SizedBox(height: Dimensions.SIZE_20),
                          AppTextField(
                            suffixIcon:
                                const Icon(Icons.monetization_on_outlined),
                            hintText: StringConstant.productPrice,
                            controller: _productPriceTextEditingController,
                            keyboardType: TextInputType.number,
                            fillColor: ApplicationColors.white,
                            filled: true,
                          ),
                          const SizedBox(height: Dimensions.SIZE_20),
                          SizedBox(
                            height: Dimensions.SIZE_500,
                            child: AppTextField(
                              hintText: StringConstant.productDescription,
                              isDescription: true,
                              fillColor: ApplicationColors.white,
                              filled: true,
                              maxLines: Dimensions.SIZE_20.toInt(),
                              controller:
                                  _productDescriptionTextEditingController,
                            ),
                          ),
                          const SizedBox(height: Dimensions.SIZE_20),
                          CartButton(
                            onPressed: () {
                              if (_productNameTextEditingController
                                      .text.isEmpty ||
                                  _productPriceTextEditingController
                                      .text.isEmpty ||
                                  _productDescriptionTextEditingController
                                      .text.isEmpty) {
                                Utils.showSnackBar(
                                    context, 'Надо добавить товар');
                              } else {
                                context.read<AdminBloc>().add(
                                      SaveProductEvent(
                                        product: Product(
                                            name:
                                                _productNameTextEditingController
                                                    .text,
                                            description:
                                                _productDescriptionTextEditingController
                                                    .text,
                                            image: context
                                                .read<AdminBloc>()
                                                .pickedImage,
                                            price: int.parse(
                                                _productPriceTextEditingController
                                                    .text),
                                            ml: 10,
                                            id: Random().nextInt(100000),
                                            bigDescription:
                                                _productDescriptionTextEditingController
                                                    .text,
                                            rate: 10),
                                      ),
                                    );
                                Utils.showSnackBar(context, 'Товар добавлень');
                                _productDescriptionTextEditingController
                                    .clear();
                                _productPriceTextEditingController.clear();
                                _productNameTextEditingController.clear();
                              }
                            },
                            text: StringConstant.add,
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            );
          } else {
            return const Scaffold();
          }
        },
      ),
    );
  }
}

class ImagePlaceHolder extends StatelessWidget {
  const ImagePlaceHolder({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(Dimensions.SIZE_44),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          InkWell(
            splashColor: ApplicationColors.primaryButtonColor,
            borderRadius: BorderRadius.circular(Dimensions.SIZE_20),
            onTap: () {
              context.read<AdminBloc>().add(PickImageFromGalleryEvent());
            },
            child: Container(
              height: 200,
              width: 50,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: ApplicationColors.contentColorPurple.withOpacity(0.6),
                  boxShadow: <BoxShadow>[
                    BoxShadow(
                        blurRadius: 10,
                        spreadRadius: 10,
                        color: ApplicationColors.contentColorPurple
                            .withOpacity(0.4)),
                    BoxShadow(
                        blurRadius: 20,
                        spreadRadius: 8,
                        color: ApplicationColors.primaryButtonColor
                            .withOpacity(0.5)),
                  ]),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Image.asset('assets/images/image_placeholder.png'),
              ),
            ),
          ),
          const SizedBox(height: 20),
          Text(
            'Выбери фото с расмером 650x650',
            style: AppFonts.bold14.apply(color: ApplicationColors.white),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
