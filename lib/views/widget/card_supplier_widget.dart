part of 'widget.dart';

class CardSupplierWidget extends StatefulWidget {
  final SupplierModel supplierModel;
  final Function onTap;
  const CardSupplierWidget({
    Key? key,
    required this.supplierModel,
    required this.onTap,
  }) : super(key: key);

  @override
  _CardSupplierWidgetState createState() => _CardSupplierWidgetState();
}

class _CardSupplierWidgetState extends State<CardSupplierWidget> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context
            .read<RoutesCubit>()
            .emit(RoutesUpdateSupplier(widget.supplierModel.id));
      },
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 10),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.3),
              spreadRadius: 5,
              blurRadius: 5,
              offset: Offset(0, 3), // changes position of shadow
            ),
          ],
        ),
        width: double.infinity,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 10, right: 10),
              child: Row(
                children: [
                  Container(
                    height: 40,
                    width: 40,
                    child: Icon(
                      Icons.people_alt,
                      color: kPrimaryColor,
                    ),
                  ),
                  Expanded(
                    child: Container(
                      height: 70,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Supplier: " + widget.supplierModel.namaSupplier,
                            style: blackTextStyleInter.copyWith(
                                fontSize: 14, fontWeight: medium),
                          ),
                          Container(
                            margin: EdgeInsets.only(right: 12, top: 8),
                            child: Text(
                              "No Telpon: " + widget.supplierModel.noTelp,
                              style: blackTextStyleInter.copyWith(
                                fontSize: 14,
                                fontWeight: medium,
                              ),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(right: 12, top: 8),
                            child: Text(
                              (widget.supplierModel.alamat.isEmpty)
                                  ? "-"
                                  : "Alamat: " + widget.supplierModel.alamat,
                              style: blackTextStyleInter.copyWith(
                                  fontSize: 14, fontWeight: medium),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
