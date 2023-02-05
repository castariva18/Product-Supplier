part of 'widget.dart';

class CustomBottomNavigation extends StatelessWidget {
  final int selectedIndex;
  final Function(int index) onTap;
  const CustomBottomNavigation({
    Key? key,
    required this.onTap,
    required this.selectedIndex,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      width: double.infinity,
      margin: EdgeInsets.only(bottom: 20, left: 18, right: 18),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(defaultRadius),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            spreadRadius: 5,
            blurRadius: 5,
            offset: Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          GestureDetector(
            onTap: () {
              onTap(0);
            },
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  width: 24,
                  height: 24,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(
                          'assets/suplier-' +
                              ((selectedIndex == 0)
                                  ? 'active.png'
                                  : 'nonactive.png'),
                        ),
                        fit: BoxFit.contain),
                  ),
                ),
                Container(
                  width: 50,
                  child: Text(
                    'Supplier',
                    style: whiteTextStyleInter.copyWith(
                      fontSize: 10,
                      color: ((selectedIndex == 0))
                          ? kTextOrangeColor
                          : kSecondaryGreyColor,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
          ),
          GestureDetector(
            onTap: () {
              onTap(1);
            },
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  width: 24,
                  height: 24,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage(
                            'assets/product-' +
                                ((selectedIndex == 1)
                                    ? 'active.png'
                                    : 'nonactive.png'),
                          ),
                          fit: BoxFit.contain)),
                ),
                Container(
                  width: 50,
                  child: Text(
                    'Product',
                    style: whiteTextStyleInter.copyWith(
                      fontSize: 10,
                      color: ((selectedIndex == 1))
                          ? kTextOrangeColor
                          : kSecondaryGreyColor,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
