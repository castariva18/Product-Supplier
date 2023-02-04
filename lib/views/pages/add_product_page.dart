part of 'page.dart';

class AddProductPage extends StatefulWidget {
  const AddProductPage({super.key});

  @override
  State<AddProductPage> createState() => _AddProductPageState();
}

class _AddProductPageState extends State<AddProductPage> {
  TextEditingController hargaController = TextEditingController();
  TextEditingController namaBarangController = TextEditingController();
  TextEditingController stokController = TextEditingController();
  TextEditingController alamatController = TextEditingController();
  TextEditingController namaSupplierController = TextEditingController();
  TextEditingController noTelpController = TextEditingController();

  Widget content() {
    return Container(
      decoration: BoxDecoration(
        color: kWhiteColor,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                margin: EdgeInsets.symmetric(vertical: 10),
                child: Icon(
                  Icons.token,
                  size: 48,
                  color: kTextOrangeColor,
                ),
              ),
              Container(
                  margin: EdgeInsets.symmetric(vertical: 10),
                  child: Text(
                    "Supply",
                    style: blackTextStyleInter.copyWith(
                        fontSize: 32, fontWeight: bold),
                  )),
            ],
          ),
          Padding(
              padding: const EdgeInsets.only(
                left: defaultMargin,
                right: defaultMargin,
                top: defaultMargin,
              ),
              child: Container(
                child: TextField(
                  keyboardType: TextInputType.text,
                  controller: namaBarangController,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.article),
                    labelText: 'Nama barang',
                    labelStyle: const TextStyle(
                      fontWeight: FontWeight.w400,
                      color: kPrimaryColor,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    hintText: 'Type nama barang',
                    hintStyle: const TextStyle(
                      color: kSearchColor,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              )),
          Padding(
              padding: const EdgeInsets.only(
                left: defaultMargin,
                right: defaultMargin,
                top: defaultMargin,
              ),
              child: Container(
                child: TextField(
                  keyboardType: TextInputType.number,
                  controller: hargaController,
                  inputFormatters: <TextInputFormatter>[
                    FilteringTextInputFormatter.digitsOnly
                  ], // Only numbers can be entered
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.paid_outlined),
                    labelText: 'Harga barang',
                    labelStyle: const TextStyle(
                      fontWeight: FontWeight.w400,
                      color: kPrimaryColor,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    hintText: 'Type harga barang',
                    hintStyle: const TextStyle(
                      color: kSearchColor,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              )),
          Padding(
              padding: const EdgeInsets.only(
                  left: defaultMargin,
                  right: defaultMargin,
                  top: defaultMargin,
                  bottom: defaultMargin),
              child: Container(
                child: TextField(
                  keyboardType: TextInputType.number,
                  controller: stokController,
                  inputFormatters: <TextInputFormatter>[
                    FilteringTextInputFormatter.digitsOnly
                  ], // Only numbers can be entered
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.add_shopping_cart),
                    labelText: 'Stok barang',
                    labelStyle: const TextStyle(
                      fontWeight: FontWeight.w400,
                      color: kPrimaryColor,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    hintText: 'Type stok barang',
                    hintStyle: const TextStyle(
                      color: kSearchColor,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              )),
          GestureDetector(
            onTap: () {},
            child: Container(
              width: double.infinity,
              height: 60,
              margin: EdgeInsets.only(top: 20, right: 16, left: 16, bottom: 20),
              decoration: BoxDecoration(
                  color: kTextOrangeColor,
                  borderRadius: BorderRadius.circular(10)),
              child: Center(
                  child: Text("Simpan",
                      style: whiteTextStyleInter.copyWith(
                          fontSize: 16, fontWeight: bold),
                      textAlign: TextAlign.center)),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        context.read<RoutesCubit>().emit(RoutesMainPage(0));
        return false;
      },
      child: Scaffold(
        body: Stack(children: [
          Container(
            color: kPrimaryColor,
          ),
          SafeArea(child: content()),
        ]),
      ),
    );
  }
}
