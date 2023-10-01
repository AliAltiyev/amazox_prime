import 'package:admin/admin.dart';

class AdminCart extends StatelessWidget {
  final String text;
  final double height;
  final double width;
  final IconData icon;
  final VoidCallback onTap;
  const AdminCart({
    required this.text,
    required this.height,
    required this.width,
    required this.icon,
    required this.onTap,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(
        Dimensions.SIZE_14,
      ),
      child: GestureDetector(
        onTap: onTap,
        child: Card(
          color: ApplicationColors.transparient,
          elevation: Dimensions.SIZE_10,
          child: Container(
            width: width,
            height: height,
            decoration: BoxDecoration(
              color: ApplicationColors.primaryButtonColor,
              borderRadius: BorderRadius.circular(Dimensions.SIZE_16),
            ),
            child: Stack(
              children: <Widget>[
                Positioned(
                  top: Dimensions.SIZE_8,
                  left: Dimensions.SIZE_14,
                  child: Icon(
                    icon,
                    size: Dimensions.SIZE_44,
                    color: ApplicationColors.pageBackground,
                  ),
                ),
                Align(
                  alignment: Alignment.center,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: Dimensions.SIZE_16,
                    ),
                    child: Text(
                      textAlign: TextAlign.center,
                      text,
                      style: AppFonts.bold14.apply(
                        color: ApplicationColors.pageBackground,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
