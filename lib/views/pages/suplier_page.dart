part of 'page.dart';

class SuplierPage extends StatefulWidget {
  const SuplierPage({super.key});

  @override
  State<SuplierPage> createState() => _SuplierPageState();
}

class _SuplierPageState extends State<SuplierPage> {
  @override
  void initState() {
    //context.read<CoffeeCubit>().getCoffeeData();
    return super.initState();
  }

  Widget header() {
    return Padding(
      padding: const EdgeInsets.only(
        left: defaultMargin - 4,
        right: defaultMargin - 4,
        top: defaultRadius,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                child: Text(
                  "Supplier",
                  style: blackTextStyleInter.copyWith(
                    fontSize: 28,
                    fontWeight: bold,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Container(
            height: MyUtility(context).height / 18,
            width: double.infinity,
            margin: EdgeInsets.only(left: 4, right: 4, top: 10, bottom: 10),
            padding: EdgeInsets.only(left: 8, right: 8),
            decoration: BoxDecoration(
              color: kSearchColor,
              borderRadius: BorderRadius.circular(10),
            ),
            child: TextField(
              style: TextStyle(color: Colors.white),
              //onChanged: (query) => searchList(query),
              enableSuggestions: false,
              //  controller: _codeController,
              decoration: InputDecoration(
                prefixIcon: Icon(
                  Icons.search,
                  color: kPrimaryGreyColor,
                ),
                border: InputBorder.none,
                hintText: 'Search',
                hintStyle: greyTextStyleInter.copyWith(
                  fontSize: MyUtility(context).width / 24,
                  fontWeight: regular,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget contentTwo() {
    return Padding(
      padding: const EdgeInsets.only(
          left: defaultMargin - 4,
          right: defaultMargin - 4,
          top: defaultRadius,
          bottom: defaultRadius),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // SizedBox(
          //   height: MyUtility(context).height / 1.25,
          //   width: double.infinity,
          //   child: BlocBuilder<CoffeeCubit, CoffeeState>(
          //     builder: (context, state) {
          //       if (state is CoffeeGetSuccess) {
          //         if (state.result.isEmpty) {
          //           return Center(
          //             child: Column(
          //               mainAxisAlignment: MainAxisAlignment.center,
          //               children: [
          //                 const SizedBox(
          //                   width: 150,
          //                   height: 50,
          //                   child: Icon(
          //                     Icons.hourglass_empty,
          //                   ),
          //                 ),
          //                 Text(
          //                   'Data kosong',
          //                   style:
          //                       blackTextStyleInter.copyWith(fontWeight: bold),
          //                 ),
          //               ],
          //             ),
          //           );
          //         } else {
          //           return ListView.builder(
          //             shrinkWrap: true,
          //             padding: const EdgeInsets.only(top: 8),
          //             itemCount: state.result.length,
          //             itemBuilder: (context, index) {
          //               var data = state.result[index];
          //               final List fixedList =
          //                   Iterable<int>.generate(data.ingredients.length)
          //                       .toList();

          //               fixedList.map((idx) {
          //                 String val = data.ingredients[idx];
          //                 // print(val);
          //                 // print("tes");
          //               });
          //               // print(data.ingredients);
          //               return Padding(
          //                 padding: const EdgeInsets.fromLTRB(0, 0, 0, 16),
          //                 child: CoffeeListData(
          //                     img: data.image,
          //                     title: data.title,
          //                     description: data.description,
          //                     ingredients: data.ingredients),
          //               );
          //             },
          //           );
          //         }
          //       } else if (state is CoffeeGetFailed) {
          //         return Text(state.message);
          //       } else {
          //         return Container();
          //       }
          //     },
          //   ),
          // ),
        ],
      ),
    );
  }

  Widget buildFloatingActionButtonCustom() {
    return FloatingActionButton(
      backgroundColor: Colors.orange,
      child: Icon(Icons.add),
      onPressed: () async {
        context.read<RoutesCubit>().emit(RoutesAddSuplierPage());
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kWhiteColor,
      body: SafeArea(
        child: Stack(
          children: [
            ListView(
              children: [
                header(),
                contentTwo(),
              ],
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: Container(
                  margin: EdgeInsets.only(
                    bottom: 90,
                    right: 20,
                  ),
                  child: buildFloatingActionButtonCustom()),
            ),
          ],
        ),
      ),
    );
  }
}
